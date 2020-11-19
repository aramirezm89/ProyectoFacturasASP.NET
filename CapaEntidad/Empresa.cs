namespace CapaEntidad
{
    public class Empresa
    {
        private string rut_empresa;
        private string nombre_empresa;

        public Empresa()
        {

        }
        public Empresa(string rut_empresa, string nombre_empresa)
        {
            this.rut_empresa = rut_empresa;
            this.nombre_empresa = nombre_empresa;
        }


        public string Rut_empresa { get => rut_empresa; set => rut_empresa = value; }
        public string Nombre_empresa { get => nombre_empresa; set => nombre_empresa = value; }
    }
}
