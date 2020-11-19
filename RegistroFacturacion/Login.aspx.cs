using CapaEntidad;
using CapaNegocio;
using System;

namespace RegistroFacturacion
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //string user = "aramirezm";
            //string pass = "123";

            //if(txtUser.Text.Equals(user) && txtPass.Text.Equals(pass))
            //{
            //    Response.Redirect("Inicio.aspx");
            //}
            //else
            //{
            //    Response.Write("<script>alert('Su usuario o contraseñ no son validas') </script>");
            //}

            usuariosRegistrados usuario = new usuariosRegistrados();
            usuario.Usuario = txtUser.Text;
            usuario.Pass = txtPass.Text;

            NEGUsuario negUsuario = new NEGUsuario();

            bool registro = negUsuario.BuscarUsuarioregistrado(usuario);

            if (registro)
            {
                Response.Write("<script>alert('Bienvenido')</script>");
                Response.Redirect("Inicio.aspx");
            }
            else
            {
                Response.Write("<script>alert('uuario no existe')</script>");
            }
        }
    }
}