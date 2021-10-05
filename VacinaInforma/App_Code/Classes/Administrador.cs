using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de Administrador
/// </summary>
public class Administrador
{
    private int adm_id;
    private string adm_nome;
    private string adm_email;
    private string adm_senha;
    private string adm_permicao;


    public int Adm_id
    {
        get
        {
            return adm_id;
        }

        set
        {
            adm_id = value;
        }
    }

    public string Adm_nome
    {
        get
        {
            return adm_nome;
        }

        set
        {
            adm_nome = value;
        }
    }

    public string Adm_email
    {
        get
        {
            return adm_email;
        }

        set
        {
            adm_email = value;
        }
    }

    public string Adm_senha
    {
        get
        {
            return adm_senha;
        }

        set
        {
            adm_senha = value;
        }
    }

    public string Adm_permicao
    {
        get
        {
            return adm_permicao;
        }

        set
        {
            adm_permicao = value;
        }
    }
}