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
    public class DAOEmpresa
    {
        public List<Empresa> listarTodasEmpresas()
        {
            conexionBD conexion = new conexionBD();
            try
            {
                string query = "SELECT * FROM TBL_Empresas";
                conexion.abrirConexion();
                SqlDataAdapter adaptador = new SqlDataAdapter();
                adaptador= new SqlDataAdapter(query, conexion.Conexion);
                DataTable tabla = new DataTable();

                adaptador.Fill(tabla);

                conexion.cerrarConexion();

                if(tabla.Rows.Count > 0)
                {
                    List<Empresa> ListaEmpresa = new List<Empresa>();

                    for (int i = 0; i < tabla.Rows.Count; i++)
                    {
                        Empresa empresa = new Empresa();
                        empresa.Rut_empresa = tabla.Rows[i]["rut_empresa"].ToString();
                        empresa.Nombre_empresa = tabla.Rows[i]["nombre_empresa"].ToString();

                        ListaEmpresa.Add(empresa);
                    }
                    return ListaEmpresa;
                }
                else
                {
                    return new List<Empresa>();
                }


            }
            catch (Exception)
            {

                return new List<Empresa>();
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
    }
}
