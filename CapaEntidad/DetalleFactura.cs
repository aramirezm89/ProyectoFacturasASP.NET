namespace CapaEntidad
{
    public class DetalleFactura
    {
        private EncabezadoFactura encabezadoFactura;
        private Productos productos;
        private int cantidad_producto;
        private int precio_unitario;
        private double monto_total;
        private double monto_neto;
        private double iva;


        public DetalleFactura()
        {

        }

        public EncabezadoFactura EncabezadoFactura { get => encabezadoFactura; set => encabezadoFactura = value; }
        public Productos Productos { get => productos; set => productos = value; }
        public int Cantidad_producto { get => cantidad_producto; set => cantidad_producto = value; }
        public double Monto_total { get => monto_total; set => monto_total = value; }
        public double Monto_neto { get => monto_neto; set => monto_neto = value; }
        public double Iva { get => iva; set => iva = value; }
        public int Precio_unitario { get => precio_unitario; set => precio_unitario = value; }
    }
}
