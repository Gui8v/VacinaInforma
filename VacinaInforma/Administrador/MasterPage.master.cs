using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrador_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
 
        if (Session["usuario"] != null)
        {
            ltl.Text = "<div class='text-secondary font-weight-bolder pr-2'>" + Session["email"] as string  + "</div>";

            if(Session["permicao"] as string == "S")
            {
               btnCadastraAdm.Visible = true;
            }

        }
        else
        {

            Response.Redirect("../LoginAdm.aspx");
        }
    }

    protected void btnSair_Click(object sender, EventArgs e)
    {
        Session.Remove("usuario");
        Response.Redirect("../LoginAdm.aspx");
    }
}
