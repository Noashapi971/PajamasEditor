using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Newtonsoft.Json;

public partial class Default2 : System.Web.UI.Page
{
    string gameID;

    protected void Page_Load(object sender, EventArgs e)
    {
        gameID = Session["gameIDSession"].ToString();
        if (!Page.IsPostBack)
        {


            XmlDocument xmlDoc = new XmlDocument();


            xmlDoc.Load(Server.MapPath("tree/game.xml"));
            XmlNode myNewGameNode = xmlDoc.SelectSingleNode("RootTree/game[@GameCode=" + gameID + "]");

            //שינוי שם המשחק 
            XmlNode gameSubject = xmlDoc.SelectSingleNode("RootTree/game[@GameCode=" + gameID + "]/GameSubject"); // טעינה של המשחק מתוך העץ
                                                                                                                  //מזינים לתוך השאלה את התוכן מהטקסט בוקס
                                                                                                                  // gameSubject.InnerText = Server.UrlDecode(gameNameTxt.Text);

            gameNameTxt.Text = Server.UrlDecode(gameSubject.InnerText);

            timeLimit.SelectedValue = myNewGameNode.Attributes["timePerQuest"].Value;

        }
    }

    //םונקציית העלאת בגדרות המשחק הקיימות לפקדי העמוד
    private void SaveGame()
    {

        XmlDocument xmlDoc = new XmlDocument();

        xmlDoc.Load(Server.MapPath("tree/game.xml"));
        XmlNode myNewGameNode = xmlDoc.SelectSingleNode("RootTree/game[@GameCode=" + gameID + "]");

        XmlNode gameSubject = xmlDoc.SelectSingleNode("RootTree/game[@GameCode=" + gameID + "]/GameSubject"); 
        gameSubject.InnerText = Server.UrlEncode(gameNameTxt.Text);

        string newTime = timeLimit.SelectedValue;

        myNewGameNode.Attributes["timePerQuest"].Value = newTime;

        xmlDoc.Save(Server.MapPath("tree/game.xml")); //שמירת הערכים 
        XmlDataSource1.Save();
        gameID = Session["gameIDSession"].ToString();
    }

    //כפתור שמירה
    protected void save_Click(object sender, EventArgs e)
    {
        SaveGame();
    }

    //כפתור שמירה ומעבר לשאלות
    protected void saveAnd_Click(object sender, EventArgs e)
    {

        SaveGame();
        Session["gameIDSession"] = gameID;
        Response.Redirect("EditQuestions.aspx");

    }

    //פונקציית כפתור חזרה לעמוד המשחקים
    protected void return_Click(object sender, EventArgs e)
    {
        //הופעה של החלון פופאפ
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