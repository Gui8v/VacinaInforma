using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrador_CadastroAdm : System.Web.UI.Page
{
    protected bool msg;
    protected void Page_Load(object sender, EventArgs e)
    {
        msg = false;

        if (Session["permicao"] as string != "S")
        {
            Response.Redirect("GerenciamentoHome.aspx");
        }

    }

    protected void btnEviar_Click(object sender, EventArgs e)
    {
        if (txtSenha.Text != txtSenhaConfirma.Text) 
        {
            msg = true;
            ltlMsg.Text = "<div class='text-danger h4'>Senhas Incompativeis</div>";

        }
        else
        {

            Administrador adm = new Administrador();
            adm.Adm_nome = txtNome.Text;
            adm.Adm_email = txtEmail.Text;
            adm.Adm_senha = txtSenha.Text;
            adm.Adm_permicao = (cboPermicao.Checked ? "S":"N");

            switch (AdmninstradorPercistencia.CadastroAdm(adm))
            {

                case 0:

                    msg = true;
                    ltlMsg.Text = "<div class='text-success h4'> Cadastrado </div>";
                    break;

                case -2:
                    msg = true;
                    ltlMsg.Text = "<div class='text-danger h4'>Campos Preenchido Incorretamete </div>";
                    break;
            }
; 
        }
    }
}