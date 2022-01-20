<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Styles/myStyle.css" rel="stylesheet" type="text/css" />
    <meta charset="utf-8" />
    <title>מסיבת פיג'מות - כניסה לעורך</title>
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
    <link rel="icon" href="images/favicon.png" />
    <%--CSS--%> 
    <%--<link href="Styles/reset.css" rel="stylesheet" type="text/css" />--%>
    <link href="Styles/myStyle.css" rel="stylesheet" type="text/css" />
        <%--הפניה לקובץ jquary--%>
    <script src="Jscripts/jquery-1.12.0.min.js"></script>
     <%--הפניה לקובץ JS שלנו--%>
     <script src="Jscripts/JavaScript.js"></script>
</head>
<body class="login">
<%--        <asp:Image ID="Image1" ImageUrl="~/images/loginbackground.png" CssClass="login" runat="server"/>--%>
        <div id="container">
           <header>
            <!--קישור לדף עצמו כדי להתחיל את המשחק מחדש בלחיצה על הלוגו-->
            <a href="index.html">
                <img id="logo" src="images/LOGO.png" /><!--הלוגו של המשחק שלכם--><p id="logoName">מסיבת פיג'מות</p>
            </a>
            <!--תפריט הניווט בראש העמוד-->
                <ul class="horizontal">
                    <li style="left: 0px; top:0;" ><a style="left: 0px;" class="about">אודות</a></li>
                    <li style="left: 50px; top:0;"><a style="left: 70px;" class="howtoplay">איך משחקים?</a></li>
                    <li style="left: 160px; top:0;"><a style="left: 200px;" class="" href="index.html">למשחק</a></li>
                </ul>
        </header>
        <!--<!-אודות-->
        <div id="aboutDiv" class="about_img popUp bounceInDown hide">
            <a class="closeAbout">
                <img id="exit1" src="images/x.png" class="exit"/>
            </a>
                <div class="telemLink">
                    <a href="https://www.hit.ac.il/telem/overview">הפקולטה לטכנולוגיות למידה</a>
                </div>
            <p id="attribute">
                בחלק מהאובייקטים ישנו שימוש באתר<a href="https://www.freepik.com/"> freepik</a>
            </p>
        </div>
        <!--איך משחקים-->
        <div id="howToPlayDiv" class="howtoplay_img popUp bounceInDown hide">
            <a class="closeHowToPlay">
                <img id="exit2" src="images/x.png" class="exit"/>
            </a>
            </div>
       </div>
    <form id="form1" runat="server">
        <div>
        <div class="loginDIV">
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="form-control-sm" Text="שם משתמש"></asp:Label>
                <asp:TextBox ID="usernameTB" CssClass="form-control loginTxt" runat="server" Width="230"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="form-control-sm" Text="סיסמה"></asp:Label>
                <asp:TextBox ID="passwordTB" TextMode="Password" runat="server" CssClass="form-control loginTxt" Width="230"></asp:TextBox>
            </div>
            <div class="form-group">
                <span id="myspan" style="font-size: 14px;">שם משתמש: admin | סיסמה: telem</span>
            </div>
            <div class="form-group">
                <asp:Button ID="loginBtn" Text="כניסה" CssClass="loginBtn" runat="server" OnClick="loginBtn_Click" />
            </div>
            <asp:Label ID="errorMsg" Text="" Visible="false" class="errorMSG" runat="server" />
            <script>
                $(document).ready(function () {
                    $(':input[type="submit"]').prop('disabled', true); //
                    $('#usernameTB').keyup(function () { //בדיקה בהקלדה על הטקסטבוקס
                        if ($(this).val() != '' && $('#passwordTB').val() != '') { //בדיקה אם התיבה לא ריקה
                            $(':input[type="submit"]').prop('disabled', false); //ביטול הDISABLED
                            $(':input[type="submit"]').addClass("btn-info"); //להחליף לכפתור כחול
                            $(':input[type="submit"]').removeClass("btn-secondary");
                        }
                        else { //התיבה ריקה
                            $(':input[type="submit"]').prop('disabled', true); //
                            $(':input[type="submit"]').removeClass("btn-info");
                            $(':input[type="submit"]').addClass("btn-secondary");
                        }
                    });
                    $('#passwordTB').keyup(function () {
                        if ($(this).val() != '' && $('#usernameTB').val() != '') {
                            $(':input[type="submit"]').prop('disabled', false);
                            $(':input[type="submit"]').addClass("btn-info");
                            $(':input[type="submit"]').removeClass("btn-secondary");
                        }
                        else {
                            $(':input[type="submit"]').prop('disabled', true);
                            $(':input[type="submit"]').removeClass("btn-info");
                            $(':input[type="submit"]').addClass("btn-secondary");
                        }
                    });
                });
            </script>
        </div> 
        </div>
    </form>
</body>
</html>
