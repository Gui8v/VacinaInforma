<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/MasterPage.master" AutoEventWireup="true" CodeFile="CadastroAdm.aspx.cs" Inherits="Administrador_CadastroAdm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="col-12  p-4">

        <div class="col-12 text-left h2 p-2">Cadastro de Administrador</div>

        <div class="col-12">

            <div class="row">

                <div class="col-xl-6 col-sm-12">
                    <label for="txtNome" class="font-weight-bolder mt-2">Nome:</label>
                    <asp:TextBox ID="txtNome" CssClass="form-control mt-1" runat="server" placeholder="obrigatorio" required="required"></asp:TextBox>
                </div>
                <div class="col-xl-6 col-sm-12">
                    <label for="txtEmail" class="font-weight-bolder mt-2">E-mail:</label>
                    <asp:TextBox ID="txtEmail" type="email" CssClass="form-control mt-1" runat="server" placeholder="obrigatorio" required="required"></asp:TextBox>
                </div>
                <div class="col-xl-6 col-sm-12">
                    <label for="txtSenha" class="font-weight-bolder mt-2">Senha:</label>
                    <asp:TextBox ID="txtSenha" CssClass="form-control mt-1" runat="server" placeholder="obrigatorio" required="required"></asp:TextBox>
                </div>
                <div class="col-xl-6 col-sm-12 ">
                    <label for="txtItxtSenhaConfirmadade" class="font-weight-bolder mt-2">Confirmar Senha:</label>
                    <asp:TextBox ID="txtSenhaConfirma" CssClass="form-control mt-1" runat="server" placeholder="obrigatorio" required="required"></asp:TextBox>
                </div>
                <div class="col-xl-6 col-sm-12 mt-2">
                    <label for="cboPermicao" class="font-weight-bolder mt-2">Permisão de Cadastro de Admiistrador:</label>
                    <asp:CheckBox ID="cboPermicao" runat="server" />
                </div>

            </div>
            <div>
                <asp:Button ID="btnEviar" CssClass="form-control btn btn-secondary mt-2 col-12 mt-5" OnClick="btnEviar_Click" runat="server" Text="Enviar" />
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

</asp:Content>

