<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Formulario.aspx.cs" Inherits="Formulario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Css.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <title>Vicina Informa - Formulário</title>
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

                <div class="col-12  p-4">

                    <div class="col-12 text-left h2 p-2">Formulário</div>

                    <div class="col-12">

                        <div class="row">

                            <div class="col-xl-6 col-sm-12">
                                <label for="txtNome" class="font-weight-bolder mt-2">Nome:</label>
                                <asp:TextBox ID="txtNome" CssClass="form-control mt-1" runat="server" placeholder="obrigatorio" required="required"></asp:TextBox>
                            </div>
                            <div class="col-xl-6 col-sm-12">
                                <label for="txtCpf" class="font-weight-bolder mt-2">CPF:</label>
                                <asp:TextBox ID="txtCpf" CssClass="form-control mt-1" runat="server" placeholder="obrigatorio" required="required"></asp:TextBox>
                            </div>
                            <div class="col-xl-6 col-sm-12">
                                <label for="txtIdade" class="font-weight-bolder mt-2">Idade:</label>
                                <asp:TextBox ID="txtIdade" type="number" CssClass="form-control mt-1" runat="server" placeholder="obrigatorio" required="required"></asp:TextBox>
                            </div>
                            <div class="col-xl-6 col-sm-12">
                                <label for="ddlEstado" class="font-weight-bolder mt-2">Estado:</label>
                                <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control mt-1"></asp:DropDownList>
                            </div>

                        </div>
                         
                        <div class="row">
                            <div class="col-12 mt-2">
                                <label class="font-weight-bolder text-center">Qual Vacina e Doses Tomou ?</label>
                            </div>
                            <div class="col-6">
                                <label for="ddlVacinas " class="font-weight-bolder mt-2">Vacina:</label>
                                <asp:DropDownList ID="ddlVacinas" CssClass="form-control mt-1" runat="server"></asp:DropDownList>
                            </div>

                            <div class="col-xl-6 col-sm-12">
                                <label for="txtDose " class="font-weight-bolder mt-2">Dose(s):</label>
                                <asp:TextBox ID="txtDose" type="number" CssClass="form-control mt-1" runat="server" placeholder="obrigatorio" required="required"></asp:TextBox>
                            </div>
                        </div>


                        <div>
                            <asp:Button ID="btnEviar" CssClass="form-control btn btn-secondary  mt-2 col-12 mt-5" runat="server" Text="Enviar" OnClick="btnEviar_Click" />
                        </div>

                    </div>
                </div>

            </div>

            <%--Toast de Mensagem--%>
            <div class="toast border-secondary" id="msg" style="position: absolute; top: 10px; right: 10px;" data-delay="4000">
                <div class="toast-header">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                        <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
                    </svg>
                    <strong class="mr-auto ml-2">Mensagem</strong>
                    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="toast-body">
                    <asp:Literal ID="ltlMsg" runat="server"></asp:Literal>
                </div>
            </div>
             <script>

                 if (<%= msg ? "true" : "false" %>) {
                     $("#msg").toast('show');
                 }
             </script>
        </div>
       
    </form>

</body>
</html>
