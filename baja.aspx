<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="baja.aspx.cs" Inherits="Parcial_1.baja" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Baja de Producto</title>
    <link href="Styles/estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="contenedor">
            <header class="cabecera">
                <h1>Gestión de Tienda</h1>
                <h2>Baja de Producto</h2>
            </header>

            <div class="formulario">
                
                <div class="grupo-form">
                    <label for="ddlProductos">Seleccionar Producto:</label>
                    <asp:DropDownList ID="ddlProductos" runat="server" CssClass="input-form" DataSourceID="SqlDataSourceProductos" DataTextField="nombre" DataValueField="idProducto" AppendDataBoundItems="true">
                        <asp:ListItem Value="" Text="-- Seleccione un producto --"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <asp:SqlDataSource ID="SqlDataSourceProductos" runat="server" ConnectionString="<%$ ConnectionStrings:LP3ConnectionString %>" SelectCommand="SELECT [idProducto], [nombre] FROM [Productos]"></asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlDataSourceEliminar" runat="server" ConnectionString="<%$ ConnectionStrings:LP3ConnectionString %>" DeleteCommand="DELETE FROM [Productos] WHERE [idProducto] = @idProducto">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="ddlProductos" Name="idProducto" PropertyName="SelectedValue" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>

                <div class="acciones-form">
                    <asp:Button ID="btnEliminar" runat="server" CssClass="btn-form cancelar" OnClick="btnEliminar_Click" Text="Eliminar Producto" OnClientClick="return confirm('¿Estás seguro de que deseas eliminar este producto de forma permanente?');" />
                </div>

                <asp:Label ID="lblMensaje" runat="server"></asp:Label>

                <div class="navegacion-volver">
                    <asp:HyperLink ID="hlVolver" runat="server" CssClass="enlace-volver" NavigateUrl="~/inicio.aspx">← Volver al Menú Principal</asp:HyperLink>
                </div>

            </div>
        </div>
    </form>
</body>
</html>