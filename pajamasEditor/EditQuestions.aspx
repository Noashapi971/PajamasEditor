<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditQuestions.aspx.cs" Inherits="Gridview_noashapira_elliskulmis_arielweinblat_class5_Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>מסיבת פיג'מות - עריכת שאלות המשחק</title>
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
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
                <li style="left: 0px; top: 0;"><a style="left: 0px;" class="about">אודות</a></li>
                <li style="left: 70px; top: 0;"><a style="left: 70px;" class="howtoplay">איך משחקים?</a></li>
                <li style="left: 160px; top: 0;"><a style="left: 200px;" class="" href="login.aspx">למשחק</a></li>
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
        <asp:HiddenField ID="dirty" runat="server" />
        <div class="gameArea">
            <div class="questiondiv">
                <div runat="server" id="questionDiv">
                    <h2 class="queHeadline"><strong>עריכת שאלות - נושא המשחק: </strong></h2>
                    <h4 id="gameSubject" runat="server" style="margin-right: 313px;margin-top: -49px;font-size: 23px; color: darkcyan;"></h4>
                    <h3 class="title1">השאלה - טקסט/טקסט ותמונה</h3>
                    <div id="questionInputs" class="question-img-actions">
                        <asp:TextBox ID="questionTextBox" runat="server" Rows="2" CharacterLimit="100" CharacterMin="1" TextMode="MultiLine" item="3" CssClass="questionCount mainTextBox"></asp:TextBox>
                        <span id="LabelCounter3" class="questionCount">0/100</span>
                        <asp:FileUpload ID="FileUploadque" runat="server" AutoPostBack="false" />
                        <div class="image-action-container">
                            <asp:ImageButton ID="queImagebtn" CssClass="image-action available" runat="server" Height="40px" ImageUrl="~/images/add.png" Style="margin-top: 0px" Width="40px" OnClientClick="openFileUploader0(); return false;"/>
                            <asp:ImageButton ID="queImagesize" CssClass="hidesize image-action" runat="server" ImageUrl="~/images/glass.png" Width="18px" Height="19px" OnClientClick="zoomImage('#queImagebtn'); return false;" />
                            <asp:ImageButton ID="queImagedelete" CssClass="hidedelete image-action" runat="server" ImageUrl="~/images/delete.png" Width="18px" Height="20px" OnClientClick="deleteImage('#queImagebtn', '#queImagesize', '#queImagedelete');" />
                        </div>

                    </div>
                </div>

                <div style="margin-top: 14px;margin-bottom: 10px;">
                    <p class="title3">
                        ליצירת משחק יש ליצור בין 8-15 שאלות<br />
                        לא ניתן ליצור 11 שאלות
                    </p>
                    <p class="title2"><strong>מספר אפשרויות מענה</strong></p>
                    <asp:RadioButtonList ID="answerChoises" runat="server" RepeatDirection="Horizontal" CssClass="radioLimit-toolbar" EnableViewState="true" onclick="onRadioChange();">
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div>
                    <div class="title3">
                        יש לבחור בטקסט או תמונה 
                        <span class="mytooltip3">
                            <span class="mytooltiptext">סוגי הקבצים שניתן להעלות:JPG ו- PNG</span>
                            <img src="images/info.png" width="12" height="12" />
                        </span>
                        ולסמן את התשובה הנכונה
                    </div><br />
                    <asp:Panel runat="server" ID="answer1" CssClass="answer">
                        <asp:RadioButton ID="radAns1" runat="server" GroupName="AnswersGroup"/>
                        <asp:TextBox ID="ans1" runat="server" onkeyup="onTextChange(this,ImageforUpload1)" CharacterLimit="65" TextMode="MultiLine" CharacterMin="1" item="4" CharacterForLabel="ansLimit1" CssClass="CharacterCount TextAns"></asp:TextBox>
                        <span id="LabelCounter4" class="charCount">0/65</span>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <div id="image1" class="image-action-container">
                            <asp:ImageButton ID="ImageforUpload1" CssClass="image-upload image-action" AutoPostBack="false" runat="server" ImageUrl="~/images/add.png" OnClientClick="openFileUploader1(); return false;" />
                            <asp:ImageButton ID="imagesize1" CssClass="image-action glass" runat="server" ImageUrl="~/images/glass.png" OnClientClick="zoomImage('#ImageforUpload1'); return false;" />
                            <asp:ImageButton ID="imagedelete1" CssClass="hidedelete image-action trash" runat="server" ImageUrl="~/images/delete.png" />
                        </div>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="answer2" CssClass="answer">
                        <asp:RadioButton ID="radAns2" runat="server" GroupName="AnswersGroup" />
                        <asp:TextBox ID="ans2" runat="server" onkeyup="onTextChange(this,ImageforUpload2)" CharacterLimit="65" TextMode="MultiLine" CharacterMin="1" item="5" CharacterForLabel="ansLimit2" CssClass="CharacterCount TextAns"></asp:TextBox>&nbsp;&nbsp;
                   <span id="LabelCounter5" class="charCount">0/65</span>
                        <asp:FileUpload ID="FileUpload2" runat="server" />
                        <div class="image-action-container">
                            <asp:ImageButton ID="ImageforUpload2" CssClass="image-upload image-action" runat="server" AutoPostBack="false" ImageUrl="~/images/add.png" OnClientClick="openFileUploader2(); return false;" />
                            <asp:ImageButton ID="imagesize2" CssClass="hidesize image-action glass" runat="server" ImageUrl="~/images/glass.png" OnClientClick="zoomImage('#ImageforUpload2'); return false;" />
                            <asp:ImageButton ID="imagedelete2" CssClass="hidedelete image-action trash" runat="server" ImageUrl="~/images/delete.png" />
                        </div>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="answer3" CssClass="answer">
                        <asp:RadioButton ID="radAns3" runat="server" GroupName="AnswersGroup" />
                        <asp:TextBox ID="ans3" runat="server" onkeyup="onTextChange(this,ImageforUpload3)" CharacterLimit="65" TextMode="MultiLine" CharacterMin="1" item="6" CharacterForLabel="ansLimit3" CssClass="CharacterCount TextAns"></asp:TextBox>&nbsp;&nbsp;
                    <span id="LabelCounter6" class="charCount">0/65</span>
                        <asp:FileUpload ID="FileUpload3" runat="server" />
                        <div class="image-action-container">
                            <asp:ImageButton ID="ImageforUpload3" CssClass="image-upload image-action" runat="server" AutoPostBack="false" ImageUrl="~/images/add.png" OnClientClick="openFileUploader3(); return false;" />
                            <asp:ImageButton ID="imagesize3" CssClass="hidesize image-action glass" runat="server" ImageUrl="~/images/glass.png" OnClientClick="zoomImage('#ImageforUpload3'); return false;" />
                            <asp:ImageButton ID="imagedelete3" CssClass="hidedelete image-action trash" runat="server" ImageUrl="~/images/delete.png" />
                        </div>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="answer4" CssClass="answer">
                        <asp:RadioButton ID="radAns4" runat="server" GroupName="AnswersGroup" />
                        <asp:TextBox ID="ans4" runat="server" onkeyup="onTextChange(this,ImageforUpload4)" CharacterLimit="60" TextMode="MultiLine" CharacterMin="1" item="7" CharacterForLabel="ansLimit4" CssClass="CharacterCount TextAns"></asp:TextBox>&nbsp;&nbsp;
                    <span id="LabelCounter7" class="charCount">0/60</span>
                        <asp:FileUpload ID="FileUpload4" runat="server" />
                        <div class="image-action-container">
                            <asp:ImageButton ID="ImageforUpload4" CssClass="image-upload image-action" runat="server" AutoPostBack="false" ImageUrl="~/images/add.png" OnClientClick="openFileUploader4(); return false;" />
                            <asp:ImageButton ID="imagesize4" CssClass="hidesize image-action glass" runat="server" ImageUrl="~/images/glass.png" OnClientClick="zoomImage('#ImageforUpload4'); return false;" />
                            <asp:ImageButton ID="imagedelete4" CssClass="hidedelete image-action trash" runat="server" ImageUrl="~/images/delete.png" />
                        </div>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="answer5" CssClass="answer hide">
                        <asp:RadioButton ID="radAns5" runat="server" GroupName="AnswersGroup" />
                        <asp:TextBox ID="ans5" runat="server" onkeyup="onTextChange(this,ImageforUpload5)" CharacterLimit="65" TextMode="MultiLine" CharacterMin="1" item="8" CharacterForLabel="ansLimit5" CssClass="CharacterCount TextAns"></asp:TextBox>&nbsp;&nbsp;
                   <span id="LabelCounter8" class="charCount">0/65</span>
                        <asp:FileUpload ID="FileUpload5" runat="server" />
                        <div class="image-action-container">
                            <asp:ImageButton ID="ImageforUpload5" CssClass="image-upload image-action" runat="server" AutoPostBack="false" ImageUrl="~/images/add.png" OnClientClick="openFileUploader5(); return false;" />
                            <asp:ImageButton ID="imagesize5" CssClass="hidesize image-action glass" runat="server" ImageUrl="~/images/glass.png" OnClientClick="zoomImage('#ImageforUpload5'); return false;" />
                            <asp:ImageButton ID="imagedelete5" CssClass="hidedelete image-action trash" runat="server" ImageUrl="~/images/delete.png" />
                        </div>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="answer6" CssClass="answer hide">
                        <asp:RadioButton ID="radAns6" runat="server" GroupName="AnswersGroup" />
                        <asp:TextBox ID="ans6" runat="server" onkeyup="onTextChange(this,ImageforUpload6)" CharacterLimit="65" TextMode="MultiLine" CharacterMin="1" item="9" CharacterForLabel="ansLimit6" CssClass="CharacterCount TextAns"></asp:TextBox>&nbsp;&nbsp;
                    <span id="LabelCounter9" class="charCount">0/65</span>
                        <asp:FileUpload ID="FileUpload6" runat="server" />
                        <div class="image-action-container">
                            <asp:ImageButton ID="ImageforUpload6" CssClass="image-upload image-action" runat="server" AutoPostBack="false" ImageUrl="~/images/add.png" OnClientClick="openFileUploader6(); return false;" />
                            <asp:ImageButton ID="imagesize6" CssClass="hidesize image-action glass" runat="server" ImageUrl="~/images/glass.png" OnClientClick="zoomImage('#ImageforUpload6'); return false;" />
                            <asp:ImageButton ID="imagedelete6" CssClass="hidedelete image-action trash" runat="server" ImageUrl="~/images/delete.png" />
                        </div>
                    </asp:Panel>
                </div>
                <div style="margin-top: 10px; margin-right: 20px;">
                    <div style="display: inline;">
                        <span class="mybtn fill saveQue">
                            <asp:Button ID="saveQuestion" runat="server" EnableViewState="true" Text="שמירה" OnClick="saveButton" CssClass="mybtn mysubmit button-blocked" />
                        </span>
                    </div>
                    <div style="display: inline;">
                        <span class="mybtn fill deleteFiellds">
                            <asp:Button ID="cleanInputing" runat="server" EnableViewState="true" Text="איפוס שדות" OnClick="clean_click" CssClass="mybtn mysubmit" />
                        </span>
                    </div>
                </div>
            </div>
            <div class="gridDiv">
                <span class="mybtn fill back1">
                    <asp:Button ID="returnBT" runat="server" EnableViewState="true" Text="חזור למשחקים שלי" OnClick="return_click" CssClass="mybtn mysubmit"/>
                </span>
                <p class="title1">מאגר השאלות</p>
                <br />
                <asp:Label ID="questionInfo" runat="server" Text="(מינימום 8 לפרסום)"></asp:Label>
                <h4 id="questionCounttext" runat="server" style="margin-right: 337px;margin-top: -23px;"></h4>
                <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/tree/game.xml" XPath="/RootTree/game/questions/question[@id]"></asp:XmlDataSource>
                <div id="scrollquestions">
                    <asp:GridView DataSourceID="XmlDataSource2" ID="GridView1" OnDataBound="GridView1_DataBound" runat="server" Width="420" CssClass="myGridQClass" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" OnRowCommand="GridView1_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="שאלה">
                                <ItemTemplate>
                                    <asp:Label ID="questionNameLbl" runat="server" Text='<%#Server.UrlDecode(XPathBinder.Eval(Container.DataItem, "questionText").ToString())%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="עריכה">
                                <ItemTemplate>
                                    <asp:ImageButton ID="editQuestiontBtn" runat="server" CommandName="editQuestion" ImageUrl="~/images/editpage.png" Width="15" Height="15" theItemId='<%#XPathBinder.Eval(Container.DataItem,"@id")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="מחיקה">
                                <ItemTemplate>
                                    <asp:ImageButton ID="deleteQuestiontBtn" runat="server" CommandName="deleteQuestion" ImageUrl="~/images/delete.png" Width="15" Height="15" theItemId='<%#XPathBinder.Eval(Container.DataItem,"@id")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <asp:Panel CssClass="Background" ID="DeleteConfPopUpQuestion" Visible="false" runat="server">
            <asp:Panel CssClass="deletePopUp" ID="DeleteConfPopUpQuestion2" runat="server" Height="150px" Width="680px">
                <asp:Label ID="LBLpopup" runat="server" Text="<strong>מחיקת שאלה</strong><br />האם תרצה למחוק את השאלה? "></asp:Label>
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
                <asp:Panel CssClass="Background" ID="return2" Visible="false" runat="server">
            <asp:Panel CssClass="deletePopUp" ID="return1" Visible="false" runat="server" Height="150px" Width="680px">
                <asp:Label ID="return" runat="server" Text="האם ברצונך לחזור למסך המשחקים שלי? השינויים שביצעת לא ישמרו "></asp:Label>
                &nbsp;
                    <br />
                <br />
                <br />
                <br />
                <span class="mybtn fill green">
                    <asp:Button ID="cancelRT" runat="server" Text="כן, חזור" OnClick="returnYes_Click" CssClass="mybtn mysubmit" />
                </span>
                <span class="mybtn fill red">
                    <asp:Button ID="okRT" runat="server" Text="ביטול" OnClick="returnNo_Click" CssClass="mybtn mysubmit" />
                </span>
            </asp:Panel>
        </asp:Panel>
        <div class="hide" id="zoombackground">
            <asp:ImageButton ID="cloesBigImg" OnClientClick="exitImage(); return false;" CssClass="popUpX" runat="server" ImageUrl="~/images/x.png" />
            <div id="zoomPopUp" class="zoomPopUp">
                <asp:Image CssClass="ImgzoomBG" ImageUrl="~/images/pillow.png" ID="ImgBG" runat="server" />
                <asp:Image ID="imageBig" runat="server" Width="300px" Height="200px" CssClass="imageBigPop" />
            </div>
        </div>
    </form>
</body>
</html>
