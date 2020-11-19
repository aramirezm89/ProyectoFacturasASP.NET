using CapaEntidad;
using System;
using System.Data;
using System.Data.SqlClient;

namespace CapaPersistencia
{
    public class DAOUsuarioRegistrado
    {
        public bool BuscarUsuarioRegistrado(usuariosRegistrados user)
        {
            conexionBD conexion = new conexionBD();
            try
            {

                SqlConnection cnn = conexion.abrirConexion();
                SqlCommand cmd = cnn.CreateCommand();
                cmd.CommandText = "SP_BuscarUsuariosRegistrados";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@in_usuario", user.Usuario);
                cmd.Parameters.AddWithValue("@in_paass", user.Pass);
                SqlDataReader LeerDatos = cmd.ExecuteReader();

                if (LeerDatos.Read() == true)
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
