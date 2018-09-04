﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ImportExcel_AddTeachers : MyPermisionPage
{
    protected override void OnPreInit(EventArgs e)
    {
        MyPer = "AddTeachers";
        base.OnPreInit(e);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        ListView1.DataBind();
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        int add = 0, edit = 0;

        if (FileUpload1.HasFiles)
        {
            foreach (var file in FileUpload1.PostedFiles)
            {
                var extention = Path.GetExtension(file.FileName);
                if (extention == ".xlsx" || extention == ".xls")
                {
                    var path = "~/Excel/" + Guid.NewGuid() + extention;
                    FileUpload1.PostedFile.SaveAs(MapPath(path));

                    try
                    {
                        ExcelManager.addTeachers(path,out add,out edit);
                        lblSuccess.Text = "تم اضافة " + add + " معلم بنجاح  <br> تم تعديل " + edit + " معلم بنجاح ";
                        placeHolderSuccess.Visible = true;
                        placeHolderError.Visible = false;
                        ListView1.DataBind();

                    }
                    catch (Exception ex)
                {
                    var ee = ex;
                    ltrError.Text = "لقد حدث خطأ في ملف </strong> " + file.FileName + "</strong> الرجاء التأكد من الملفات المرفقة";
                    placeHolderSuccess.Visible = false;
                    placeHolderError.Visible = true;
                }
            }
                else
                {
                    ltrError.Text = "لقد حدث خطأ في ملف </strong> " + file.FileName + "</strong> الرجاء التأكد من امتداد الملف";

                    placeHolderSuccess.Visible = false;
                    placeHolderError.Visible = true;
                }
            }
        }
    }

    protected void ListView1_DataBinding(object sender, EventArgs e)
    {
        SchoolInformation info = new SchoolInformation();
        var schoolid = info.getId();

        OnlineSchoolEntities km = new OnlineSchoolEntities();
        var employeelist = (from k in km.Teachers where k.SchoolId == schoolid select k).ToList();
        ListView1.DataSource = employeelist;
    }

    protected void btnok_Click(object sender, EventArgs e)
    {
        placeHolderSuccess.Visible = false;
        placeHolderError.Visible = false;
    }
}