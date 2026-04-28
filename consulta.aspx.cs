using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial_1
{
    public partial class consulta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.SqlDataSource2.DataSourceMode = SqlDataSourceMode.DataReader;

            SqlDataReader dato = (SqlDataReader)this.SqlDataSource2.Select(DataSourceSelectArguments.Empty);

            if (dato.Read())
            {
                // mostramos los datos del producto
                this.Label1.Text = "Producto: " + dato["nombre"].ToString() + " | Precio: $" + dato["precio"].ToString() + " | Categoría: " + dato["nombreCategoria"].ToString();
                // mensaje exito
                this.Label1.CssClass = "mensaje-feedback exito";
            }
            else
            {
                // mensaje error
                this.Label1.Text = "No se encontró el producto.";
                this.Label1.CssClass = "mensaje-feedback error";
            }

            dato.Close();
        }
    }
}