<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/MasterPage.master" AutoEventWireup="true" CodeFile="GerenciamentoEmpresas.aspx.cs" Inherits="Administrador_GerenciamentoEmpresas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="px-2 pt-1 col-12 m-0 input-group">
            <div class="h4">Empresas</div>
            <asp:TextBox ID="txtPesquisa" Style="font-style: italic;" class="form-control ml-2" placeholder="Buscar Empresas..." aria-label="Buscar Registros" aria-describedby="basic-addon2" runat="server"></asp:TextBox>
            <div class="input-group-append">
                <asp:LinkButton ID="btnPesquisa" OnClick="btnPesquisa_Click" CssClass="btn btn-sm btn-block btn-secondary" Style="border-radius: 0px 5px 5px 0px;" runat="server">
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                               <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                            </svg>
                        </div>
                </asp:LinkButton>

                <div class="px-1">
                    <button type="button" class="btn btn-block text-secondary" data-toggle="popover" data-content="Pesquise Empresas por: Nome, Local, Estado ou Sigla do Estado">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-info-circle-fill" viewBox="0 0 16 16">
                            <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
                        </svg>
                    </button>
                </div>
            </div>

        </div>

        <div class="col-12 p-3">

            <div class="row">

                <asp:Literal ID="ltlSemRegistros" runat="server"></asp:Literal>

                <asp:Repeater runat="server" ID="rptEmpresas">
                    <ItemTemplate>

                        <div class="col-lg-3 col-md-6">
                            <div class="card bg-light mb-3 shadow">

                                <div class="col-12 p-2">
                                    <asp:Label ID="lblNome" CssClass=" font-weight-bolder pl-3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "emp_nome") + " - " + DataBinder.Eval(Container.DataItem, "est_sigla")%>' />
                                    <asp:HiddenField ID="hidEmpresaNome" Value='<%# DataBinder.Eval(Container.DataItem, "emp_nome") %>' runat="server" />
                                    <a class=" btn btn-outline-secondary float-right btn btn-sm" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <div>⋮</div>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                                        <asp:LinkButton CssClass="dropdown-item " ID="btnAlterarRegistro" OnClick="btnAlterarRegistro_Click" runat="server">Editar</asp:LinkButton>
                                        <asp:LinkButton CssClass="dropdown-item text-danger" OnClick="btnExcluirRegistro_Click" ID="btnExcluirRegistro" runat="server">Excluir</asp:LinkButton>
                                    </div>
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
        <%--botão Cadastro--%>
        <div class="centered btn btn-secondary text-white border-0 rounded-circle bg-secondary" style="position: fixed; top: 95%; left: 100%; margin-top: -50px; margin-left: -100px;" type="button" data-toggle="modal"
            data-target="#exampleModal">
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="40" fill="currentColor" class="bi bi-person-plus" viewBox="0 0 16 16">
                <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
                <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z" />
            </svg>
        </div>
        <%--Modal Cadastro Empresa --%>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl   ">
                <div class="modal-content bg-light">
                    <div class="modal-header ">
                        <h5 class="modal-title font-weight-bolder" id="exampleModalLabel">Cadastro de Empresas</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body mx-2">

                        <label class="ml-1 h4">Empresa:</label>
                        <div class="container ">
                            <div class="row">
                                <div class="col-xl-6 col-sm-12">
                                    <label class="col-12 mt-3 h6 pl-0">Nome:</label>
                                    <asp:TextBox ID="txtNome" CssClass="form-control" type="text" runat="server" required="required"></asp:TextBox>
                                </div>
                                <div class="col-xl-6 col-sm-12">
                                    <label class="col-12 mt-3 h6 pl-0">Local:</label>
                                    <asp:TextBox ID="txtLocal" CssClass="form-control" type="text" runat="server" required="required"></asp:TextBox>
                                </div>
                                <div class="col-xl-6 col-sm-12">
                                    <label for="ddlEstado" class="font-weight-bolder mt-2">Estado:</label>
                                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control mt-1"></asp:DropDownList>
                                </div>

                            </div>

                            <hr />

                            <label class="ml-1 mt-2 h5">Lotes de Vacinas:</label>
                            <div class="container p-0 mb-4">
                                <div class="row">
                                    <div class="col-xl-6 col-sm-12">
                                        <label class="col-12 mt-3 h6 pl-0">Pfizer:</label>
                                        <asp:TextBox ID="txtPfizer" CssClass="form-control" type="number" runat="server" required="required"></asp:TextBox>
                                    </div>
                                    <div class="col-xl-6 col-sm-12">
                                        <label class="col-12 mt-3 h6 pl-0">AstraZeneca:</label>
                                        <asp:TextBox ID="txtAstraZeneca" CssClass="form-control" type="number" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <asp:LinkButton runat="server" CssClass="btn btn-secondary" OnClick="btnSalvar_Click" Text="Salvar"></asp:LinkButton>
                                <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Fechar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--Modal Cadastro Alterar --%>
        <div class="modal fade" id="ModalEditar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl   ">
                <div class="modal-content bg-light">
                    <div class="modal-header ">
                        <h5 class="modal-title font-weight-bolder" id="exampleModalLabel">Editar Empresa</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body mx-2">

                        <label class="ml-1 h4">Empresa:</label>
                        <div class="container ">
                            <div class="row">
                                <div class="col-xl-6 col-sm-12">
                                    <label class="col-12 mt-3 h6 pl-0">Nome:</label>
                                    <asp:TextBox ID="txtAlterarNome" CssClass="form-control" type="text" runat="server" required="required"></asp:TextBox>
                                </div>
                                <div class="col-xl-6 col-sm-12">
                                    <label class="col-12 mt-3 h6 pl-0">Local:</label>
                                    <asp:TextBox ID="txtAlterarLocal" CssClass="form-control" type="text" runat="server" required="required"></asp:TextBox>
                                </div>
                                <div class="col-xl-6 col-sm-12">
                                    <label for="ddlEstado" class="font-weight-bolder mt-2">Estado:</label>
                                    <asp:DropDownList ID="ddlEstadoAlterar" runat="server" CssClass="form-control mt-1"></asp:DropDownList>
                                </div>

                            </div>

                            <hr />

                            <label class="ml-1 mt-2 h5">Lotes de Vacinas:</label>
                            <div class="container p-0 mb-4">
                                <div class="row">
                                    <div class="col-xl-6 col-sm-12">
                                        <label class="col-12 mt-3 h6 pl-0">Pfizer:</label>
                                        <asp:TextBox ID="txtAlterarPfizer" CssClass="form-control" type="number" runat="server" required="required"></asp:TextBox>
                                    </div>
                                    <div class="col-xl-6 col-sm-12">
                                        <label class="col-12 mt-3 h6 pl-0">AstraZeneca:</label>
                                        <asp:TextBox ID="txtAlterarAstrazeneca" CssClass="form-control" type="number" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <asp:HiddenField ID="hidAlterarEmpresaId" runat="server" />

                            <div class="modal-footer">
                                <asp:LinkButton runat="server" CssClass="btn btn-secondary" ID="btnAlterar" OnClick="btnAlterar_Click" Text="Alterar"></asp:LinkButton>
                                <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Fechar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Excluir-->
        <div class="modal fade" id="ModalExcluir" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-danger" id="exampleModalLabel">Deseja Excluir esta Empresa?</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <asp:HiddenField ID="hidIdRegistroEcluir" runat="server" />
                    </div>
                    <div class="modal-footer">
                        <asp:LinkButton ID="btnExcluirConfirmar" CssClass="btn btn-outline-danger" runat="server" OnClick="btnExcluirConfirmar_Click">Excluir</asp:LinkButton>
                        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--Toast de Mensagem--%>
    <div class="toast border-secondary" id="msg" style="position: absolute; top: 10px; left: 10px;" data-delay="4000">
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


        $(function () {
            $('[data-toggle="popover"]').popover()
        })

        if (<%= ModalExcluir ? "true" : "false" %>) {
            $("#ModalExcluir").modal('show');
        }
        if (<%= ModalAlterar ? "true" : "false" %>) {
            $("#ModalEditar").modal('show');
        }
        if (<%= msg ? "true" : "false" %>) {
            $("#msg").toast('show');
        }
    </script>

</asp:Content>

