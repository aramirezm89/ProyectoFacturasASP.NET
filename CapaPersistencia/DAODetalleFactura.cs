using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaPersistencia
{
    public class DAODetalleFactura
    {
        public bool isertarDetalleFactura(DetalleFactura detalle)
        {
            conexionBD conexion = new conexionBD();
            try
            {
                SqlConnection cnn = conexion.abrirConexion();
                SqlCommand cmd = cnn.CreateCommand();
                cmd.CommandText = "SP_InsertDetalle";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@in_numero_factura", detalle.EncabezadoFactura.Numero_factura);
                cmd.Parameters.AddWithValue("@in_codigo_producto", detalle.Productos.Codigo_producto);
                cmd.Parameters.AddWithValue("@in_cantidad_producto", detalle.Cantidad_producto);
                cmd.Parameters.AddWithValue("@in_precio_unitario", detalle.Precio_unitario);
                cmd.Parameters.AddWithValue("@in_monto_total", detalle.Monto_total);
                cmd.Parameters.AddWithValue("@in_monto_neto", detalle.Monto_neto);
                cmd.Parameters.AddWithValue("@in_iva", detalle.Iva);

                int ejecucion = cmd.ExecuteNonQuery();

                conexion.cerrarConexion();

                if (ejecucion > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
               

            }
            catch (Exception)
            {

                return false;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
    }
}
