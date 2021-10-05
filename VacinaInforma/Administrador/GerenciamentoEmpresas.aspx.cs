using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrador_GerenciamentoEmpresas : System.Web.UI.Page
{
    protected bool ModalExcluir;
    protected bool ModalAlterar;
    protected bool msg;
    protected void Page_Load(object sender, EventArgs e)
    {
        ModalExcluir = false;
        ModalAlterar = false;
        msg = false;

        if (!IsPostBack)
        {
            atualizarPagina();
        }
    }

    public void atualizarPagina()
    {
        carregaddlEstados();
        DataSet dsRegistro = EmpresasPercistencia.selectEmpresas();

        rptEmpresas.DataSource = dsRegistro.Tables[0];
        rptEmpresas.DataBind();


        if (dsRegistro.Tables[0].Rows.Count == 0)
        {

            ltlSemRegistros.Text = "<div  class='col-12 text-white text-center h5'>Sem Registros</div>";
        }
        else
        {
            ltlSemRegistros.Text = "";
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

    protected void btnSalvar_Click(object sender, EventArgs e)
    {
       Empresa em = new Empresa();
       em.Est_id = new Estado();
       em.Emp_nome = txtNome.Text;
       em.Emp_local = txtLocal.Text;
       em.Emp_qtdPfizer = Convert.ToInt32(txtPfizer.Text);
       em.Emp_qtdAstrazeneca = Convert.ToInt32(txtAstraZeneca.Text);     
       em.Est_id.Est_id = Convert.ToInt32(ddlEstado.SelectedValue);
      
        {

            switch (EmpresasPercistencia.CadastroEmpresa(em))
            {

                case 0:


                    msg = true;
                    ltlMsg.Text = "<div class='text-success h5'> Cadastrado </div>";
                    atualizarPagina();

                    break;

                case -2:
                    msg = true;
                    ltlMsg.Text = "<div class='text-danger h5'>Campos Preenchido Incorretamete </div>";
                    break;
            }
        }
    }


    protected void btnPesquisa_Click(object sender, EventArgs e)
    {
        DataSet dsRegistro = EmpresasPercistencia.selectEmpresasPesquisa(txtPesquisa.Text);

        rptEmpresas.DataSource = dsRegistro.Tables[0];
        rptEmpresas.DataBind();


        if (dsRegistro.Tables[0].Rows.Count == 0)
        {

            ltlSemRegistros.Text = "<div  class='col-12 text-white text-center h5'>Sem Registros</div>";
        }
        else
        {
            ltlSemRegistros.Text = "";
        }
    }

    protected void btnExcluirConfirmar_Click(object sender, EventArgs e)
    {
        Empresa emp = new Empresa();
        emp.Emp_id = Convert.ToInt32(hidIdRegistroEcluir.Value);
        EmpresasPercistencia.DeleteEmpresa(emp);
        atualizarPagina();
        ltlMsg.Text = "<div class='text-center text-success h5'>Registro Excluido Com Sucesso!!</div>";
        this.msg = true;
    }

    protected void btnExcluirRegistro_Click(object sender, EventArgs e)
    {
        ModalExcluir = true;
        LinkButton btn = (LinkButton)sender;
        RepeaterItem item = (RepeaterItem)btn.NamingContainer;
        hidIdRegistroEcluir.Value = (item.FindControl("hidEmpresaId") as HiddenField).Value;
    }

    protected void btnAlterar_Click(object sender, EventArgs e)
    {
        Empresa em = new Empresa();
        em.Est_id = new Estado();
        em.Emp_id = Convert.ToInt32(hidAlterarEmpresaId.Value);
        em.Emp_nome = txtAlterarNome.Text;
        em.Emp_local = txtAlterarLocal.Text;
        em.Emp_qtdPfizer = Convert.ToInt32(txtAlterarPfizer.Text);
        em.Emp_qtdAstrazeneca = Convert.ToInt32(txtAlterarAstrazeneca.Text);
        em.Est_id.Est_id = Convert.ToInt32(ddlEstadoAlterar.SelectedValue);

        {

            switch (EmpresasPercistencia.UpdateEmpresa(em))
            {

                case 0:


                    msg = true;
                    ltlMsg.Text = "<div class='text-success h5'> Alterado! </div>";
                    atualizarPagina();

                    break;

                case -2:
                    msg = true;
                    ltlMsg.Text = "<div class='text-danger h5'>Campos Preenchido Incorretamete </div>";
                    break;
            }
        }
    }

    protected void btnAlterarRegistro_Click(object sender, EventArgs e)
    {
        ModalAlterar = true;
        DataSet ds = EstadosPercistencia.ddlSelectEstados();
        ddlEstadoAlterar.DataSource = ds;
        ddlEstadoAlterar.DataTextField = "est_nome";
        ddlEstadoAlterar.DataValueField = "est_id";
        ddlEstadoAlterar.DataBind();
        ddlEstadoAlterar.Items.Insert(0, "Selecione um Estado");       

        LinkButton btn = (LinkButton)sender;
        RepeaterItem item = (RepeaterItem)btn.NamingContainer;
        hidAlterarEmpresaId.Value = (item.FindControl("hidEmpresaId") as HiddenField).Value;
        txtAlterarNome.Text = (item.FindControl("hidEmpresaNome") as HiddenField).Value;
        txtAlterarLocal.Text = (item.FindControl("lblLocal") as Label).Text;
        txtAlterarPfizer.Text = (item.FindControl("lblPfizer") as Label).Text;
        txtAlterarAstrazeneca.Text = (item.FindControl("lblAstrazeneca") as Label).Text;
        ddlEstadoAlterar.SelectedValue = (item.FindControl("hidEstadoId") as HiddenField).Value;

    }
}