using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace Parcial_1
{
    public partial class modificacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        //elegimos un producto 
        protected void ddlProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProductos.SelectedValue == "0") return;

            // buscamos los datos actuales 
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["LP3ConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT nombre, precio, categoria FROM Productos WHERE idProducto = @id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", ddlProductos.SelectedValue);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    // llenamos los controles
                    txtNombre.Text = reader["nombre"].ToString();
                    txtPrecio.Text = reader["precio"].ToString();
                    ddlCategorias.SelectedValue = reader["categoria"].ToString();

                    // guardamos valores originales para detectar cambios
                    ViewState["nombre_orig"] = txtNombre.Text;
                    ViewState["precio_orig"] = txtPrecio.Text;
                    ViewState["cat_orig"] = ddlCategorias.SelectedValue;

                    lblMensaje.Text = ""; // limpiamos mensajes previos
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (ddlProductos.SelectedValue == "0")
            {
                lblMensaje.Text = "Seleccione un producto primero.";
                lblMensaje.CssClass = "mensaje-feedback advertencia";
                return;
            }

            // validacion
            bool huboCambio = (txtNombre.Text != ViewState["nombre_orig"].ToString()) ||
                              (txtPrecio.Text != ViewState["precio_orig"].ToString()) ||
                              (ddlCategorias.SelectedValue != ViewState["cat_orig"].ToString());

            if (!huboCambio)
            {
                lblMensaje.Text = "No se detectaron cambios. Modifique al menos un campo.";
                lblMensaje.CssClass = "mensaje-feedback advertencia";
                return;
            }

            try
            {
                // ejec actualización
                SqlDataSourceUpdate.Update();

                lblMensaje.Text = "¡Producto actualizado con éxito!";
                lblMensaje.CssClass = "mensaje-feedback exito";

                // actualizacion
                ddlProductos.DataBind();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al actualizar: " + ex.Message;
                lblMensaje.CssClass = "mensaje-feedback error";
            }
        }
    }
}