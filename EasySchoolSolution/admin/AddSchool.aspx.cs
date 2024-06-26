﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddSchool : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlSchooltype.DataBind();
            ddlStudyType.DataBind();
        }
            }

    protected void btnAdd_Click(object sender, EventArgs e)
    {

        OnlineSchoolEntities km = new OnlineSchoolEntities();

        var identity = txtIdentity.Text;
        var isExist= Membership.GetUser(txtIdentity.Text) !=null;
        if (!isExist)
        {
            var schoolId =int.Parse(txtSchoolId.Text);
            var school = (from k in km.Schools where k.Id == schoolId select k).FirstOrDefault();
            if (school == null)
            {
                string password = "ES"+txtIdentity .Text;
                var newUser = Membership.CreateUser(txtIdentity.Text, password, "");
                Roles.AddUserToRole(newUser.UserName, "Employee");
                Roles.AddUserToRole(newUser.UserName, "Manager");

                school = new School();
                school.Id = schoolId;
                school.Name = txtSchoolName.Text;
                school.Area = txtArea.Text;
                school.IsActive = true;
                school.IsDeleted = false;
                school.Address = txtaddress.Text;
                school.EducationalLevel = txtEducationalLevel.Text;
                school.Email = txtemail.Text;

                if(!String.IsNullOrEmpty(txtGovernmentBuildingsNo.Text))
                school.GovernmentBuildingsNo = int.Parse(txtGovernmentBuildingsNo.Text);
                school.Office = txtOffice.Text;
                if (!String.IsNullOrEmpty(txtRentedBuildingsNo.Text))
                    school.RentedBuildingsNo = int.Parse(txtRentedBuildingsNo.Text);
                school.ThePhone = txtphone.Text;
                if (!String.IsNullOrEmpty(txttotalclass.Text))
                    school.TotalClass = int.Parse(txttotalclass.Text);
                if (!String.IsNullOrEmpty(txttotalStaff.Text))
                    school.TotalStaff = int.Parse(txttotalStaff.Text);
                if (!String.IsNullOrEmpty(txttotalStudent.Text))
                    school.TotalStudents= int.Parse(txttotalStudent.Text);

                school.YearFounded = txtYearFounded.Text;
           
                    school.Type = int.Parse(ddlStudyType.SelectedValue);

                    school.Gender = int.Parse(ddlSchooltype.SelectedValue);

                    school.NumberOfSecretary = int.Parse(ddlSecretaryNumber.SelectedValue);
                school.OutcomingCode = "-/-";
                Employee emp = new Employee();
                emp.Name = txtAdminName.Text;
                //   emp.IdentityNumber = txtIdentity.Text;
                   emp.IdentityNumber = txtIdentity .Text;
                emp.Mobile = txtMobileNumber.Text;
                emp.JobId = 1;
                emp.SchoolId = schoolId;

                if (fuImage.HasFiles)
                {
                    var file = fuImage.PostedFile;
                    if (fuImage.PostedFile.ContentType.Contains("image"))
                    {
                        String[] sp = file.FileName.Split('.');
                        string fname = Guid.NewGuid() + "." + sp[sp.Length - 1];
                        file.SaveAs(MapPath("~/images/SchoolsLogoes/" + fname));
                        school.logo = "images/SchoolsLogoes/" + fname;
                    }
                }

                km.Employees.Add(emp);
                km.Schools.Add(school);
                km.SaveChanges();

                var msg = (from k in km.Settings where k.KKey == "newUser" select k).FirstOrDefault();
                var messagetext = String.IsNullOrEmpty(msg.KVal) ? msg.KVal : msg.DefaultValue;
               
                messagetext = string.Format(messagetext, txtIdentity.Text, password);
                Mobile.MobileSend(messagetext,txtMobileNumber.Text);
            ClientScript.RegisterStartupScript(this.GetType(), "openModal", "<script> addSuccess('  تمت اضافة المدرسة بنجاح'); </script>", false);
            }
            else
            {
               ClientScript.RegisterStartupScript(this.GetType(), "openModal", "<script> addfalied(' عذرا! الرقم الوزاري المدخل موجود مسبقا.'); </script>", false);
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "openModal", "<script> addfalied(' عذرا! اسم المستخدم المدخل موجود مسبقا.'); </script>", false);
        }
    }
}