<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="Parcial_1.inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Menú Principal - Gestión de Tienda</title>
    <link href="Styles/estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="contenedor">
            
            <header class="cabecera">
                <h1>Proyecto Primer Parcial LP3</h1>
                <h2>Gestión de Tienda</h2>
            </header>

            <div class="menu-opciones">
                <asp:HyperLink ID="hlAlta" runat="server" CssClass="btn-menu" NavigateUrl="~/Alta.aspx">Alta de Producto</asp:HyperLink>
                <asp:HyperLink ID="hlConsulta" runat="server" CssClass="btn-menu" NavigateUrl="~/Consulta.aspx">Consulta de Productos</asp:HyperLink>
                <asp:HyperLink ID="hlModificacion" runat="server" CssClass="btn-menu" NavigateUrl="~/Modificacion.aspx">Modificación de Producto</asp:HyperLink>
                <asp:HyperLink ID="hlBaja" runat="server" CssClass="btn-menu" NavigateUrl="~/Baja.aspx">Baja de Producto</asp:HyperLink>
            </div>

        </div>
    </form>
</body>
</html>