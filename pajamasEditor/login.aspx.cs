using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null) //בדיקה אם המשתמש מחובר ובהתאם לשלוח אותו לדף העורך
        {
            Response.Redirect("~/Default.aspx");
        }
    }

    //פונקציית התחברות לצד העורך
    protected void loginBtn_Click(object sender, EventArgs e)
    {
        if (usernameTB.Text == "admin" && passwordTB.Text == "telem") //בדיקה אם שם המשתמש והסיסמה תקינים
        {
            Session["user"] = "admin";
            Response.Redirect("Default.aspx");
        }
        else 
        {
            errorMsg.Visible = true;
            errorMsg.Text = "שם משתמש שגוי או סיסמא שגויה";

        }
    }
}