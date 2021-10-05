<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Scripts_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Css.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <title>Vicina Informa</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <h5 class="navbar-brand">Vacina Informa</h5>
                <button class="navbar-toggler float-right" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                    <div class="navbar-nav">
                        <a class="nav-link" href="Default.aspx">Inicio</a>
                        <a class="nav-link" href="QuadroDeVacinamento.aspx">Quadro de vacinamento</a>
                        <a class="nav-link" href="LoginAdm.aspx">Cetral Administrativa</a>
                    </div>
                </div>
            </nav>


            <div class="row mx-3 mt-4 bg-white" style="border-radius: 5px 5px 5px 5px;">

                <div class="col-xl-6 col-12 col-md-12 col-sm-12  p-2">
                    <div class="p-3 m-1 ml-2 bg-light">
                        <h1 class="text-center">Ajude-nos em nossa pesquisa</h1>
                        <br />
                        <p>Para fins informativos, nos enforme seu estado de vacinamento contra a doença respiratória corona vírus; sua ajuda e de outras será exibida a baixo(não revelaremos nenhuma informação pessoal) no quadro de vacinamento.</p>
                        <br />
                        <h3>Não foi vacinado ?</h3>
                        <p>Caso ainda não foi vacinado, verifique sua região, e a disponibilidade de vacinas logo abaixo no quadro de vacinamento. </p>
                        <div class="offset-2 col-8 offset-2  ">
                            <a class="btn btn-primary btn-block mt-2" href="QuadroDeVacinamento.aspx" role="button">Quadro de vacinamento</a>
                        </div>
                    </div>
                </div>

                <div class="col-xl-6 col-12 col-md-12 col-sm-12 mt-5 p-2">
                    <div class="p-3 m-1 ml-2  card bg-light" style="border-radius: 8px 8px 8px 8px;">
                        <h2 class="text-center">Nos informe aqui seu vacinamento</h2>
                        <br />
                        <p class="text-center">Clique no botão abaixo e responda nosso formulário </p>

                        <a class="btn btn-primary btn-block mt-5" href="Formulario.aspx" role="button">Formulário</a>
                    </div>

                </div>



            </div>
        </div>
    </form>
</body>
</html>
