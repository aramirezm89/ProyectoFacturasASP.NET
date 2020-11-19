namespace CapaEntidad
{
    public class Productos
    {
        private int codigo_producto;
        private string descripcion_producto;
        private string um;
        private double precio_unitario;


        public Productos()
        {

        }

        public Productos(int codigo_producto, string descripcion_producto, string um, double precio_unitario)
        {
            this.Codigo_producto = codigo_producto;
            this.Descripcion_producto = descripcion_producto;
            this.Um = um;
            this.Precio_unitario = precio_unitario;
        }

        public int Codigo_producto { get => codigo_producto; set => codigo_producto = value; }
        public string Descripcion_producto { get => descripcion_producto; set => descripcion_producto = value; }
        public string Um { get => um; set => um = value; }
        public double Precio_unitario { get => precio_unitario; set => precio_unitario = value; }
    }

       
}
