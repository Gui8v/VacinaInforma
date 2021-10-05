using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;


public class VacinadosPercistecia
{
    public static int CadastroVacinado(Vacinados vac)
    {
        int retorno = 0;

        try
        {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;
        string query = "insert into vacinados (`vac_nome`, `vac_cpf`, `vac_idade`, `vac_qtdDose`, `vac_dataregistro`, `est_id`, `van_id`) VALUES (?vac_nome, ?vac_cpf, ?vac_idade, ?vac_qtdDose, ?vac_dataregistro, ?est_id, ?van_id);";
        objConexao = mapped.Connection();
        objCommand = mapped.Command(query, objConexao);
        objCommand.Parameters.Add(mapped.Parameter("?vac_nome", vac.Vac_nome));
        objCommand.Parameters.Add(mapped.Parameter("?vac_cpf", vac.Vac_cpf));
        objCommand.Parameters.Add(mapped.Parameter("?vac_idade", vac.Vac_idade));
        objCommand.Parameters.Add(mapped.Parameter("?vac_qtdDose", vac.Vac_qtdDoses));
        objCommand.Parameters.Add(mapped.Parameter("?vac_dataregistro", vac.Vac_dataRegistro));
        objCommand.Parameters.Add(mapped.Parameter("?van_id", vac.Van_id.Van_id));
        objCommand.Parameters.Add(mapped.Parameter("?est_id", vac.Est_id.Est_id));


        objDataAdapter = mapped.Adapter(objCommand);
        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        }
        catch (ArgumentException ex)
        {
            retorno = -2;
        }
        return retorno;

    }

    public static DataSet selectVacinados()
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select vac_id, vac_nome, vac_cpf, vac_idade, vac_qtdDose, van_id, van_nome, est_id, est_nome, est_sigla from vacinados inner join estado using(est_id) inner join vacinas using(van_id);";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }


    public static DataSet selectVacinadosPesquisa(string pesquisa)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select vac_id, vac_nome, vac_cpf, vac_idade, vac_qtdDose, van_id, van_nome, est_id, est_nome, est_sigla from vacinados inner join estado using(est_id) inner join vacinas using(van_id) where (vac_nome like 'Je' or vac_cpf like '%" + pesquisa + "%' or est_nome like '%" + pesquisa + "%' or est_sigla like '%" + pesquisa + "%');";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static DataSet selectInformacoesQuadroVaciamento(string pesquisa)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select est_nome, est_qtdHabitantes, count(CASE van_id  WHEN '1'  THEN  1 ELSE NULL END or CASE van_id  WHEN '2' THEN  1 ELSE NULL END) as 'ContagemVacinados', ROUND(((count(CASE van_id  WHEN '1'  THEN  1 ELSE NULL END or CASE van_id  WHEN '2' THEN  1 ELSE NULL END) * 100) / est_qtdHabitantes),2) as 'Porcentagem' from vacinados right join estado using (est_id) where est_id = " + pesquisa +"; ";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static int UpdateVacinado(Vacinados vac)
    {

        int retorno = 0;

        try
        {

            DataSet ds = new DataSet();
            IDbConnection objConexao;
            IDbCommand objCommand;
            IDataAdapter objDataAdapter;
            string query = "update vacinados set vac_nome = ?vac_nome, vac_cpf = ?vac_cpf, vac_idade = ?vac_idade, vac_qtdDose = ?vac_qtdDose, van_id = ?van_id, est_id = ?est_id where vac_id = ?vac_id;";
            objConexao = mapped.Connection();
            objCommand = mapped.Command(query, objConexao);
            objCommand.Parameters.Add(mapped.Parameter("?vac_id", vac.Vac_id));
            objCommand.Parameters.Add(mapped.Parameter("?vac_nome", vac.Vac_nome));
            objCommand.Parameters.Add(mapped.Parameter("?vac_cpf", vac.Vac_cpf));
            objCommand.Parameters.Add(mapped.Parameter("?vac_qtdDose", vac.Vac_qtdDoses));
            objCommand.Parameters.Add(mapped.Parameter("?vac_idade", vac.Vac_idade));
            objCommand.Parameters.Add(mapped.Parameter("?van_id", vac.Van_id.Van_id));
            objCommand.Parameters.Add(mapped.Parameter("?est_id", vac.Est_id.Est_id));

            objDataAdapter = mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);
            objConexao.Close();
            objConexao.Dispose();
            objCommand.Dispose();

        }
        catch (ArgumentException ex)
        {
            retorno = -2;
        }
        return retorno;

    }

    public static int DeleteVacinado(Vacinados vac)
    {

        int retorno = 0;

        try
        {

            DataSet ds = new DataSet();
            IDbConnection objConexao;
            IDbCommand objCommand;
            IDataAdapter objDataAdapter;
            string query = "delete from vacinados WHERE vac_id = " + vac.Vac_id + ";";
            objConexao = mapped.Connection();
            objCommand = mapped.Command(query, objConexao);

            objDataAdapter = mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);
            objConexao.Close();
            objConexao.Dispose();
            objCommand.Dispose();

        }
        catch (ArgumentException ex)
        {
            retorno = -2;
        }
        return retorno;

    }

    public static DataSet selectTotalVacinados()
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select count(van_id) as 'ContagemVacinados' from vacinados;";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static DataSet selectTotalVacinadosEstado(string estado)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select count(van_id) as 'ContagemVacinados' from vacinados where est_id = "+ estado +";";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

}