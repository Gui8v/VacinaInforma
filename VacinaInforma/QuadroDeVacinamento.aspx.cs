using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuadroDeVacinamento : System.Web.UI.Page
{
   

    protected void Page_Load(object sender, EventArgs e)
    {
        

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

    }

    protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = VacinadosPercistecia.selectInformacoesQuadroVaciamento(ddlEstado.SelectedValue);
       
        lblNomeEstado.Text = Convert.ToString(ds.Tables[0].Rows[0]["est_nome"]);
        lblPopulação.Text = Convert.ToDecimal(Convert.ToString(ds.Tables[0].Rows[0]["est_qtdHabitantes"])).ToString("#,##0.00");
        lblVaciados.Text = Convert.ToString(ds.Tables[0].Rows[0]["contagemVacinados"]);
        ltlPorcentagem.Text = "<div data-preset='circle'  class='ldBar label-center' data-value='" + Convert.ToInt32(ds.Tables[0].Rows[0]["Porcentagem"]) + "' ></div>";
        CarregaEmpresas();

    }

    void CarregaEmpresas()
    {
        DataSet ds = EmpresasPercistencia.selectEmpresasId(Convert.ToInt32(ddlEstado.SelectedValue));

        rptEmpresas.DataSource = ds.Tables[0];
        rptEmpresas.DataBind();
    }
}