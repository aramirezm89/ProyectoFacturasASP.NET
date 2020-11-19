using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidad;

namespace CapaPersistencia
{
   public class DAOClientes
    {
         public List<Clientes> listarTodasCLientes()
        {
            conexionBD conexion = new conexionBD();
            try
            {
                string query = "SELECT * FROM TBL_Clientes";
                conexion.abrirConexion();
                SqlDataAdapter adaptador = new SqlDataAdapter();
                adaptador= new SqlDataAdapter(query, conexion.Conexion);
                DataTable tabla = new DataTable();

                adaptador.Fill(tabla);

                conexion.cerrarConexion();

                if(tabla.Rows.Count > 0)
                {
                    List<Clientes> ListaCliente = new List<Clientes>();

                    for (int i = 0; i < tabla.Rows.Count; i++)
                    {
                        Clientes cliente = new Clientes();
                        cliente.Id_cliente =int.Parse(tabla.Rows[i]["id_cliente"].ToString());
                        cliente.Nombre = tabla.Rows[i]["nombre"].ToString();
                        cliente.Rut_cliente = tabla.Rows[i]["rut_cliente"].ToString();
                        cliente.Giro = tabla.Rows[i]["giro"].ToString();
                        cliente.Direccion = tabla.Rows[i]["direccion"].ToString();
                        cliente.Comuna = tabla.Rows[i]["comuna"].ToString();
                        cliente.Ciudad = tabla.Rows[i]["ciudad"].ToString();
                        cliente.Telefono = tabla.Rows[i]["telefono"].ToString();
                        cliente.Email = tabla.Rows[i]["email"].ToString();

                        ListaCliente.Add(cliente);
                    }
                    return ListaCliente;
                }
                else
                {
                    return new List<Clientes>();
                }


            }
            catch (Exception)
            {

                return new List<Clientes>();
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
    }
    
}
