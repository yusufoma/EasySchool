﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="form20.aspx.cs" Inherits="infractions_نماذج_form20" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>نموذج 20</title>
    <link href="lib/lib/bootstrap.css" rel="stylesheet" />
    <link href="lib/lib/bootstrap-rtl.min.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <script src="../assets/global/arabicNumbers.js"></script>
        <style type="text/css" media="print">
    @page 
    {
        size:  auto;   /* auto is the initial value */
        margin: 0mm;  /* this affects the margin in the printer settings */
    }

    html
    {
        background-color: #FFFFFF; 
        margin: 0px;  /* this affects the margin on the html before sending to printer */
    }

    body
    {
        /*border: solid 1px blue ;*/
        margin: 10mm 15mm 10mm 15mm; /* margin you want for the content */
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container content" align="center">
               <div class="row sub-title">
                   <div class="col-xs-4">
                         <h4 style="font-weight:bold;">المملكة العربية السعودية</h4>
                         <h4 style="font-weight:bold;">وزارة التعليم (280)</h4>
                         <h4 style="font-weight:bold;">الإدارة العامة للتوجيه والإرشاد</h4>
                   </div>
                   <div class="col-xs-3">
                       <img src="image/logo.png" alt="logo">
                   </div>
                   <div class="col-xs-5">
                        <h5 style="font-weight:bold;">منطقة / محافظة : <asp:Literal ID="ltrGovernorate" runat="server"></asp:Literal></h5>
                        <h5 style="font-weight:bold;">المدرســـــــــــــة : <asp:Literal ID="ltrSchoolName" runat="server"></asp:Literal></h5>
                        <h5 style="font-weight:bold;">اليــــــــــــــــــوم : <asp:Literal ID="ltrDay" runat="server"></asp:Literal></h5>
                        <h5 style="font-weight:bold;">التــــــــــــــــاريخ : <asp:Literal ID="ltrDate" runat="server"></asp:Literal></h5>
                   </div>
               </div>
            <br />
            <div class="col-xs-12">
                       <h3 style="color:#009e9a;font-weight:900;">سري</h3>
                       <h3 style="font-weight:900;">إفادات إضافية</h3>
             </div>
            <div class="col-xs-12" style="text-align:right">
                <asp:RadioButton ID="RadioButton1" runat="server" Text="طالب/ة"/>
                <asp:RadioButton ID="RadioButton2" runat="server" Text="معلم/ة" />
                <asp:RadioButton ID="RadioButton3" runat="server" Text="أخرى" /><br />
            </div>
            <div class="row roww">
                <div class="col-xs-12">
                    <h5>....................................................................................................................................................................</h5>
                    <h5>....................................................................................................................................................................</h5> 
                    <h5>....................................................................................................................................................................</h5>
                    <h5>....................................................................................................................................................................</h5>
                    <h5>....................................................................................................................................................................</h5> 
                    <h5>....................................................................................................................................................................</h5>
                    <h5>....................................................................................................................................................................</h5> 
                    <h5>....................................................................................................................................................................</h5> 
                    <h5>....................................................................................................................................................................</h5>
                    <h5>....................................................................................................................................................................</h5>
                    <h5>....................................................................................................................................................................</h5> 
                    <h5>....................................................................................................................................................................</h5>
                    <h5>....................................................................................................................................................................</h5>
                    <h5>....................................................................................................................................................................</h5> 
                    <h5>....................................................................................................................................................................</h5>
                    <h5>....................................................................................................................................................................</h5> 
                </div>
                
        <div class="row">
            <div class="col-xs-1">
            </div>
             <div class="col-xs-7" style="text-align:right" >
                 <br /><br /><br />
                 <h5><b>( تصور حسب الحاجة للقضية )</b></h5>
            </div>
                <div class="col-xs-4"style="text-align:right" >
                     <h5 style="text-align:right"><b>الاسم:</b> <asp:Literal ID="ltrName" runat="server" Text="....................................."></asp:Literal></h5>
                     <h5 style="text-align:right"><b>التوقيع:</b> ....................................</h5>
                     <h5 style="text-align:right"><b>التاريخ: &shy; &shy; &shy; &shy; / &shy; &shy; &shy; &shy;  / &shy; &shy; &shy; 14هـ</b></h5>
                </div>
           </div>
       </div>
        </div>
    </form>
</body>
</html>
