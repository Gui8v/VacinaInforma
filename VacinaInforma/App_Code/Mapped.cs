using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

public class mapped
{
    public static IDbConnection Connection()
    {

        MySqlConnection objConexao = new MySqlConnection(ConfigurationManager.AppSettings["strConexao"]);
        return objConexao;
    }

    public static IDbCommand Command(string query, IDbConnection objConexao)
    {

        IDbCommand command = objConexao.CreateCommand();
        command.CommandText = query;
        return command;
    }

    public static IDbDataAdapter Adapter(IDbCommand command)
    {

        IDbDataAdapter adap = new MySqlDataAdapter();
        adap.SelectCommand = command;
        return adap;
    }

    public static IDbDataParameter Parameter(string nomeDoParametro, object valor)
    {

        return new MySqlParameter(nomeDoParametro, valor);


    }
}