﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="form39.aspx.cs" Inherits="SchoolForms_form39" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>نموذج 39</title>
    <link href="lib/lib/bootstrap.css" rel="stylesheet" />
    <link href="lib/lib/bootstrap-rtl.min.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <script src="../assets/global/arabicNumbers.js"></script>
    <style type="text/css" media="print">
        @page {
            size: auto; /* auto is the initial value */
            margin: 0mm; /* this affects the margin in the printer settings */
        }

        html {
            background-color: #FFFFFF;
            margin: -4%; /* this affects the margin on the html before sending to printer */
        }

        body {
            /*border: solid 1px blue ;*/
            margin: 10mm 15mm 10mm 15mm; /* margin you want for the content */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row title">
                <h3>نموذج رقم (39)</h3>
            </div>
            <div class="container content" align="center">
                <div class="row sub-title">
                    <div class="col-xs-6">
                        <h5>اسم النموذج : سجل استعارة كتب للطلاب</h5>
                    </div>
                    <div class="col-xs-6">
                        <h5>رمز النموذج : (و.م.ع.ن-07-01)</h5>
                    </div>
                </div>
                <div class="row fo7 text-right">
                    <div class="row">
                        <div class="col-xs-12">
                            <h5>للعام الدراسي
                                <asp:Literal ID="ltrYear" runat="server" Text="&shy; &shy; &shy; &shy; &shy; &shy; &shy; 14هـ"></asp:Literal>
                                /
                                <asp:Literal ID="ltrSemester" runat="server" Text="&shy; &shy; &shy;  الفصل (    )"></asp:Literal>
                            </h5>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row table46">
                    <table style="width: 90%">
                        <thead>
                            <tr>
                                <th class="text-center" style="width: 3%; font-size: 15px">م</th>
                                <th class="text-center" style="font-size: 15px">عنوان الكتاب</th>
                                <th class="text-center" style="font-size: 15px">اسم المؤلف</th>
                                <th class="text-center" style="font-size: 15px">تاريخ الاستعارة</th>
                                <th class="text-center" style="font-size: 15px">اسم الطالب</th>
                                <th class="text-center" style="font-size: 15px">الصف</th>
                                <th class="text-center" style="font-size: 15px">التوقيع</th>
                                <th class="text-center" style="font-size: 15px">تاريخ الاعادة</th>
                                <th class="text-center" style="font-size: 15px">توقيع أمين المركز</th>
                            </tr>
                        </thead>
                        <asp:ListView ID="lstBorrow" runat="server" OnDataBinding="lstBorrow_DataBinding">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%# getCounter() %>
                                    </td>
                                    <td>
                                        <%# Eval("bookname") %>
                                    </td>
                                    <td>
                                        <%# Eval("auther") %>
                                    </td>
                                    <td>
                                        <%#MyDate.getDate(Eval("DateBorrow").ToString())%>
                                    </td>
                                    <td>
                                        <%# Eval("Name") %>
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <%#MyDate.getDate(Eval("DateReturn").ToString())%>
                                    </td>
                                    <td></td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>



                    </table>
                </div>
                <div class="row fo7 text-right">
                    <div class="row">
                        <div class="col-xs-6">

                            <h5>أمين مركز مصادر التعلم :
                                <asp:Literal ID="ltrSecretaryResourceCenter" runat="server" Text="................."></asp:Literal></h5>
                        </div>
                    <div class="col-xs-6">

                        <h5>التوقيع : ...........................</h5>

                    </div>
                </div>
            </div>
        </div>
        </div>
    </form>

</body>
</html>
