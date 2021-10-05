using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;


public class AdmninstradorPercistencia
{
    public static DataSet VerificaLogin(Administrador adm)
    {
        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand command;
        IDbDataAdapter adap;
        string sql = "select * from administrador where adm_email = ?Adm_email and adm_senha = ?Adm_senha;";
        objConexao = mapped.Connection();
        command = mapped.Command(sql, objConexao);
        command.Parameters.Add(mapped.Parameter("?Adm_email", adm.Adm_email));
        command.Parameters.Add(mapped.Parameter("?Adm_senha", adm.Adm_senha));
        adap = mapped.Adapter(command);
        adap.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        command.Dispose();


        return ds;
    }

    public static int CadastroAdm(Administrador adm)
    {

        int retorno = 0;

        try
        {

            DataSet ds = new DataSet();
            IDbConnection objConexao;
            IDbCommand objCommand;
            IDataAdapter objDataAdapter;
            string query = "INSERT INTO administrador (`adm_nome`, `adm_email`, `adm_senha`, `adm_permicao`) VALUES (?adm_nome, " +
                "?adm_email, ?adm_senha, ?adm_permicao);";
            objConexao = mapped.Connection();
            objCommand = mapped.Command(query, objConexao);
            objCommand.Parameters.Add(mapped.Parameter("?adm_nome", adm.Adm_nome));
            objCommand.Parameters.Add(mapped.Parameter("?adm_email", adm.Adm_email));
            objCommand.Parameters.Add(mapped.Parameter("?adm_senha", adm.Adm_senha));
            objCommand.Parameters.Add(mapped.Parameter("?adm_permicao", adm.Adm_permicao));


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
}