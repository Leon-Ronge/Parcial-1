<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="consulta.aspx.cs" Inherits="Parcial_1.consulta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta de Producto</title>
    <link href="Styles/estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="contenedor">
            <header class="cabecera">
                <h1>Gestión de Tienda</h1>
                <h2>Consulta de Producto</h2>
            </header>

            <div class="formulario">
                
                <div class="grupo-form">
                    <label for="TextBox1">Nombre del Producto:</label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="input-form" placeholder="Ej: Toyota RAV4"></asp:TextBox>
                </div>

                <div class="acciones-form">
                    <asp:Button ID="Button1" runat="server" CssClass="btn-form confirmar" OnClick="Button1_Click" Text="Buscar Producto" />
                </div>

                <asp:Label ID="Label1" runat="server"></asp:Label>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LP3ConnectionString %>" 
                    SelectCommand="SELECT p.idProducto, p.nombre, p.precio, c.descripcion as nombreCategoria FROM Productos p INNER JOIN Categorias c ON p.categoria = c.idCategoria WHERE (p.nombre = @nombre)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="nombre" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <div class="navegacion-volver">
                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="enlace-volver" NavigateUrl="~/inicio.aspx">← Volver al Menú Principal</asp:HyperLink>
                </div>

            </div>
        </div>
    </form>
</body>
</html>