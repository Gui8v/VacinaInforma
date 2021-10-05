using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de Vacinas
/// </summary>
public class Vacinas
{
    private int van_id;
    private string van_nome;

    public int Van_id
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

    public string Van_nome
    {
        get
        {
            return van_nome;
        }

        set
        {
            van_nome = value;
        }
    }
}