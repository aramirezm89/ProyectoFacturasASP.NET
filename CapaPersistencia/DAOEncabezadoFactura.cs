using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
using System.Threading.Tasks;

namespace CapaPersistencia
{
    public class DAOEncabezadoFactura
    {
        public bool insertarEncabezadoFactura(EncabezadoFactura encabezado)
        {
          
            conexionBD conexion = new conexionBD();
            try
            {
                SqlConnection cnn = conexion.abrirConexion();
                SqlCommand cmd = cnn.CreateCommand();
                cmd.CommandText = "SP_InsertEncabezado";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@in_numero_factura", encabezado.Numero_factura);
                cmd.Parameters.AddWithValue("@in_tipo_factura", encabezado.Tipo_factura);
                cmd.Parameters.AddWithValue("@in_rut_empresa", encabezado.Empresa.Rut_empresa);
                cmd.Parameters.AddWithValue("@in_razon_social", encabezado.Razon_social);
                cmd.Parameters.AddWithValue("@in_id_cliente", encabezado.Cliente.Id_cliente);
                cmd.Parameters.AddWithValue("@in_fecha", encabezado.Fecha);
                cmd.Parameters.AddWithValue("@in_condicion_pago", encabezado.Condicion_pago);
                cmd.Parameters.AddWithValue("@in_estado", encabezado.Estado);

                int ejecucion = cmd.ExecuteNonQuery();

                conexion.cerrarConexion();

                if (ejecucion >0)
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

        public List<EncabezadoFactura> listarTodosEncabezados()
        {
            conexionBD conexion = new conexionBD();
            try
            {
                string query = "SELECT * FROM TBL_EncabezadoFactura";
                conexion.abrirConexion();
                SqlDataAdapter adaptador = new SqlDataAdapter();
                adaptador = new SqlDataAdapter(query, conexion.Conexion);
                DataTable tabla = new DataTable();

                adaptador.Fill(tabla);

                conexion.cerrarConexion();

                if (tabla.Rows.Count > 0)
                {
                    List<EncabezadoFactura> ListaEncabezados = new List<EncabezadoFactura>();

                    for (int i = 0; i < tabla.Rows.Count; i++)
                    {
                        EncabezadoFactura encabezado = new EncabezadoFactura();
                        encabezado.Numero_factura = int.Parse( tabla.Rows[i]["numero_factura"].ToString());
                        encabezado.Tipo_factura = tabla.Rows[i]["tipo_factura"].ToString();
                      
                        encabezado.Razon_social = tabla.Rows[i]["razon_social"].ToString();
                      
                        encabezado.Fecha = DateTime.Parse(tabla.Rows[i]["fecha"].ToString());
                        encabezado.Condicion_pago = tabla.Rows[i]["condicion_pago"].ToString();
                        encabezado.Estado = tabla.Rows[i]["estado"].ToString();


                        ListaEncabezados.Add(encabezado);
                    }
                    return ListaEncabezados;
                }
                else
                {
                    return new List<EncabezadoFactura>();
                }


            }
            catch (Exception)
            {

                return new List<EncabezadoFactura>();
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }


        public bool emitirFactura(int numeroFactura)
        {
            conexionBD conexion = new conexionBD();
            try
            {
                conexion.abrirConexion();
                string query = "UPDATE TBL_EncabezadoFactura SET estado = 'emitida' where numero_factura = " + numeroFactura.ToString();
                SqlCommand cmd = new SqlCommand(query, conexion.Conexion);

                int ejecucion = cmd.ExecuteNonQuery();

                conexion.cerrarConexion();

                if (ejecucion >0)
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

        public bool anularFactura(int numeroFactura)
        {
            conexionBD conexion = new conexionBD();
            try
            {

                SqlConnection cnn = conexion.abrirConexion();
                SqlCommand cmdSelect = cnn.CreateCommand();
                cmdSelect.CommandText = "sp_buscaNumeroFactura";
                cmdSelect.CommandType = CommandType.StoredProcedure;
                cmdSelect.Parameters.AddWithValue("@in_numero_factura", numeroFactura);
                SqlDataReader lector = cmdSelect.ExecuteReader();
               


                if ((lector.Read() ==true && lector["estado"].Equals("emitida")))
                {
                    
                    return false;

                }
                else if (lector["estado"].Equals("no_emitida"))
                {
                    lector.Close();
                    string query = "UPDATE TBL_EncabezadoFactura SET estado = 'anulada' where numero_factura = " + numeroFactura.ToString();
                    SqlCommand cmd = new SqlCommand(query, conexion.Conexion);
                    cmd.ExecuteNonQuery();
                    return true;

                }
                else
                {
                    return false;
                }
               
            }
            catch (Exception)
            {

                throw;

            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
    }
}
