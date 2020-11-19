namespace CapaEntidad
{
    public class usuariosRegistrados
    {
        private string usuario;
        private string pass;
        private string nombre;
        private string apellido;


        public usuariosRegistrados()
        {

        }

        public usuariosRegistrados(string usuario, string pass, string nombre, string apellido)
        {
            this.usuario = usuario;
            this.pass = pass;
            this.nombre = nombre;
            this.apellido = apellido;
        }


        public string Usuario { get => usuario; set => usuario = value; }
        public string Pass { get => pass; set => pass = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Apellido { get => apellido; set => apellido = value; }
    }
}
