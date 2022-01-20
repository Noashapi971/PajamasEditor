using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using Newtonsoft.Json;

public partial class Gridview_noashapira_elliskulmis_arielweinblat_class5_Default2 : System.Web.UI.Page
{
    XmlDocument xmlDoc = new XmlDocument();
    //נתיב לשמירה התמונות
    string imagesLibPath = "FileUpload/";

    //סשיין האיידי של המשחק
    string editgameID;



    protected void Page_init(object sender, EventArgs e)
    {

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        editgameID = Session["gameIDSession"].ToString();

        xmlDoc.Load(Server.MapPath("tree/game.xml"));

        string questionsXpath = "/RootTree/game[@GameCode=" + editgameID + "]/questions/question";
        XmlDataSource2.XPath = questionsXpath; 
        gameSubject.InnerText = Server.UrlDecode(xmlDoc.SelectSingleNode("/RootTree/game[@GameCode=" + editgameID + "]/GameSubject").InnerText);


       
        if (!IsPostBack)
        {
            if (Session["QuestionIDSession"] == null)
            {
                answerChoises.SelectedValue = "4";

            }


            imagesize1.CssClass += " hidesize";
        }

    }

    //פונקציית ספירת כמות השאלות בטבלת הגרידיו
    protected void GridView1_DataBound(object sender, EventArgs e)
    {

       int questionsCount = GridView1.Rows.Count;

        questionCounttext.InnerText = " שאלות: " + questionsCount;
        if (questionsCount < 8 || questionsCount > 15 || questionsCount == 11)
        {
            //לצבוע לאדום
            questionCounttext.Style.Add("color", "red");
        }
        else
        {
            //לצבוע לירוק
            questionCounttext.Style.Add("color", "limegreen");
        }
    }

    //פונקציית 
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        ImageButton i = (ImageButton)e.CommandSource;

        string quastionID = i.Attributes["theItemId"];
        Session["QuestionIDSession"] = quastionID;

        switch (e.CommandName)

