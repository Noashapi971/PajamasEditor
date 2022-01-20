using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Newtonsoft.Json;
public partial class _Default : System.Web.UI.Page
{
    string theId;
    protected void Page_Load(object sender, EventArgs e)
    { 
        CheckGamesPublishable();

    }

    //פונקציה שבודקת האם ניתן לפרסם משחק
    private void CheckGamesPublishable()
    {
      
        foreach (GridViewRow row in GridView2.Rows)
        {
            XmlDocument xmlDoc = XmlDataSource1.GetXmlDocument();

            CheckBox myCheckBox = (CheckBox)row.FindControl("publishCheckbox");

            // מושכים את האי די של הפריט באמצעות המאפיין שהוספנו באופן ידני לתיבה
            string theId = myCheckBox.Attributes["theItemId"];

            //נספור כמה שאלות יש לי במשחק שמיוצג בשורה הנוכחית בגרידוויו
            XmlNodeList quest = xmlDoc.SelectNodes("/RootTree/game[@GameCode='" + theId + "']/questions/question");


            XmlNode gamePuslishCheck = xmlDoc.SelectSingleNode("/RootTree/game[@GameCode=" + theId + "]");
            //אם יש 5 שאלות או יותר
            if (quest.Count >= 8 && quest.Count <= 15 && quest.Count != 11 && quest.Count != 0)
            {
                myCheckBox.Enabled = true;
                myCheckBox.Attributes.Add("valid", "true");

            }
            else
            {
                myCheckBox.Checked = false;
                myCheckBox.Enabled = false;
            }
        }
    }

    //אם ניתן אישור מפונקציה קודמת, פונקציה זו תפרסם את המשחק
    protected void IsPublish_CheckedChanged(object sender, EventArgs e)
    {
        XmlDocument xmlDoc = XmlDataSource1.GetXmlDocument();

        CheckBox myCheckBox = (CheckBox)sender;

        // מושכים את האי די של הפריט באמצעות המאפיין שהוספנו באופן ידני לתיבה
        string theId = myCheckBox.Attributes["theItemId"];

       

        XmlNode gamePuslishCheck = xmlDoc.SelectSingleNode("/RootTree/game[@GameCode=" + theId + "]");


            if (myCheckBox.Enabled == true) {

            bool myCheck = myCheckBox.Checked;
            //עדכון של המאפיין בעץ
            gamePuslishCheck.Attributes["isPublish"].InnerText = myCheck.ToString();



            XmlDataSource1.Save();
            GridView2.DataBind();


        }



    }

    //פונקציית גרידויו
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        ImageButton i = (ImageButton)e.CommandSource;

        string theId = i.Attributes["theItemId"];
        Session["gameIDSession"] = theId;



        switch (e.CommandName)
        {

            //אם נלחץ על כפתור מחיקה יקרא לפונקציה של מחיקה                    
            case "deleteRow":
                deleteRow();
                break;

            //אם נלחץ על כפתור עריכה (העפרון) נעבור לדף עריכה                    
            case "editRow":
                Session["QuestionIDSession"] = null;
                Response.Redirect("EditQuestions.aspx");
                break;

            //אם נלחץ על כפתור עריכה (העפרון) נעבור לדף עריכה                    
            case "editGenerals":
                Response.Redirect("Edit.aspx");
                break;
        }
    }

    //פונקציות מחיקת משחק 
    protected void deleteRow()
    {
        string gameToDelete = Session["gameIDSession"].ToString();

        XmlDocument Document = XmlDataSource1.GetXmlDocument();

        XmlNode node = Document.SelectSingleNode("/RootTree/game[@GameCode='" + gameToDelete + "']");

        //הופעה של החלון פופאפ
        DeleteConfPopUp.Visible = true;
        
    }
    protected void OkBtn_Click(object sender, EventArgs e)
    {

        //הסרת ענף של משחק קיים באמצעות זיהוי האיי דיי שניתן לו על ידי לחיצה עליו מתוך הטבלה
        //שמירה ועדכון לתוך העץ ולגריד ויו
        string gameToDelete = Session["gameIDSession"].ToString();
        XmlDocument Document = XmlDataSource1.GetXmlDocument();
        XmlNode node = Document.SelectSingleNode("/RootTree/game[@GameCode='" + gameToDelete + "']");
        node.ParentNode.RemoveChild(node);

        XmlDataSource1.Save();
        GridView2.DataBind();
        DeleteConfPopUp.Visible = false;
        CheckGamesPublishable();

    }

    protected void ExitDeleteConf_Click(object sender, EventArgs e)
    {
        DeleteConfPopUp.Visible = false;
    }

    //פונקציית יצירת משחק
    protected void createGame_Click(object sender, EventArgs e)
    {
        XmlDocument xmlDoc = XmlDataSource1.GetXmlDocument();
        XmlNode idNumber = xmlDoc.SelectSingleNode("//game[not(@GameCode < //game/@GameCode)]/@GameCode");
        int MaxId;

        if (idNumber == null) {
            MaxId = 100;
        }
        else { 
        MaxId = Convert.ToInt16(idNumber.Value);
        MaxId++;
        }

        //יצירת ענף המשחק החדש
        XmlElement myNewgameNode = xmlDoc.CreateElement("game");
        myNewgameNode.SetAttribute("GameCode", MaxId.ToString());
        myNewgameNode.SetAttribute("timePerQuest", "30");
        myNewgameNode.SetAttribute("isPublish", "false");

        //יצירת ענף שם המשחק
        XmlElement myNewNameNode = xmlDoc.CreateElement("GameSubject");
        myNewNameNode.InnerXml = Server.UrlEncode(addNameTB.Text);
        myNewgameNode.AppendChild(myNewNameNode);

        //יצירת ענף השאלות הכללי
        XmlElement QuestionsArray = xmlDoc.CreateElement("questions");
        myNewgameNode.AppendChild(QuestionsArray);

        XmlNode gamePosition = xmlDoc.SelectNodes("/RootTree/game").Item(0);
        xmlDoc.SelectSingleNode("/RootTree").InsertBefore(myNewgameNode, gamePosition);


        XmlDataSource1.Save();
        GridView2.DataBind();
        addNameTB.Text = "";

        CheckGamesPublishable();
    }
}

