<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modificacion.aspx.cs" Inherits="Parcial_1.modificacion" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificación de Producto</title>
    <link href="Styles/estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="contenedor">
            <header class="cabecera">
                <h1>Gestión de Tienda</h1>
                <h2>Modificar Producto</h2>
            </header>

            <div class="formulario">
                <div class="grupo-form">
                    <label>Elegir Producto:</label>
                    <asp:DropDownList ID="ddlProductos" runat="server" CssClass="input-form" 
                        AutoPostBack="True" DataSourceID="SqlDataSourceProductos" 
                        DataTextField="nombre" DataValueField="idProducto" 
                        OnSelectedIndexChanged="ddlProductos_SelectedIndexChanged" AppendDataBoundItems="true">
                        <asp:ListItem Value="0" Text="-- Seleccione --"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <hr style="margin: 10px 0; border: 0; border-top: 1px solid #eee;" />

                <div class="grupo-form">
                    <label>Nuevo Nombre:</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="input-form"></asp:TextBox>
                </div>

                <div class="grupo-form">
                    <label>Nuevo Precio:</label>
                    <asp:TextBox ID="txtPrecio" runat="server" CssClass="input-form"></asp:TextBox>
                </div>

                <div class="grupo-form">
                    <label>Nueva Categoría:</label>
                    <asp:DropDownList ID="ddlCategorias" runat="server" CssClass="input-form" 
                        DataSourceID="SqlDataSourceCategorias" DataTextField="descripcion" DataValueField="idCategoria">
                    </asp:DropDownList>
                </div>

                <div class="acciones-form">
                    <asp:Button ID="btnGuardar" runat="server" CssClass="btn-form confirmar" 
                        Text="Guardar Cambios" OnClick="btnGuardar_Click" />
                </div>

                <asp:Label ID="lblMensaje" runat="server"></asp:Label>

                <asp:SqlDataSource ID="SqlDataSourceProductos" runat="server" ConnectionString="<%$ ConnectionStrings:LP3ConnectionString %>" 
                    SelectCommand="SELECT [idProducto], [nombre] FROM [Productos]"></asp:SqlDataSource>
                
                <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server" ConnectionString="<%$ ConnectionStrings:LP3ConnectionString %>" 
                    SelectCommand="SELECT [idCategoria], [descripcion] FROM [Categorias]"></asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlDataSourceUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:LP3ConnectionString %>" 
                    UpdateCommand="UPDATE Productos SET nombre = @nombre, precio = @precio, categoria = @categoria WHERE idProducto = @idProducto">
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="txtNombre" Name="nombre" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtPrecio" Name="precio" PropertyName="Text" />
                        <asp:ControlParameter ControlID="ddlCategorias" Name="categoria" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ddlProductos" Name="idProducto" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <div class="navegacion-volver">
                    <asp:HyperLink ID="hlVolver" runat="server" CssClass="enlace-volver" NavigateUrl="~/inicio.aspx">← Volver al Menú Principal</asp:HyperLink>
                </div>
            </div>
        </div>
    </form>
</body>
</html>