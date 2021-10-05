using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de Empresa
/// </summary>
public class Empresa
{
    private int emp_id;
    private string emp_nome;
    private string emp_local;
    private int emp_qtdPfizer;
    private int emp_qtdAstrazeneca;
    private Estado est_id;

    public int Emp_id
    {
        get
        {
            return emp_id;
        }

        set
        {
            emp_id = value;
        }
    }

    public string Emp_nome
    {
        get
        {
            return emp_nome;
        }

        set
        {
            emp_nome = value;
        }
    }

    public string Emp_local
    {
        get
        {
            return emp_local;
        }

        set
        {
            emp_local = value;
        }
    }

    public int Emp_qtdPfizer
    {
        get
        {
            return emp_qtdPfizer;
        }

        set
        {
            emp_qtdPfizer = value;
        }
    }

    public int Emp_qtdAstrazeneca
    {
        get
        {
            return emp_qtdAstrazeneca;
        }

        set
        {
            emp_qtdAstrazeneca = value;
        }
    }

    public Estado Est_id
    {
        get
        {
            return est_id;
        }

        set
        {
            est_id = value;
        }
    }
}