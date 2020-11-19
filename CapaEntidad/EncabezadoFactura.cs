using System;

namespace CapaEntidad
{
    public class EncabezadoFactura
    {
        private int numero_factura;
        private string tipo_factura;
        private Empresa empresa;
        private string razon_social;
        private Clientes cliente;
        private DateTime fecha;
        private string condicion_pago;
        private string estado;


        public EncabezadoFactura()
        {

        }

       
        public int Numero_factura { get => numero_factura; set => numero_factura = value; }
        public string Tipo_factura { get => tipo_factura; set => tipo_factura = value; }
        public Empresa Empresa { get => empresa; set => empresa = value; }
        public string Razon_social { get => razon_social; set => razon_social = value; }
        public Clientes Cliente { get => cliente; set => cliente = value; }
        public DateTime Fecha { get => fecha; set => fecha = value; }
        public string Condicion_pago { get => condicion_pago; set => condicion_pago = value; }
        public string Estado { get => estado; set => estado = value; }
    }
}
