
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="DetalleProducto.aspx.cs" Inherits="Producto_DetalleProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">

    <div class="row">
        <div class="col-12">
            <h1>
                <asp:Literal runat="server" ID="LabelTitle"></asp:Literal>
                Producto
            </h1>            
            <asp:HyperLink runat="server" NavigateUrl="~/Producto/ListProductos.aspx">
                Volver a la Lista de Productos
            </asp:HyperLink>

            <asp:Panel ID="PanelError" runat="server" Visible="false" CssClass="alert alert-danger" role="alert">
                <asp:Literal ID="MsgLiteral" runat="server"></asp:Literal>
            </asp:Panel>
        </div>
    </div>
    <div class="row">
        <div class="col-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="NombreTextBox">Nombre</asp:Label>
                <asp:TextBox ID="NombreTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                <div class="text-danger">
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic"
                        ErrorMessage="Debe ingresar el nombre"
                        ValidationGroup="Producto"
                        ControlToValidate="NombreTextBox">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            

            <div class="form-group">
                <label>Precio</label>
                <asp:TextBox ID="PrecioTextBox" TextMode="Number" min="0" runat="server" CssClass="form-control"></asp:TextBox>
                <div class="text-danger">
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic"
                        ErrorMessage="Debe ingresar el precio del producto"
                        ValidationGroup="Producto"
                        ControlToValidate="PrecioTextBox">
                    </asp:RequiredFieldValidator>
                    <asp:CompareValidator runat="server" Display="Dynamic"
                        ErrorMessage="El precio no puede ser negativo"
                        Operator="GreaterThan" ValueToCompare="0"
                        ControlToValidate="PrecioTextBox">

                    </asp:CompareValidator>
                </div>
            </div>

            
            <div class="form-group">
                <label>Cantidad de Stock</label>
                <asp:TextBox ID="StockTextBox" TextMode="Number" min="0" runat="server" CssClass="form-control"></asp:TextBox>
                <div class="text-danger">
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic"
                        ErrorMessage="Debe ingresar la cantidad de stock"
                        ValidationGroup="Producto"
                        ControlToValidate="StockTextBox">
                    </asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:LinkButton ID="SaveButton" runat="server" OnClick="SaveButton_Click"
                    CssClass="btn btn-primary"
                    ValidationGroup="Producto">
                    Guardar
                </asp:LinkButton>
                <asp:HyperLink runat="server" NavigateUrl="~/Producto/ListProductos.aspx" CssClass="btn">
                    Cancelar
                </asp:HyperLink>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="ProductoIdHiddenField" runat="server" Value="0" />
</asp:Content>

