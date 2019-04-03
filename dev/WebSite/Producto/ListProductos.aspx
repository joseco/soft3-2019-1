<%@ Page Title="Lista de Productos" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="ListProductos.aspx.cs" Inherits="Producto_ListProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">

    <div class="row">
        <div class="col-12">
            <h1>Lista de Productos</h1>
            <asp:HyperLink runat="server" NavigateUrl="~/Producto/DetalleProducto.aspx" CssClass="btn btn-primary">
                Nuevo Producto
            </asp:HyperLink>
            <br /><br />
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            
            <asp:GridView ID="ProductosGridView" runat="server" CssClass="table" 
                GridLines="None" AutoGenerateColumns="false"
                OnRowCommand="ProductosGridView_RowCommand"> 
                <Columns>
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:LinkButton ID="EditBtn" runat="server" CommandName="Editar"
                                CommandArgument='<%# Eval("ProductoId") %>'>
                                <i class="fas fa-edit"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <asp:LinkButton ID="DeleteBtn" runat="server" CommandName="Eliminar"
                                OnClientClick="return confirm('¿Esta seguro que desea eliminar este producto?')"
                                CommandArgument='<%# Eval("ProductoId") %>'>
                                <i class="fas fa-trash-alt text-danger"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Precio Unitario" DataField="Precio" />
                    <asp:BoundField HeaderText="Stock" DataField="Stock" />
                </Columns>
            </asp:GridView>


        </div>
    </div>

</asp:Content>

