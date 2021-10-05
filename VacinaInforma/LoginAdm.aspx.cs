using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginAdm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usuario"] != null)
        {
            Response.Redirect("Administrador/GerenciamentoHome.aspx");
        }
    }

    protected void btnEviar_Click(object sender, EventArgs e)
    {
        Administrador adm = new Administrador();
        adm.Adm_email = txtEmail.Text;
        adm.Adm_senha = txtSenha.Text;

        DataSet ds = AdmninstradorPercistencia.VerificaLogin(adm);

        if (ds.Tables[0].Rows.Count == 1)
        {

            Session["email"] = ds.Tables[0].Rows[0]["adm_email"].ToString();
            Session["permicao"] = ds.Tables[0].Rows[0]["adm_permicao"].ToString();
            Session["usuario"] = adm;

            Response.Redirect("Administrador/GerenciamentoHome.aspx");
        }

        else
        {

            ltl.Text = "<div class='text-danger offset-1 col-10 offset-1 text-center'>Login ou senha incorretos</div>";
        }

    }
}