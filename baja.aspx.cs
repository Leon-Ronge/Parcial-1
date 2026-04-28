using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial_1
{
    public partial class baja : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            // validacion producto seleccionado
            if (string.IsNullOrEmpty(ddlProductos.SelectedValue))
            {
                lblMensaje.Text = "Por favor, seleccione un producto de la lista.";
                lblMensaje.CssClass = "mensaje-feedback advertencia";
                return;
            }

            try
            {
                // delete
                int filasAfectadas = SqlDataSourceEliminar.Delete();

                // verificacion 
                if (filasAfectadas > 0)
                {
                    // mensaje exito
                    lblMensaje.Text = "¡Producto eliminado correctamente!";
                    lblMensaje.CssClass = "mensaje-feedback exito";

                    // actualizacion de lista
                    ddlProductos.DataBind();
                }
                else
                {
                    // mensaje error
                    lblMensaje.Text = "No se pudo eliminar el producto.";
                    lblMensaje.CssClass = "mensaje-feedback error";
                }
            }
            catch (Exception ex)
            {
                // mensaje error
                lblMensaje.Text = "Error al eliminar: " + ex.Message;
                lblMensaje.CssClass = "mensaje-feedback error";
            }
        }
    }
}