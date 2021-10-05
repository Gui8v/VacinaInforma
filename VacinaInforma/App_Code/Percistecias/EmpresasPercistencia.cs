using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;


public class EmpresasPercistencia
{
    public static int CadastroEmpresa(Empresa emp)
    {

        int retorno = 0;

        try
        {

            DataSet ds = new DataSet();
            IDbConnection objConexao;
            IDbCommand objCommand;
            IDataAdapter objDataAdapter;
            string query = "insert into empresa (`emp_nome`, `emp_local`, `emp_qtdPfizer`, `emp_qtdAstrazeneca`, `est_id`)  VALUES (?emp_nome, ?emp_local, ?emp_qtdPfizer, ?emp_qtdAstrazeneca, ?est_id);";
            objConexao = mapped.Connection();
            objCommand = mapped.Command(query, objConexao);
            objCommand.Parameters.Add(mapped.Parameter("?emp_nome", emp.Emp_nome));
            objCommand.Parameters.Add(mapped.Parameter("?emp_local", emp.Emp_local));
            objCommand.Parameters.Add(mapped.Parameter("?emp_qtdPfizer", emp.Emp_qtdPfizer));           
            objCommand.Parameters.Add(mapped.Parameter("?emp_qtdAstrazeneca", emp.Emp_qtdAstrazeneca));
            objCommand.Parameters.Add(mapped.Parameter("?est_id", emp.Est_id.Est_id));


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

    public static int UpdateEmpresa(Empresa emp)
    {

        int retorno = 0;

        try
        {

            DataSet ds = new DataSet();
            IDbConnection objConexao;
            IDbCommand objCommand;
            IDataAdapter objDataAdapter;
            string query = "update empresa set emp_nome = ?emp_nome, emp_local = ?emp_local, emp_qtdPfizer = ?emp_qtdPfizer, emp_qtdAstrazeneca = ?emp_qtdAstrazeneca, est_id = ?est_id where emp_id = ?emp_id;";
            objConexao = mapped.Connection();
            objCommand = mapped.Command(query, objConexao);
            objCommand.Parameters.Add(mapped.Parameter("?emp_id", emp.Emp_id));
            objCommand.Parameters.Add(mapped.Parameter("?emp_nome", emp.Emp_nome));
            objCommand.Parameters.Add(mapped.Parameter("?emp_local", emp.Emp_local));
            objCommand.Parameters.Add(mapped.Parameter("?emp_qtdPfizer", emp.Emp_qtdPfizer));
            objCommand.Parameters.Add(mapped.Parameter("?emp_qtdAstrazeneca", emp.Emp_qtdAstrazeneca));
            objCommand.Parameters.Add(mapped.Parameter("?est_id", emp.Est_id.Est_id));


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

    public static DataSet selectEmpresas()
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select emp_id, emp_nome, emp_local, emp_qtdPfizer, emp_qtdAstrazeneca, est_id, est_sigla from empresa inner join estado using(est_id);";                         

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);


        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static DataSet selectEmpresasId(int id)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select emp_id, emp_nome, emp_local, emp_qtdPfizer, emp_qtdAstrazeneca, est_id from empresa inner join estado using(est_id) where est_id = "+ id +";";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);


        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static DataSet selectEmpresasPesquisa(string pesquisa)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select emp_id, emp_nome, emp_local, emp_qtdPfizer, emp_qtdAstrazeneca, est_id, est_nome, est_sigla from empresa inner join estado using(est_id) where (emp_nome like '%" + pesquisa + "%' or emp_local like '%" + pesquisa + "%' or est_nome like '%" + pesquisa + "%' or est_sigla like '%" + pesquisa + "%');";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);


        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static int DeleteEmpresa(Empresa emp)
    {

        int retorno = 0;

        try
        {

            DataSet ds = new DataSet();
            IDbConnection objConexao;
            IDbCommand objCommand;
            IDataAdapter objDataAdapter;
            string query = "delete from empresa WHERE emp_id = "+ emp.Emp_id +";";
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

    public static DataSet selectTotalVacinas()
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select sum(emp_qtdPfizer) as 'Pfizer', sum(emp_qtdAstrazeneca) as 'Astrazeeca' from empresa;";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);


        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static DataSet selectTotalVacinasEstado(string estado)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select sum(emp_qtdPfizer) as 'Pfizer', sum(emp_qtdAstrazeneca) as 'Astrazeeca' from empresa where est_id = '"+ estado + "';";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);


        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

}