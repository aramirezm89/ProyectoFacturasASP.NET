namespace CapaEntidad
{
    public class Clientes
    {
        private int id_cliente;
        private string nombre;
        private string rut_cliente;
        private string giro;
        private string direccion;
        private string comuna;
        private string ciudad;
        private string telefono;
        private string email;


        public Clientes()
        {

        }
   

        public Clientes(int id_cliente, string nombre)
        {
            this.id_cliente = id_cliente;
            this.nombre = nombre;
        }

        public int Id_cliente { get => id_cliente; set => id_cliente = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Rut_cliente { get => rut_cliente; set => rut_cliente = value; }
        public string Giro { get => giro; set => giro = value; }
        public string Direccion { get => direccion; set => direccion = value; }
        public string Comuna { get => comuna; set => comuna = value; }
        public string Ciudad { get => ciudad; set => ciudad = value; }
        public string Telefono { get => telefono; set => telefono = value; }
        public string Email { get => email; set => email = value; }
    }
}
