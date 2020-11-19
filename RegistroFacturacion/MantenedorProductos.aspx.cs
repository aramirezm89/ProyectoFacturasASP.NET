using System;
using System.Web.UI.WebControls;
using CapaNegocio;
using CapaEntidad;

namespace RegistroFacturacion
{
    public partial class MantenedorProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NEGProductos productos = new NEGProductos();
                GridView1.DataSource = productos.BuscarProductos();
                GridView1.DataBind();

            }

        }

        protected void btnProducto_Click(object sender, EventArgs e)
        {

            try
            {

                Productos producto = new Productos();

                producto.Codigo_producto = int.Parse(txtCodProducto.Text);
                producto.Descripcion_producto = txtDescripcion.Text;
                producto.Um = txtUM.Text;
                producto.Precio_unitario = double.Parse(txtPrecio.Text);

                NEGProductos negProducto = new NEGProductos();

                bool registro = negProducto.registroProductoNegocio(producto);

                if (registro)
                {
                    Response.Redirect("MantenedorProductos.aspx");

                }

            }
            catch (Exception)
            {

                Response.Write("<script>alert('Todos los campos son obligatorios')</script>");
            }
            
               

            





        }
    }
}