using CapaEntidad;
using CapaPersistencia;

namespace CapaNegocio
{
    public class NEGUsuario
    {
        public bool BuscarUsuarioregistrado(usuariosRegistrados usuario)
        {
            if (usuario == null)
            {
                return false;
            }
            else
            {
                DAOUsuarioRegistrado daoUsuario = new DAOUsuarioRegistrado();

                return daoUsuario.BuscarUsuarioRegistrado(usuario);
            }

        }
    }
}
