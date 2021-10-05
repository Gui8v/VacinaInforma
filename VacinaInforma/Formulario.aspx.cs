using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Formulario : System.Web.UI.Page
{

    protected bool msg;

    protected void Page_Load(object sender, EventArgs e)
    {
         msg = false;

        if (!IsPostBack)
        {
            atualizarPagina();
        }
    }

    public void atualizarPagina()
    {
        carregaddlEstados();
    }

    void carregaddlEstados()
    {


        DataSet ds = EstadosPercistencia.ddlSelectEstados();
        ddlEstado.DataSource = ds;
        ddlEstado.DataTextField = "est_nome";
        ddlEstado.DataValueField = "est_id";
        ddlEstado.DataBind();
        ddlEstado.Items.Insert(0, "Selecione um Estado");

        DataSet dsA = VacinasPercistecia.selectVacinas();
        ddlVacinas.DataSource = dsA;
        ddlVacinas.DataTextField = "van_nome";
        ddlVacinas.DataValueField = "van_id";
        ddlVacinas.DataBind();
        ddlVacinas.Items.Insert(0, "Selecione um Estado");

    }

    protected void btnEviar_Click(object sender, EventArgs e)
    {
        Vacinados v = new Vacinados();
        v.Est_id = new Estado();
        v.Van_id = new Vacinas();
        v.Vac_nome = txtNome.Text;
        v.Vac_cpf = txtCpf.Text;
        v.Vac_qtdDoses = Convert.ToInt32(txtDose.Text);
        v.Vac_idade = Convert.ToInt32(txtIdade.Text);
        v.Est_id.Est_id = Convert.ToInt32(ddlEstado.SelectedValue);
        v.Van_id.Van_id = Convert.ToInt32(ddlVacinas.SelectedValue);

        {

            switch (VacinadosPercistecia.CadastroVacinado(v))
            {

                case 0:

                    msg = true;
                    ltlMsg.Text = "<div class='text-success h4'> Cadastrado </div>";
                    atualizarPagina();
                    break;

                case -2:
                    msg = true;
                    ltlMsg.Text = "<div class='text-danger h4'>Campos Preenchido Incorretamete </div>";
                    break;
            }
        }
    }

}