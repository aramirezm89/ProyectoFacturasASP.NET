using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;
using CapaPersistencia;

namespace RegistroFacturacion
{
    public partial class ModuloConsulta : System.Web.UI.Page
    {
        DataTable tabla;
        DataTable TablaTotales;
        protected void Page_Load(object sender, EventArgs e)
        {
            conexionBD conexion = new conexionBD();
            try
            {
                string query = "select * from view_FacturaCompleta";
                conexion.abrirConexion();
                SqlDataAdapter adaptador = new SqlDataAdapter(query, conexion.Conexion);
                 tabla = new DataTable();

                tabla.Columns.Add("Numero_Factura");
                tabla.Columns.Add("Tipo_Factura");
                tabla.Columns.Add("Rut_Empresa");
                tabla.Columns.Add("Razon_Social");
                tabla.Columns.Add("Id_Cliente");
                tabla.Columns.Add("Nombre");
                tabla.Columns.Add("Rut_Cliente");
                tabla.Columns.Add("Giro");
                tabla.Columns.Add("Direccion");
                tabla.Columns.Add("Comuna");
                tabla.Columns.Add("ciudad");
                tabla.Columns.Add("Telefono");
                tabla.Columns.Add("Email");
                tabla.Columns.Add("Fecha");
                tabla.Columns.Add("Condicion_Pago");
                tabla.Columns.Add("Estado");
                tabla.Columns.Add("Codigo_Producto");
                tabla.Columns.Add("Descripcion_Producto");
                tabla.Columns.Add("Cantidad_Producto");
                tabla.Columns.Add("Monto_Total",typeof(double));
                tabla.Columns.Add("Monto_Neto", typeof(double));
                tabla.Columns.Add("Iva", typeof(double));

                adaptador.Fill(tabla);

                conexion.cerrarConexion();

                GridView1.DataSource = tabla;
                GridView1.DataBind();



            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
       

        protected void btnFiltroNumFactura_Click(object sender, EventArgs e)
        {
            conexionBD conexion = new conexionBD();
            string query = "select * from view_FacturaCompleta where numero_factura LIKE '%"+txtFiltroNumFactura.Text+"%'";
            conexion.abrirConexion();
            SqlDataAdapter adaptador = new SqlDataAdapter(query, conexion.Conexion);
            tabla = new DataTable();

            tabla.Columns.Add("Numero_Factura");
            tabla.Columns.Add("Tipo_Factura");
            tabla.Columns.Add("Rut_Empresa");
            tabla.Columns.Add("Razon_Social");
            tabla.Columns.Add("Id_Cliente");
            tabla.Columns.Add("Nombre");
            tabla.Columns.Add("Rut_Cliente");
            tabla.Columns.Add("Giro");
            tabla.Columns.Add("Direccion");
            tabla.Columns.Add("Comuna");
            tabla.Columns.Add("ciudad");
            tabla.Columns.Add("Telefono");
            tabla.Columns.Add("Email");
            tabla.Columns.Add("Fecha");
            tabla.Columns.Add("Condicion_Pago");
            tabla.Columns.Add("Estado");
            tabla.Columns.Add("Codigo_Producto");
            tabla.Columns.Add("Descripcion_Producto");
            tabla.Columns.Add("Cantidad_Producto");
            tabla.Columns.Add("Monto_Total", typeof(double));
            tabla.Columns.Add("Monto_Neto", typeof(double));
            tabla.Columns.Add("Iva", typeof(double));

            adaptador.Fill(tabla);

            conexion.cerrarConexion();

            GridView1.DataSource = tabla;
            GridView1.DataBind();

         


        }

        protected void btnFiltroFecha_Click(object sender, EventArgs e)
        {
            conexionBD conexion = new conexionBD();
            string query = "select * from view_FacturaCompleta where fecha  between '" + txtFechaEntrada.Text + "'and'" + txtFechaFin.Text + "'";
            conexion.abrirConexion();
            SqlDataAdapter adaptador = new SqlDataAdapter(query, conexion.Conexion);
            tabla = new DataTable();

            tabla.Columns.Add("Numero_Factura");
            tabla.Columns.Add("Tipo_Factura");
            tabla.Columns.Add("Rut_Empresa");
            tabla.Columns.Add("Razon_Social");
            tabla.Columns.Add("Id_Cliente");
            tabla.Columns.Add("Nombre");
            tabla.Columns.Add("Rut_Cliente");
            tabla.Columns.Add("Giro");
            tabla.Columns.Add("Direccion");
            tabla.Columns.Add("Comuna");
            tabla.Columns.Add("ciudad");
            tabla.Columns.Add("Telefono");
            tabla.Columns.Add("Email");
            tabla.Columns.Add("Fecha");
            tabla.Columns.Add("Condicion_Pago");
            tabla.Columns.Add("Estado");
            tabla.Columns.Add("Codigo_Producto");
            tabla.Columns.Add("Descripcion_Producto");
            tabla.Columns.Add("Cantidad_Producto");
            tabla.Columns.Add("Monto_Total", typeof(double));
            tabla.Columns.Add("Monto_Neto", typeof(double));
            tabla.Columns.Add("Iva", typeof(double));

            adaptador.Fill(tabla);

            conexion.cerrarConexion();

            GridView1.DataSource = tabla;
         
            GridView1.DataBind();
          

          
            string query2 = "exec SP_SumaTotalMontoPorFecha '"+txtFechaEntrada.Text+"','"+txtFechaFin.Text+"'";
            conexion.abrirConexion();
            SqlDataAdapter adaptador2 = new SqlDataAdapter(query2, conexion.Conexion);
            TablaTotales = new DataTable();
            TablaTotales.Columns.Add("numero_factura");
            TablaTotales.Columns.Add("Monto_Total_Periodo");
            adaptador2.Fill(TablaTotales);
            conexion.cerrarConexion();
            gvTotales.DataSource = TablaTotales;
            gvTotales.DataBind();
        }
    }
}