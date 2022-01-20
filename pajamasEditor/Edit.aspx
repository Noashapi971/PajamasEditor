<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Styles/myStyle.css" rel="stylesheet" type="text/css" />
    <meta charset="utf-8" />
    <title>מסיבת פיג'מות - עריכת הגדרות המשחק</title>
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
<body>
            <div id="container">
           <header>
            <!--קישור לדף עצמו כדי להתחיל את המשחק מחדש בלחיצה על הלוגו-->
            <a href="index.html">
                <img id="logo" src="images/LOGO.png" /><!--הלוגו של המשחק שלכם--><p id="logoName">מסיבת פיג'מות</p>
            </a>
            <!--תפריט הניווט בראש העמוד-->
                <ul class="horizontal">
                    <li style="left: 0px; top:0;" ><a style="left: 0px;" class="about">אודות</a></li>
                    <li style="left: 70px; top:0;"><a style="left: 70px;" class="howtoplay">איך משחקים?</a></li>
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
        <div class="editGameArea">
            <div class="generalDiv" >
             <span class="mybtn fill back">
                <asp:Button ID="Button1" runat="server" EnableViewState="true" Text="חזור למשחקים שלי" OnClick="return_Click" CssClass="mybtn mysubmit" />
            </span>
            </div>
            <div class="generalDivinner">
           <h1>עריכת משחק</h1>
         <div>
           <span id="LabelCounter2" class="charGameCount" style="margin-top: 28px; margin-right: 416px;">0/30</span>
           <p class="pEdit"><strong>שם המשחק</strong></p> 
            <asp:TextBox ID="gameNameTxt" runat="server" CharacterLimit="30" CharacterMin="1" item="2" CssClass="CharacterCount textEdit"></asp:TextBox>
         </div>
           <h2>הגבלת זמן לשאלה</h2>
            <asp:RadioButtonList ID="timeLimit" runat="server" EnableViewState="true" class="radio-toolbar" RepeatDirection="Horizontal" Width="319px" AutoPostBack="false">
                <asp:ListItem Value="20">20</asp:ListItem>
                <asp:ListItem Value="30">30</asp:ListItem>
                <asp:ListItem Value="45">45</asp:ListItem>
                <asp:ListItem Value="60">60</asp:ListItem>
                <asp:ListItem Value="00">ללא הגבלה</asp:ListItem>
            </asp:RadioButtonList>
            </div>
            <div style="display: flex;padding-top: 97px;padding-right: 31%;width: 561px;">
<%--                <div style="width: 600px; height: 100px; float: none; clear: both; margin: 2px auto;">--%>
                    <span class="mybtn fill save1">
                <asp:Button ID="Button2" runat="server"  Text="שמור" OnClick="save_Click" CssClass="mybtn mysubmit" />
                   </span>&nbsp;&nbsp;&nbsp;
                    <span class="mybtn fill save2">
                <asp:Button ID="Button3" runat="server"  Text="שמור והמשך ליצירת שאלות" OnClick="saveAnd_Click" CssClass="mybtn mysubmit" />
                   </span>
                </div>
                  <asp:Panel CssClass="Background" ID="return2" Visible="false" runat="server">
            <asp:Panel CssClass="deletePopUp" ID="return1" Visible="false" runat="server" Height="150px" Width="680px">
                <asp:Label ID="return" runat="server" Text="האם ברצונך לחזור למסך המשחקים שלי? השינויים שביצעת לא ישמרו "></asp:Label>
                &nbsp;
                    <br />
                <br />
                <br />
                <br />
                <span class="mybtn fill green">
                    <asp:Button ID="Button4" runat="server" Text="כן, חזור" OnClick="returnYes_Click" CssClass="mybtn mysubmit" />
                </span>
                <span class="mybtn fill red">
                    <asp:Button ID="Button5" runat="server" Text="ביטול" OnClick="returnNo_Click" CssClass="mybtn mysubmit" />
                </span>
            </asp:Panel>
        </asp:Panel>                  

            <br />
            <br />
            <br />
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/tree/game.xml" XPath="/RootTree/game"></asp:XmlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