        {
            case "deleteQuestion":
                deleteRow();
                break;

            case "editQuestion":
                editRow(sender, e);
                break;
        }
    }

    //פונקציות מחיקת שאלה
    protected void deleteRow()
    {
        string gameID = Session["gameIDSession"].ToString();
        string questionId = Session["QuestionIDSession"].ToString();
        XmlDocument Document = XmlDataSource2.GetXmlDocument();

        XmlNode node = Document.SelectSingleNode("/RootTree/game[@GameCode='" + gameID + "']/questions/question[@id=" + questionId + "]");


        //הופעה של החלון פופאפ
        DeleteConfPopUpQuestion.Visible = true;

    }

    protected void OkBtn_Click(object sender, EventArgs e)
    {

        string gameID = Session["gameIDSession"].ToString();
        string questionId = Session["QuestionIDSession"].ToString();

        XmlDocument Document = XmlDataSource2.GetXmlDocument();
        XmlNode node = Document.SelectSingleNode("/RootTree/game[@GameCode='" + gameID + "']/questions/question[@id=" + questionId + "]");
        node.ParentNode.RemoveChild(node);


        XmlDataSource2.Save();
        GridView1.DataBind();

        Session["QuestionIDSession"] = null;
        DeleteConfPopUpQuestion.Visible = false;

    }

    
    protected void ExitDeleteConf_Click(object sender, EventArgs e)
    {
        DeleteConfPopUpQuestion.Visible = false;
    }

    //פונקציית עריכת שאלה
    protected void editRow(object sender, GridViewCommandEventArgs e)
    {
        xmlDoc.Load(Server.MapPath("tree/game.xml")); //טעינה של המשחק

        string questionId = Session["QuestionIDSession"].ToString();
        XmlNode questionNode = xmlDoc.SelectSingleNode("RootTree/game[@GameCode=" + editgameID + "]/questions/question[@id=" + questionId + "]");

        //שינוי טקסט שאלה 
        XmlNode textboxQuestion = questionNode.SelectSingleNode("questionText"); 
        questionTextBox.Text = Server.UrlDecode(textboxQuestion.InnerText);

        XmlNode answersListNode = questionNode.SelectSingleNode("answers");
        answerChoises.SelectedValue = answersListNode.Attributes["ansNum"].Value;


        XmlNode questuonIMGNode = questionNode.SelectSingleNode("img");
        string innerText = questuonIMGNode.InnerText;
        if (innerText == "")
        {
            queImagebtn.ImageUrl = "~/images/add.png";
        }
        else
        {
            queImagebtn.ImageUrl = imagesLibPath + innerText;
        }
        //שינוי המסיחים
        XmlNodeList answersTextList = answersListNode.SelectNodes("answer"); 
        PopulateAnswer(answersTextList[0], ans1, ImageforUpload1, radAns1);
        PopulateAnswer(answersTextList[1], ans2, ImageforUpload2, radAns2);
        PopulateAnswer(answersTextList[2], ans3, ImageforUpload3, radAns3);
        PopulateAnswer(answersTextList[3], ans4, ImageforUpload4, radAns4);

        if (answersTextList.Count == 5)
        {
            PopulateAnswer(answersTextList[4], ans5, ImageforUpload5, radAns5);
        }
        if (answersTextList.Count == 6)
        {
            PopulateAnswer(answersTextList[4], ans5, ImageforUpload5, radAns5);
            PopulateAnswer(answersTextList[5], ans6, ImageforUpload6, radAns6);
        }




    }

    //פונקציית הזנה של הפקדים ללשאלה מתוך הMXL
    private void PopulateAnswer(XmlNode xmlAnswer, TextBox ansText, ImageButton ansImage, RadioButton radiobtnchoise)
    {
        string innerText = Server.UrlDecode(xmlAnswer.InnerText);
        string ansType = xmlAnswer.Attributes["ansType"].Value;
        radiobtnchoise.Checked = xmlAnswer.Attributes["feedback"].Value == "True";
        if (ansText.Text.Length == 0)
        {
            ansImage.Attributes.Remove("disabled");
        }
        if (ansType == "text")
        {
            ansText.Text = innerText;
            ansText.Enabled = true;
            ansText.Attributes.Remove("disabled");
            if (ansText.Text.Length > 0)
            {
                ansImage.CssClass += " blocked";
                ansImage.Attributes.Add("disabled", "true");
                ansImage.ImageUrl = "~/images/add.png";
            }

        }
        else
        {
            ansText.Attributes.Add("disabled", "true");
            ansImage.ImageUrl = imagesLibPath + innerText;
            ansImage.Enabled = true;
            ansText.Text = "";
        }
    }

    //פונקציית שמירת שאלה
    protected void saveButton(object sender, EventArgs e)
    {

        xmlDoc.Load(Server.MapPath("tree/game.xml"));

        XmlNode questionsNode = xmlDoc.SelectSingleNode("RootTree/game[@GameCode=" + editgameID + "]/questions");

        bool isNewQuestion = Session["QuestionIDSession"] == null;
        XmlNode questionToSave;
        if (isNewQuestion)
        {
            questionToSave = xmlDoc.CreateElement("question");
            int newId = questionsNode.ChildNodes.Count + 1;
            ((XmlElement)questionToSave).SetAttribute("id", newId.ToString());
            XmlElement answersNode = xmlDoc.CreateElement("answers");
            questionToSave.AppendChild(answersNode);
        }
        else
        {
            string questionId = Session["QuestionIDSession"].ToString();
            questionToSave = questionsNode.SelectSingleNode("question[@id=" + questionId + "]");

        }

        String numberOfAnswers = answerChoises.SelectedValue;

        WriteQuestionToXmlNode(questionToSave, Convert.ToInt16(numberOfAnswers));

        questionsNode.AppendChild(questionToSave);

        xmlDoc.Save(Server.MapPath("tree/game.xml"));  
        XmlDataSource2.Save();
        GridView1.DataBind();
        Session["QuestionIDSession"] = null;
        questionTextBox.Text = "";
        ans1.Text = "";
        ans2.Text = "";
        ans3.Text = "";
        ans4.Text = "";
        ans5.Text = "";
        ans6.Text = "";
        queImagebtn.ImageUrl = "~/images/add.png";
        FileUploadque.Attributes.Clear();
        ImageforUpload1.ImageUrl = "~/images/add.png";
        ImageforUpload1.Attributes.Add("disabled", "false");
        ImageforUpload1.CssClass.Replace("blocked", "");
        FileUpload1.Attributes.Clear();
        ImageforUpload2.ImageUrl = "~/images/add.png";
        ImageforUpload2.Attributes.Add("disabled", "false");
        ImageforUpload2.CssClass.Replace("blocked", "");
        FileUpload2.Attributes.Clear();
        ImageforUpload3.ImageUrl = "~/images/add.png";
        ImageforUpload3.Attributes.Add("disabled", "false");
        ImageforUpload3.CssClass.Replace("blocked", "");
        FileUpload3.Attributes.Clear();
        ImageforUpload4.ImageUrl = "~/images/add.png";
        ImageforUpload4.Attributes.Add("disabled", "false");
        FileUpload4.Attributes.Clear();
        ImageforUpload4.CssClass.Replace("blocked", "");
        ImageforUpload5.ImageUrl = "~/images/add.png";
        ImageforUpload5.Attributes.Add("disabled", "false");
        ImageforUpload5.CssClass.Replace("blocked", "");
        FileUpload5.Attributes.Clear();
        ImageforUpload6.ImageUrl = "~/images/add.png";
        ImageforUpload6.Attributes.Add("disabled", "false");
        FileUpload6.Attributes.Clear();
        ImageforUpload6.CssClass.Replace("blocked", "");
        radAns1.Checked = false;
        radAns2.Checked = false;
        radAns3.Checked = false;
        radAns4.Checked = false;
        radAns5.Checked = false;
        radAns6.Checked = false;

        if (Session["QuestionIDSession"] == null)
        {
            answerChoises.SelectedValue = "4";
        }

;
    }

    //פונקציית הכנסת נתונים חדשים/מעודכנים לפקדי השאלה ודריסתם במידה וזו שאלה חדשה
    private void WriteQuestionToXmlNode(XmlNode myNewQuestionNode, int numOfAnswers)
    {
        XmlElement questionText = (XmlElement)myNewQuestionNode.SelectSingleNode("questionText");

        if (questionText == null)
        {
            //הכנסת התוכן שנכתב לשאלה אל הענף
            questionText = xmlDoc.CreateElement("questionText");
            questionText.InnerXml = Server.UrlEncode(questionTextBox.Text);
            myNewQuestionNode.AppendChild(questionText);
        }
        else
        {
            questionText.InnerXml = Server.UrlEncode(questionTextBox.Text);
        }

        XmlElement questionImg = (XmlElement)myNewQuestionNode.SelectSingleNode("img");

        if (questionImg == null)
        {
            questionImg = xmlDoc.CreateElement("img");
            myNewQuestionNode.AppendChild(questionImg);
        }
        else
        {
            questionImg.InnerXml = queImagebtn.ImageUrl.Replace(imagesLibPath, "");
        }

        //שמירה של תמונה שהועלתה לגוף השאלה
        string fileType = ((FileUpload)FindControl("FileUploadque")).PostedFile.ContentType;

        //הוספת תמונה לשאלה
        string QuestionfileType = ((FileUpload)FindControl("FileUploadque")).PostedFile.ContentType;

        if (QuestionfileType.Contains("image")) //בדיקה האם הקובץ שהוכנס הוא תמונה
        {
            // הנתיב המלא של הקובץ עם שמו האמיתי של הקובץ
            string QuestionfileName = ((FileUpload)FindControl("FileUploadque")).PostedFile.FileName;
            // הסיומת של הקובץ
            string endOfFileName = QuestionfileName.Substring(QuestionfileName.LastIndexOf("."));
            //לקיחת הזמן האמיתי למניעת כפילות בתמונות
            string myTime = DateTime.Now.ToString("dd_MM_yy-HH_mm_ss_ffff");

            // חיבור השם החדש עם הסיומת של הקובץ
            string imageNewName = myTime + endOfFileName;

            //שינוי גודל התמונה והגדרתו כBITMAP
            // Bitmap המרת הקובץ שיתקבל למשתנה מסוג
            System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(FileUploadque.PostedFile.InputStream);

            //קריאה לפונקציה המקטינה את התמונה
            //אנו שולחים לה את התמונה שלנו בגירסאת הביטמאפ ואת האורך והרוחב שאנו רוצים לתמונה החדשה
            System.Drawing.Image objImage = FixedSize(bmpPostedImage, 300, 300);

            //שמירת הקובץ בגודלו החדש בתיקייה
            objImage.Save(Server.MapPath(imagesLibPath) + imageNewName);

            //הצגה של הקובץ החדש מהספרייה
            ((ImageButton)FindControl("queImagebtn")).ImageUrl = imagesLibPath + imageNewName;


            ImageButton imageQBtn = (ImageButton)FindControl("queImagebtn");
            questionImg.InnerText = imageNewName;
            myNewQuestionNode.AppendChild(questionImg);
        }



        XmlNode answersNode = myNewQuestionNode.SelectSingleNode("answers");

        answersNode.RemoveAll();

        //סידור הענפים בסדר הנכון
        myNewQuestionNode.InsertBefore(questionText, answersNode);
        myNewQuestionNode.InsertBefore(questionImg, answersNode);

        for (int i = 0; i < numOfAnswers; i++)
        {
            int controlId = i + 1;
            XmlElement answerXml = xmlDoc.CreateElement("answer");
            RadioButton isCorrectRadio = (RadioButton)FindControl("radAns" + controlId);
            TextBox ansText = (TextBox)FindControl("ans" + controlId);

            answerXml.SetAttribute("feedback", isCorrectRadio.Checked.ToString());

            string ansfileType = ((FileUpload)FindControl("FileUpload" + controlId)).PostedFile.ContentType;

            if (ansfileType.Contains("image")) //בדיקה האם הקובץ שהוכנס הוא תמונה
            {

                // הנתיב המלא של הקובץ עם שמו האמיתי של הקובץ
                FileUpload answerImage = ((FileUpload)FindControl("FileUpload" + controlId));
                string ansfileName = answerImage.PostedFile.FileName;
                // הסיומת של הקובץ
                string endOfFileName = ansfileName.Substring(ansfileName.LastIndexOf("."));
                //לקיחת הזמן האמיתי למניעת כפילות בתמונות
                string myTime = DateTime.Now.ToString("dd_MM_yy-HH_mm_ss_ffff");

                // חיבור השם החדש עם הסיומת של הקובץ
                string imageNewName = myTime + controlId + endOfFileName;

                //שינוי גודל התמונה והגדרתו כBITMAP
                // Bitmap המרת הקובץ שיתקבל למשתנה מסוג
                System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(answerImage.PostedFile.InputStream);

                //קריאה לפונקציה המקטינה את התמונה
                //אנו שולחים לה את התמונה שלנו בגירסאת הביטמאפ ואת האורך והרוחב שאנו רוצים לתמונה החדשה
                System.Drawing.Image objImage = FixedSize(bmpPostedImage, 300, 300);

                //שמירת הקובץ בגודלו החדש בתיקייה
                objImage.Save(Server.MapPath(imagesLibPath) + imageNewName);

                //הצגה של הקובץ החדש מהספרייה
                ((ImageButton)FindControl("ImageforUpload" + controlId)).ImageUrl = imagesLibPath + imageNewName;


                answerXml.SetAttribute("ansType", "image");
                answerXml.InnerText = imageNewName;
            }
            else
            {
                answerXml.SetAttribute("ansType", "text");
                answerXml.InnerText = Server.UrlEncode(ansText.Text);
            }

            answersNode.AppendChild(answerXml);
        }
        ((XmlElement)answersNode).SetAttribute("ansNum", numOfAnswers.ToString());

    }

    // פונקציה המקבלת את התמונה שהועלתה , האורך והרוחב שאנו רוצים לתמונה ומחזירה את התמונה המוקטנת
    static System.Drawing.Image FixedSize(System.Drawing.Image imgPhoto, int Width, int Height)
    {
        int sourceWidth = Convert.ToInt32(imgPhoto.Width);
        int sourceHeight = Convert.ToInt32(imgPhoto.Height);

        int sourceX = 0;
        int sourceY = 0;
        int destX = 0;
        int destY = 0;

        float nPercent = 0;
        float nPercentW = 0;
        float nPercentH = 0;

        nPercentW = ((float)Width / (float)sourceWidth);
        nPercentH = ((float)Height / (float)sourceHeight);
        if (nPercentH < nPercentW)
        {
            nPercent = nPercentH;
            destX = System.Convert.ToInt16((Width -
                          (sourceWidth * nPercent)) / 2);
        }
        else
        {
            nPercent = nPercentW;
            destY = System.Convert.ToInt16((Height -
                          (sourceHeight * nPercent)) / 2);
        }

        int destWidth = (int)(sourceWidth * nPercent);
        int destHeight = (int)(sourceHeight * nPercent);

        System.Drawing.Bitmap bmPhoto = new System.Drawing.Bitmap(Width, Height, PixelFormat.Format24bppRgb);
        bmPhoto.SetResolution(imgPhoto.HorizontalResolution,
                         imgPhoto.VerticalResolution);

        System.Drawing.Graphics grPhoto = System.Drawing.Graphics.FromImage(bmPhoto);
        grPhoto.Clear(System.Drawing.Color.White);
        grPhoto.InterpolationMode =
                InterpolationMode.HighQualityBicubic;

        grPhoto.DrawImage(imgPhoto,
            new System.Drawing.Rectangle(destX, destY, destWidth, destHeight),
            new System.Drawing.Rectangle(sourceX, sourceY, sourceWidth, sourceHeight),
            System.Drawing.GraphicsUnit.Pixel);

        grPhoto.Dispose();
        return bmPhoto;
    }

    //פונקציית איפוס שדות
    protected void clean_click(object sender, EventArgs e)
    {
        Session["QuestionIDSession"] = null;
        questionTextBox.Text = "";
        ans1.Text = "";
        ans2.Text = "";
        ans3.Text = "";
        ans4.Text = "";
        ans5.Text = "";
        ans6.Text = "";
        queImagebtn.ImageUrl = "~/images/add.png";
        FileUploadque.Attributes.Clear();
        ImageforUpload1.ImageUrl = "~/images/add.png";
        ImageforUpload1.Attributes.Add("disabled", "false");
        ImageforUpload1.CssClass.Replace("blocked", "unblocked");
        FileUpload1.Attributes.Clear();
        ImageforUpload2.ImageUrl = "~/images/add.png";
        ImageforUpload2.Attributes.Add("disabled", "false");
        ImageforUpload2.CssClass.Replace("blocked", "unblocked");
        FileUpload2.Attributes.Clear();
        ImageforUpload3.ImageUrl = "~/images/add.png";
        ImageforUpload3.Attributes.Add("disabled", "false");
        ImageforUpload3.CssClass.Replace("blocked", "unblocked");
        FileUpload3.Attributes.Clear();
        ImageforUpload4.ImageUrl = "~/images/add.png";
        ImageforUpload4.Attributes.Add("disabled", "false");
        FileUpload4.Attributes.Clear();
        ImageforUpload4.CssClass.Replace("blocked", "unblocked");
        ImageforUpload5.ImageUrl = "~/images/add.png";
        ImageforUpload5.Attributes.Add("disabled", "false");
        ImageforUpload5.CssClass.Replace("blocked", "unblocked");
        FileUpload5.Attributes.Clear();
        ImageforUpload6.ImageUrl = "~/images/add.png";
        ImageforUpload6.Attributes.Add("disabled", "false");
        FileUpload6.Attributes.Clear();
        ImageforUpload6.CssClass.Replace("blocked", "unblocked");
        radAns1.Checked = false;
        radAns2.Checked = false;
        radAns3.Checked = false;
        radAns4.Checked = false;
        radAns5.Checked = false;
        radAns6.Checked = false;

        if (Session["QuestionIDSession"] == null)
        {
            answerChoises.SelectedValue = "4";
        }
    }


    //פונקציות הפעלת כפתור חזרה למשחקים שלי
    protected void return_click(object sender, EventArgs e)
    {

            return1.Visible = true;
            return2.Visible = true;
        

    }

    protected void returnNo_Click(object sender, EventArgs e)
    {
        return1.Visible = false;
        return2.Visible = false;
    }

    protected void returnYes_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");

        return1.Visible = false;
        return2.Visible = false;
    }
    
}

