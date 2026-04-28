<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alta.aspx.cs" Inherits="Parcial_1.alta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Alta de Producto</title>
    <link href="Styles/estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="contenedor">
            <header class="cabecera">
                <h1>Gestión de Tienda</h1>
                <h2>Alta de Producto</h2>
            </header>

            <div class="formulario">

                <div class="grupo-form">
                    <label for="TextBox1">Nombre del Producto:</label>
                    <div>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="input-form" placeholder="Ej: Toyota RAV4"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="TextBox1" 
                            ErrorMessage="El nombre es obligatorio" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="grupo-form">
                    <label for="TextBox2">Precio:</label>
                    <div>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="input-form" placeholder="Ej: 25000"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ControlToValidate="TextBox2" 
                            ErrorMessage="El precio es obligatorio" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvPrecio" runat="server" ControlToValidate="TextBox2" 
                            Operator="GreaterThan" ValueToCompare="0" Type="Double" 
                            ErrorMessage="El precio debe ser mayor a 0" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                    </div>
                </div>

                <div class="grupo-form">
                    <label for="DropDownList1">Categoría:</label>
                    <div>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="input-form" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="idCategoria">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvCategoria" runat="server" ControlToValidate="DropDownList1" 
                            InitialValue="" ErrorMessage="Debe seleccionar una categoría" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LP3ConnectionString %>" SelectCommand="SELECT [descripcion], [idCategoria] FROM [Categorias]"></asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LP3ConnectionString %>" InsertCommand="INSERT INTO Productos(nombre, precio, categoria) VALUES (@nombre, @precio, @categoria)" OnSelecting="SqlDataSource2_Selecting" SelectCommand="SELECT * FROM [Productos]">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="nombre" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox2" Name="precio" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownList1" Name="categoria" PropertyName="SelectedValue" />
                    </InsertParameters>
                </asp:SqlDataSource>

                <div class="acciones-form">
                    <asp:Button ID="Button1" runat="server" CssClass="btn-form confirmar" OnClick="Button1_Click" Text="Confirmar Alta" />
                </div>

                <asp:Label ID="Label1" runat="server" CssClass="mensaje-feedback"></asp:Label>

                <div class="navegacion-volver">
                    <asp:HyperLink ID="hlVolver" runat="server" CssClass="enlace-volver" NavigateUrl="inicio.aspx">← Volver al Menú Principal</asp:HyperLink>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
