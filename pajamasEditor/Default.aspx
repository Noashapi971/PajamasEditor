<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Styles/myStyle.css" rel="stylesheet" type="text/css" />
    <meta charset="utf-8" />
    <title>מסיבת פיג'מות - המשחקים שלי</title>
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <link rel="icon" href="images/favicon.png" />
    <%--CSS--%>
    <%--<link href="Styles/reset.css" rel="stylesheet" type="text/css" />--%>
    <link href="styles/myStyle.css" rel="stylesheet" type="text/css" />
    <%--הפניה לקובץ jquary--%>
    <script src="Jscripts/jquery-1.12.0.min.js"></script>
    <%--הפניה לקובץ JS שלנו--%>
    <script src="Jscripts/JavaScript.js"></script>
</head>
<body>
    <%--         <asp:Image ID="Image2" ImageUrl="~/images/BG2.png" style="z-index:-3; width: 1280px; height: 720px;" runat="server"/>--%>

<%--    <asp:Image ID="Image1" ImageUrl="~/images/pillowBG.png" class="imgBGdefault" runat="server" />--%>

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
        <div class="gameArea">
            <h1>המשחקים שלי</h1>
            &nbsp;
           <div style="padding-right: 186px; width: 280px; display: inline-block; height: 40px;">
               <label style="font-size: 35px; font-size: 35px;">הקלד שם משחק</label>
           </div>
            <div class="GameNMtooltip" style="display: inline-block; margin-right: -25px;">
                <span class="mytooltiptext">שם המשחק יכיל בין 1-30 תווים</span>
                <img src="images/info.png" width="20" height="20" style="padding-right: 8px;" />
            </div>
            <div style="margin-top: 60px; margin-right: 195px;">
                <span id="LabelCounter1" runat="server" class="charCount">0/30</span>
                <asp:TextBox ID="addNameTB" runat="server" CharacterLimit="30" CharacterMin="1" item="1" CssClass="CharacterCount GameName" Height="35px" Width="270px"></asp:TextBox>
                &nbsp;&nbsp;
           <span class="mybtn fill pink button-blocked">
               <asp:Button ID="createGame" runat="server" Text="יצירת משחק" OnClick="createGame_Click" CssClass="mybtn mysubmit" />
           </span>
            </div>
                        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/tree/game.xml" XPath="/RootTree/game"></asp:XmlDataSource>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;
        <br />
            <div id="scrollGame">
                <asp:GridView DataSourceID="XmlDataSource1" ID="GridView2" class="myGridClass" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" Width="900px" BorderStyle="Solid" border-color="black" ForeColor="Black" BorderWidth="2px" CellPadding="3" GridLines="Horizontal" OnRowCommand="GridView2_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="קוד המשחק">
                            <ItemTemplate>
                                <asp:Label ID="myGameCode" runat="server" Text='<%#XPathBinder.Eval(Container.DataItem, "@GameCode").ToString()%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="שם המשחק">
                            <ItemTemplate>
                                <asp:Label ID="myGameName" runat="server" Text='<%#Server.UrlDecode(XPathBinder.Eval(Container.DataItem, "GameSubject").ToString())%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="מספר השאלות">
                            <ItemTemplate>
                                <asp:Label ID="myQuestionCount" runat="server" Text='<%#XPathBinder.Eval(Container.DataItem, "count(questions/question)").ToString()%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                           <HeaderTemplate>
                               <span>הגדרות משחק</span>
                                <div class="mytooltip1">
                                  <span class="mytooltiptext">עריכת הגדרות המשחק</span>
                                  <img src="images/info.png" width="12" height="12"  />
                                </div>
                            </HeaderTemplate> 
                            <ItemTemplate>
                                <asp:ImageButton ID="gameSetting" runat="server" theItemId='<%#XPathBinder.Eval(Container.DataItem,"@GameCode")%>' CommandName="editGenerals" ImageUrl="~/images/settings.png" Width="19" Height="19" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                              <HeaderTemplate>
                               <span>עריכה</span>
                                <div class="mytooltip2">
                                  <span class="mytooltiptext">עריכת שאלות המשחק</span>
                                  <img src="images/info.png" width="12" height="12"  />
                                </div>
                            </HeaderTemplate> 
                            <ItemTemplate>
                                <asp:ImageButton ID="myEdit" theItemId='<%#XPathBinder.Eval(Container.DataItem,"@GameCode")%>' runat="server" CommandName="editRow" ImageUrl="~/images/editpage.png" Width="15" Height="15" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="מחיקה">
                            <ItemTemplate>
                                <asp:ImageButton ID="myDelete" theItemId='<%#XPathBinder.Eval(Container.DataItem,"@GameCode")%>' runat="server" CommandName="deleteRow" ImageUrl="~/images/delete.png" Width="15" Height="15" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                               <HeaderTemplate>
                               <span>פרסום המשחק</span>
                                <div class="mytooltip3">
                                  <span class="mytooltiptext">מספר השאלות הנדרש לפרסום הוא בין 8-15 שאלות, לא ניתן לפרסם משחק עם 11 שאלות</span>
                                  <img src="images/info.png" width="12" height="12"  />
                                </div>
                            </HeaderTemplate> 
                            <ItemTemplate>
                                  <asp:CheckBox ID="publishCheckbox" CssClass="publishCheck" AutoPostBack="true" OnCheckedChanged="IsPublish_CheckedChanged" runat="server" Checked='<%#Convert.ToBoolean(XPathBinder.Eval(Container.DataItem,"@isPublish"))%>' theItemId='<%#XPathBinder.Eval(Container.DataItem,"@GameCode")%>'/>                                
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        <asp:Panel CssClass="Background" ID="DeleteConfPopUp" Visible="false" runat="server">
            <asp:Panel CssClass="deletePopUp" ID="DeleteConfPopUp2" runat="server" Height="150px" Width="680px">
                <asp:Label ID="LBLpopup" runat="server" Text="<strong>מחיקת משחק</strong><br />האם תרצה למחוק את המשחק "></asp:Label>
                &nbsp;
                    <br />
                <br />
                <br />
                <br />
                <span class="mybtn fill green">
                    <asp:Button ID="OkBtn" runat="server" Text="כן, מחק" OnClick="OkBtn_Click" CssClass="mybtn mysubmit" />
                </span>
                <span class="mybtn fill red">
                    <asp:Button ID="ExitDeleteConf" runat="server" Text="ביטול" OnClick="ExitDeleteConf_Click" CssClass="mybtn mysubmit" />
                </span>
                &nbsp;
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
