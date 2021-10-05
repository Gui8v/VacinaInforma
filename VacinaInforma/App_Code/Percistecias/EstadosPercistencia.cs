using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;


public class EstadosPercistencia
{
    public static DataSet ddlSelectEstados()
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;
        string query = "select est_id, est_nome from estado;";
        objConexao = mapped.Connection();
        objCommand = mapped.Command(query, objConexao);

        objDataAdapter = mapped.Adapter(objCommand);
        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;

    }

    public static DataSet selectEstadosMenosVacinados()
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select est_nome, est_sigla, count(CASE van_id  WHEN '1'  THEN  1 ELSE NULL END or CASE van_id  WHEN '2' THEN  1 ELSE NULL END) as 'ContagemVacinados', ROUND(((count(CASE van_id  WHEN '1'  THEN  1 ELSE NULL END or CASE van_id  WHEN '2' THEN  1 ELSE NULL END) * 100) / est_qtdHabitantes), 4) as 'Porcentagem'from vacinados inner join estado using (est_id) group by est_id order by Porcentagem ASC limit 5;";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static DataSet selectTotalHabitantes()
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;
        string query = "select sum(est_qtdHabitantes) as 'PopulacaoTotal'  from estado;";
        objConexao = mapped.Connection();
        objCommand = mapped.Command(query, objConexao);

        objDataAdapter = mapped.Adapter(objCommand);
        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;

    }

    public static DataSet selectTotalHabitantesEstado(string estado)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;
        string query = "select est_qtdHabitantes as 'PopulacaoTotal'  from estado where est_id = "+ estado +";";
        objConexao = mapped.Connection();
        objCommand = mapped.Command(query, objConexao);

        objDataAdapter = mapped.Adapter(objCommand);
        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;

    }

}