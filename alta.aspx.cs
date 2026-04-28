using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial_1
{
    public partial class alta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                // validacion campos vacios
                if (string.IsNullOrWhiteSpace(TextBox1.Text))
                {
                    Label1.CssClass = "mensaje-feedback error";
                    Label1.Text = "El nombre del producto es obligatorio.";
                    return;
                }

                if (string.IsNullOrWhiteSpace(TextBox2.Text))
                {
                    Label1.CssClass = "mensaje-feedback error";
                    Label1.Text = "El precio es obligatorio.";
                    return;
                }

                // validacion precio numerico y mayor a 0
                if (!decimal.TryParse(TextBox2.Text, out decimal precio) || precio <= 0)
                {
                    Label1.CssClass = "mensaje-feedback error";
                    Label1.Text = "El precio debe ser un número mayor a 0.";
                    return;
                }

                // validacion categoria
                if (string.IsNullOrEmpty(DropDownList1.SelectedValue) || DropDownList1.SelectedValue == "0")
                {
                    Label1.CssClass = "mensaje-feedback error";
                    Label1.Text = "Debe seleccionar una categoría.";
                    return;
                }

                // si todas las validaciones pasan, insertar el registro
                SqlDataSource2.Insert();

                // mensaje exito
                Label1.CssClass = "mensaje-feedback exito";
                Label1.Text = "¡Producto guardado exitosamente!";

                // limpiar los campos 
                TextBox1.Text = "";
                TextBox2.Text = "";
                DropDownList1.SelectedIndex = 0;
            }
            catch (Exception ex)
            {
                // mensaje error
                Label1.CssClass = "mensaje-feedback error";
                Label1.Text = "Error al guardar: " + ex.Message;
            }
        }
    }
}