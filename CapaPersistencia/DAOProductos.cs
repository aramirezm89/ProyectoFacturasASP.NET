using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
using System.Threading.Tasks;
using CapaEntidad;
using Microsoft.Win32;

namespace CapaPersistencia
{
    public class DAOProductos
    {
        public bool insertaProducto(Productos producto)
        {
            conexionBD conexion = new conexionBD();

            try
            {
                SqlConnection cnn = conexion.abrirConexion();
                SqlCommand cmd = cnn.CreateCommand();
                cmd.CommandText = "SP_InsertProductos";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@in_codigo_producto", producto.Codigo_producto);
                cmd.Parameters.AddWithValue("@in_descripcion_producto", producto.Descripcion_producto);
                cmd.Parameters.AddWithValue("@in_UM", producto.Um);
                cmd.Parameters.AddWithValue("@in_precio_unitario", producto.Precio_unitario);
               
                int ejecucion =  cmd.ExecuteNonQuery();

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




        public List <Productos> listarTodosproductos()
        {
            conexionBD conexion = new conexionBD();

            try
            {
                string query = "select * from TBL_Productos";
                conexion.abrirConexion();
                SqlDataAdapter adaptadorSql = new SqlDataAdapter(query,conexion.Conexion);
                DataTable tabla = new DataTable();
                adaptadorSql.Fill(tabla);
                conexion.cerrarConexion();
                if(tabla.Rows.Count > 0)
                {
                    List<Productos> listaProductos = new List<Productos>();

                    for (int i = 0; i < tabla.Rows.Count ; i++)
                    {
                        Productos productos = new Productos();

                        productos.Codigo_producto = int.Parse(tabla.Rows[i]["codigo_producto"].ToString());
                        productos.Descripcion_producto = tabla.Rows[i]["descripcion_producto"].ToString();
                        productos.Um = tabla.Rows[i]["UM"].ToString();
                        productos.Precio_unitario = Double.Parse(tabla.Rows[i]["precio_unitario"].ToString());
                        listaProductos.Add(productos);
                    }

                    return listaProductos;
                }
                else
                {
                    return new List<Productos>();
                }
                
            }
            catch (Exception)
            {

                return new List<Productos>();
            }
            finally
            {
                conexion.cerrarConexion();
            }
                
        }


        public Productos ListarProducto(int codigo_producto)
        {
            conexionBD conexion = new conexionBD();

            try
            {
                string query = "SELECT * FROM TBL_Productos WHERE codigo_producto =" + codigo_producto;
                conexion.abrirConexion();
                SqlDataAdapter adaptadorSql = new SqlDataAdapter(query, conexion.Conexion);
                DataTable tabla = new DataTable();
                adaptadorSql.Fill(tabla);
                conexion.cerrarConexion();

                if (tabla.Rows.Count > 0)
                {
                    Productos producto = new Productos();

                    producto.Codigo_producto = int.Parse(tabla.Rows[0]["codigo_producto"].ToString());
                    producto.Descripcion_producto = tabla.Rows[0]["descripcion_producto"].ToString();
                    producto.Um = tabla.Rows[0]["UM"].ToString();
                    producto.Precio_unitario = double.Parse(tabla.Rows[0]["precio_unitario"].ToString());
                    return producto;
                }
                else
                {
                    return new Productos();
                }


      
            }
            catch (Exception)
            {

                return new Productos();
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
    }
}
