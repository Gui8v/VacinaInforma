using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de Estado
/// </summary>
public class Estado
{
    private int est_id;
    private string est_nome;
    private int est_qtdHabitantes;
    private string est_sigla;

    public int Est_id
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

    public string Est_nome
    {
        get
        {
            return est_nome;
        }

        set
        {
            est_nome = value;
        }
    }

    public int Est_qtdHabitantes
    {
        get
        {
            return est_qtdHabitantes;
        }

        set
        {
            est_qtdHabitantes = value;
        }
    }

    public string Est_sigla
    {
        get
        {
            return est_sigla;
        }

        set
        {
            est_sigla = value;
        }
    }
}