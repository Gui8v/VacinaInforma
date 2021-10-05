<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/MasterPage.master" AutoEventWireup="true" CodeFile="GerenciamentoHome.aspx.cs" Inherits="Administrador_GerenciamentoHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-12 p-2">

        <div class="col-12 h4">Dados e Informações</div>
        <div class="col-12 p-1 ">
            <div class="col-12 h5">Geral</div>
            <div class="col-12 p-2">
                <div class="row">
                    <div class="col-6 text-center">
                        <div class="col-12">
                            <label class="font-weight-bolder">Lotes:</label>
                        </div>
                        <label class="font-weight-bolder">Pfizer:</label>
                        <asp:Label ID="lblVacinasPfizer" CssClass="col-12 font-weight-bolder" runat="server"></asp:Label>
                        <label class="font-weight-bolder">AstraZeneca:</label>
                        <asp:Label ID="lblVacinasAstrazeneca" CssClass="col-12 font-weight-bolder" runat="server"></asp:Label>
                    </div>
                    <div class="col-6 text-center">
                        <div class="col-12">
                            <label class="font-weight-bolder ">População Vacinada: </label>
                        </div>
                        <asp:Label ID="lblVaciados" CssClass="font-weight-bolder" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>

        <hr />
        <div class="col-12">
            <div class="col-12 py-1 h5 text-center">
                Estados Menos Vacinados por %
                    <div class="float-right">
                        <i class="bi bi-caret-down-square" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample"></i>
                    </div>
            </div>
        </div>

        <div class="collapse" id="collapseExample">
            <div class="col-12 p-3">
                <div class="row">
                    <asp:Repeater runat="server" ID="rptEstadosMenosVacinados">
                        <ItemTemplate>
                            <div class="col-xl-2 col-md-6 col-sm-12 p-1">
                                <div class="card bg-light mb-3 shadow ">
                                    <div class="col-12 p-2">
                                        <div class="col-12 text-center">
                                            <asp:Label ID="lblEstado" CssClass=" font-weight-bolder " runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "est_nome") + " - " + DataBinder.Eval(Container.DataItem, "est_sigla")%>' />
                                        </div>
                                        <div class="col-12">
                                            <div class="row">
                                                <asp:Label ID="lblQtdVacinados" CssClass=" font-weight-bolder col-xl-12 col-6 col-md-6 col-sm-6" runat="server" Text='<%# "Vaciados: " +DataBinder.Eval(Container.DataItem, "ContagemVacinados")%>' />
                                                <asp:Label ID="lblPorcentagem" CssClass=" font-weight-bolder  col-xl-12 col-6 col-md-6 col-sm-6" runat="server" Text='<%# "% " +DataBinder.Eval(Container.DataItem, "Porcentagem")%>' />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <hr />
        <div class="col-12 p-1 ">
            <div class="col-xl-6 col-sm-12 mt-2">
                <div class="row">
                    <label for="ddlEstado" class="col-5 p-2 h5">Dados por Estados:</label>
                    <asp:DropDownList ID="ddlEstado" AutoPostBack="true" OnSelectedIndexChanged="ddlEstado_SelectedIndexChanged" runat="server" CssClass="form-control col-7"></asp:DropDownList>
                </div>
                <div class="col-12 p-2">
                    <div class="row">
                        <div class="col-6 text-center">
                            <div class="col-12">
                                <label class="font-weight-bolder">Lotes:</label>
                            </div>
                            <label class="font-weight-bolder">Pfizer:</label>
                            <asp:Label ID="lblVacinasEstadoPfizer" CssClass="col-12 font-weight-bolder" runat="server"></asp:Label>
                            <label class="font-weight-bolder">AstraZeneca:</label>
                            <asp:Label ID="lblVacinasEstadoAstrazena" CssClass="col-12 font-weight-bolder" runat="server"></asp:Label>
                        </div>
                        <div class="col-6 text-center">
                            <div class="col-12">
                                <label class="font-weight-bolder ">População Vacinada: </label>
                            </div>
                            <asp:Label ID="lblVaciadosEstado" CssClass="font-weight-bolder" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
</asp:Content>

