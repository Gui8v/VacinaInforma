using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrador_GerenciamentoVacinados : System.Web.UI.Page
{

    protected bool modalAlterar;
    protected bool modalExcluir;
    protected bool msg;
    protected void Page_Load(object sender, EventArgs e)
    {
        modalAlterar = false;
        modalExcluir = false;
        msg = false;

        if (!IsPostBack)
        {
            atualizarPagina();
        }
    }

    public void atualizarPagina()
    {
        DataSet dsRegistro = VacinadosPercistecia.selectVacinados();
        carregaddlEstados();
        carregarDdlVacinas();
        rptVacinados.DataSource = dsRegistro.Tables[0];
        rptVacinados.DataBind();



        if (dsRegistro.Tables[0].Rows.Count == 0)
        {

            ltlSemRegistros.Text = "<div  class='col-12 text-white text-center h5'>Sem Registros</div>";
        }
        else
        {
            ltlSemRegistros.Text = "";
        }
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

    void carregaddlEstados()
    {

        DataSet ds = EstadosPercistencia.ddlSelectEstados();
        ddlEstado.DataSource = ds;
        ddlEstado.DataTextField = "est_nome";
        ddlEstado.DataValueField = "est_id";
        ddlEstado.DataBind();
        ddlEstado.Items.Insert(0, "Selecione um Estado");

    }

    void  carregarDdlVacinas()
    {

        DataSet ds = VacinasPercistecia.selectVacinas();
        ddlVacinas.DataSource = ds;
        ddlVacinas.DataTextField = "van_nome";
        ddlVacinas.DataValueField = "van_id";
        ddlVacinas.DataBind();
        ddlVacinas.Items.Insert(0, "Selecione um Estado");

    }


    protected void btnPesquisa_Click(object sender, EventArgs e)
    {
        DataSet dsRegistro = VacinadosPercistecia.selectVacinadosPesquisa(txtPesquisa.Text);

        rptVacinados.DataSource = dsRegistro.Tables[0];
        rptVacinados.DataBind();


        if (dsRegistro.Tables[0].Rows.Count == 0)
        {

            ltlSemRegistros.Text = "<div  class='col-12 text-white text-center h5'>Sem Registros</div>";
        }
        else
        {
            ltlSemRegistros.Text = "";
        }
    }

    protected void btnExcluirRegistro_Click(object sender, EventArgs e)
    {
        modalExcluir  = true;
        LinkButton btn = (LinkButton)sender;
        RepeaterItem item = (RepeaterItem)btn.NamingContainer;
        hidIdRegistroEcluir.Value = (item.FindControl("hidVacinadoId") as HiddenField).Value;
    }

    protected void btnExcluirRegistroConfirma_Click(object sender, EventArgs e)
    {
        Vacinados vac = new Vacinados();
        vac.Vac_id = Convert.ToInt32(hidIdRegistroEcluir.Value);
        VacinadosPercistecia.DeleteVacinado(vac);
        atualizarPagina();
        ltlMsg.Text = "<div class='text-center text-success h4'>Registro Excluido !!</div>";
        msg = true;
    }

    protected void btnAlterarRegistro_Click(object sender, EventArgs e)
    {
        modalAlterar = true;
        DataSet ds = EstadosPercistencia.ddlSelectEstados();
        ddlAlterarEstado.DataSource = ds;
        ddlAlterarEstado.DataTextField = "est_nome";
        ddlAlterarEstado.DataValueField = "est_id";
        ddlAlterarEstado.DataBind();
        ddlAlterarEstado.Items.Insert(0, "Selecione um Estado");

        DataSet dsA = VacinasPercistecia.selectVacinas();
        ddlAlterVacinas.DataSource = dsA;
        ddlAlterVacinas.DataTextField = "van_nome";
        ddlAlterVacinas.DataValueField = "van_id";
        ddlAlterVacinas.DataBind();
        ddlAlterVacinas.Items.Insert(0, "Selecione um Estado");

        LinkButton btn = (LinkButton)sender;
        RepeaterItem item = (RepeaterItem)btn.NamingContainer;
        hidAlterarVacinadoId.Value = (item.FindControl("hidVacinadoId") as HiddenField).Value;
        txtAlterarNome.Text = (item.FindControl("hidNome") as HiddenField).Value;
        txtAlterarCpf.Text = (item.FindControl("lblCpf") as Label).Text;
        txtAlterarIdade.Text = (item.FindControl("hidVacinadoIdade") as HiddenField).Value;
        txtAlterarDose.Text = (item.FindControl("hidDose") as HiddenField).Value;
        hidAlterarVacina.Value = (item.FindControl("hidVacinaId") as HiddenField).Value;
        ddlAlterVacinas.SelectedValue = (item.FindControl("hidVacinaId") as HiddenField).Value;
        ddlAlterarEstado.SelectedValue = (item.FindControl("hidEstadoId") as HiddenField).Value;
    }

    protected void btnAlterarVacinado_Click(object sender, EventArgs e)
    {
        Vacinados vac = new Vacinados();
        vac.Est_id = new Estado();
        vac.Van_id = new Vacinas();
        vac.Vac_id = Convert.ToInt32(hidAlterarVacinadoId.Value);
        vac.Vac_nome = txtAlterarNome.Text;
        vac.Vac_cpf = txtAlterarCpf.Text;
        vac.Vac_qtdDoses = Convert.ToInt32(txtAlterarDose.Text);
        vac.Van_id.Van_id = Convert.ToInt32(hidAlterarVacina.Value);
        vac.Vac_idade = Convert.ToInt32(txtAlterarIdade.Text);
        vac.Van_id.Van_id = Convert.ToInt32(ddlAlterVacinas.SelectedValue);
        vac.Est_id.Est_id = Convert.ToInt32(ddlAlterarEstado.SelectedValue);

        {

            switch (VacinadosPercistecia.UpdateVacinado(vac))
            {

                case 0:
                    msg = true;
                    ltlMsg.Text = "<div class='text-success h4'> Alterado! </div>";
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