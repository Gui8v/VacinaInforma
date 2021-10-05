<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginAdm.aspx.cs" Inherits="LoginAdm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="Content/Css.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <title>Vicina Informa - Login Administrção</title>
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
            <div class=" row mx-3 mt-4 bg-white" style="border-radius: 5px 5px 5px 5px;">
                <div class="col-12  p-4">
                    <div class="col-12 text-left h2 p-2 mb-4">Login Administração</div>
                    <div class="offset-1 col-10 offset-1">
                        <div class="col-12">

                            <label for="txtEmail" class="font-weight-bolder mt-2">E-mail</label>
                            <asp:TextBox ID="txtEmail" type="email" CssClass="form-control mt-1" runat="server" placeholder="Entre com um email Administrativo..." required="required"></asp:TextBox>
                        </div>

                        <div class="col-12">
                            <br />
                        </div>

                        <div class="col-12">
                            <label for="txtSenha" class="font-weight-bolder mt-2">Senha</label>
                            <asp:TextBox ID="txtSenha" type="password" CssClass="form-control mt-1" runat="server" required="required"></asp:TextBox>
                            <div class="mb-3">
                                <asp:Literal ID="ltl" runat="server"></asp:Literal>
                                <asp:Button ID="btnEviar" CssClass="form-control btn btn-secondary  mt-2 col-12 mt-5" runat="server" Text="Logar" OnClick="btnEviar_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
