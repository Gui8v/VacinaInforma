using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrador_GerenciamentoHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            atualizarPagina();
        }

        DataSet ds1 = EmpresasPercistencia.selectTotalVacinas();
        lblVacinasPfizer.Text = Convert.ToString(ds1.Tables[0].Rows[0]["Pfizer"]);
        lblVacinasAstrazeneca.Text = Convert.ToString(ds1.Tables[0].Rows[0]["Astrazeeca"]);

        DataSet ds2 = VacinadosPercistecia.selectTotalVacinados();
        DataSet ds5 = EstadosPercistencia.selectTotalHabitantes();
        lblVaciados.Text = "( " + Convert.ToString(ds2.Tables[0].Rows[0]["ContagemVacinados"]) + " De " + Convert.ToDecimal(Convert.ToString(ds5.Tables[0].Rows[0]["PopulacaoTotal"])).ToString("#,##0.00") + " )";

    }

    public void atualizarPagina()
    {
        carregaddlEstados();
        CarregaEstadosMenosVacinados();
    }

    void CarregaEstadosMenosVacinados()
    {
        DataSet dsRegistro = EstadosPercistencia.selectEstadosMenosVacinados();

        rptEstadosMenosVacinados.DataSource = dsRegistro.Tables[0];
        rptEstadosMenosVacinados.DataBind();
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
        DataSet ds3 = EmpresasPercistencia.selectTotalVacinasEstado(ddlEstado.SelectedValue);
        lblVacinasEstadoPfizer.Text = Convert.ToString(ds3.Tables[0].Rows[0]["Pfizer"]);
        lblVacinasEstadoAstrazena.Text = Convert.ToString(ds3.Tables[0].Rows[0]["Astrazeeca"]);

        DataSet ds4 = VacinadosPercistecia.selectTotalVacinadosEstado(ddlEstado.SelectedValue);
        DataSet ds5 = EstadosPercistencia.selectTotalHabitantesEstado(ddlEstado.SelectedValue);
        lblVaciadosEstado.Text = "( " + Convert.ToString(ds4.Tables[0].Rows[0]["ContagemVacinados"]);
        lblVaciadosEstado.Text += " De " + Convert.ToDecimal(Convert.ToString(ds5.Tables[0].Rows[0]["PopulacaoTotal"])).ToString("#,##0.00") + " )";

    }
}