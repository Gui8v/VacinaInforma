<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QuadroDeVacinamento.aspx.cs" Inherits="QuadroDeVacinamento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Css.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Content/dist/loading-bar.css" />
    <script type="text/javascript" src="Content/dist/loading-bar.js"></script>
    <title>Vacina Informa - Quadro de Vacinamento</title>
</head>
<body>

    <style type="text/css">
        .ldBar path.mainline {
            stroke-width: 10;
            stroke: #09f;
            stroke-linecap: round;
        }

        .ldBar path.baseline {
            stroke-width: 14;
            stroke: #f1f2f3;
            stroke-linecap: round;
        }

        .ldBar-label {
            color: darkslategray;
            font-family: 'Cambria';
            font-size: 1.5em;
            font-weight: 400;
        }
    </style>

    <form id="form1" runat="server">

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <h5 class="navbar-brand"">Vacina Informa</h5>
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

        <div class="row mx-3 mb-2 mt-4 bg-white" style="border-radius: 5px 5px 5px 5px;">
            <div class="col-12  p-4">
                <div class="h4 col-12">Quadro de Vacinamento</div>
                <p class="col-12 h6">Verifique e se informe a respeito do estado de vacinamento de sua região :</p>
            </div>
            <div class="col-12 my-3">

                <div class="row">

                    <div class="col-5 ">
                        <label for="ddlEstado" class="font-weight-bolder float-right mt-2">Selecione Sua Região:</label>
                    </div>

                    <div class="col-4">
                        <asp:DropDownList ID="ddlEstado" AutoPostBack="true" OnSelectedIndexChanged="ddlEstado_SelectedIndexChanged" runat="server" CssClass="form-control mt-1"></asp:DropDownList>
                    </div>

                </div>
                <hr />
            </div>
            
            <div class="col-12 disabled" id="dados" >
                <div class="col-12 p-2">
                    <div class="row">
                        <div class="col-12 text-center">
                            <asp:Label ID="lblNomeEstado" CssClass="h5" runat="server"></asp:Label>
                            <div class="float-right">
                                <svg xmlns="http://www.w3.org/2000/svg" data-toggle="tooltip" data-placement="bottom" title="Os Dados utilizados são referentes aos agregados neste site" width="20" height="20" fill="currentColor" class="bi bi-info-circle-fill" viewBox="0 0 16 16">
                                    <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
                                </svg>
                            </div>
                        </div>
                        <div class="offset-1 col-3">
                            <%--Porcentagem--%>
                            <asp:Literal ID="ltlPorcentagem" runat="server"></asp:Literal>
                            <label class="font-weight-bolder">% Vacinados</label>
                        </div>
                        <div class="col-7">
                            <div class="row pt-5">
                                <div class="col-xl-6 col-6 col-md-12 col-sm-12">
                                    <label class="font-weight-bold">Populção: </label>
                                    <asp:Label ID="lblPopulação" runat="server"></asp:Label>
                                </div>
                                <div class="col-xl-6 col-6 col-md-12 col-sm-12">
                                    <label class="font-weight-bold">Vacinados: </label>
                                    <asp:Label ID="lblVaciados" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-12">
                    <div class="col-12 text-center h5 mb-3">Fornecedores</div>

                    <div class="col-12">
                        <div class="row">


                            <asp:Literal ID="ltlSemRegistros" runat="server"></asp:Literal>

                            <asp:Repeater runat="server" ID="rptEmpresas">
                                <ItemTemplate>

                                    <div class="col-lg-3 col-md-6">
                                        <div class="card bg-light mb-3 shadow">

                                            <div class="col-12 p-2">
                                                <asp:Label ID="lblNome" CssClass=" font-weight-bolder pl-3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "emp_nome")%>' />
                                                <asp:HiddenField ID="hidEmpresaNome" Value='<%# DataBinder.Eval(Container.DataItem, "emp_nome") %>' runat="server" />
                                            </div>


                                            <div class="card-body pt-1">
                                                <h6 class="card-title "><b>Local:</b>
                                                    <asp:Label ID="lblLocal" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "emp_local") %>' /></h6>
                                                <hr />
                                                <div class="row bg-white">

                                                    <div class="col-12 text-center">
                                                        <label class="font-weight-bolder">Lotes:</label>
                                                    </div>
                                                    <div class="col-6 text-center">
                                                        <h6 class="card-title">
                                                            <div class="font-weight-bolder">Pfizer</div>
                                                            <asp:Label ID="lblPfizer" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "emp_qtdPfizer") %>' />
                                                        </h6>
                                                    </div>

                                                    <div class="col-6 text-center">
                                                        <h6 class="card-title ">
                                                            <div class="font-weight-bolder">AstraZeneca</div>
                                                            <asp:Label ID="lblAstrazeneca" CssClass="col-12 " runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "emp_qtdAstrazeneca") %>' />
                                                        </h6>
                                                    </div>

                                                </div>
                                                <asp:HiddenField ID="hidEstadoId" Value='<%# DataBinder.Eval(Container.DataItem, "est_id") %>' runat="server" />
                                                <asp:HiddenField ID="hidEmpresaId" Value='<%# DataBinder.Eval(Container.DataItem, "emp_id") %>' runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })
            
        </script>
    </form>
</body>
</html>
