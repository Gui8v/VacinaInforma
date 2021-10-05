using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de Vacinados
/// </summary>
public class Vacinados
{
    private int vac_id;
    private string vac_nome;
    private string vac_cpf;
    private int vac_idade;
    private int vac_qtdDoses;
    private DateTime vac_dataRegistro;
    private Vacinas van_id;
    private Estado est_id;

    public int Vac_id
    {
        get
        {
            return vac_id;
        }

        set
        {
            vac_id = value;
        }
    }

    public string Vac_nome
    {
        get
        {
            return vac_nome;
        }

        set
        {
            vac_nome = value;
        }
    }

    public string Vac_cpf
    {
        get
        {
            return vac_cpf;
        }

        set
        {
            vac_cpf = value;
        }
    }

    public int Vac_idade
    {
        get
        {
            return vac_idade;
        }

        set
        {
            vac_idade = value;
        }
    }

    public DateTime Vac_dataRegistro
    {
        get
        {
            return vac_dataRegistro;
        }

        set
        {
            vac_dataRegistro = value;
        }
    }

    public global::Estado Est_id
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

    public global::Vacinas Van_id
    {
        get
        {
            return van_id;
        }

        set
        {
            van_id = value;
        }
    }

    public int Vac_qtdDoses
    {
        get
        {
            return vac_qtdDoses;
        }

        set
        {
            vac_qtdDoses = value;
        }
    }
}