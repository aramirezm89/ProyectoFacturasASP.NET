using System;
using System.Configuration;
using System.Data.SqlClient;

namespace CapaPersistencia
{
    public class conexionBD
    {
        private string cadenaConexion = @"";
        private SqlConnection conexion = null;

        public conexionBD()
        {
            cadenaConexion = ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;
            conexion = new SqlConnection(cadenaConexion);
        }

        public SqlConnection Conexion { get => conexion; }

        public SqlConnection abrirConexion()
        {
            try
            {
                if (conexion.State == System.Data.ConnectionState.Closed)
                {
                    conexion.Open();
                    return conexion;
                }

            }
            catch (Exception)
            {

            }

            return conexion;
        }

        public SqlConnection cerrarConexion()
        {
            try
            {
                if (conexion.State == System.Data.ConnectionState.Open)
                {
                    conexion.Close();
                }
            }
            catch (Exception)
            {

            }

            return conexion;
        }
    }
}
