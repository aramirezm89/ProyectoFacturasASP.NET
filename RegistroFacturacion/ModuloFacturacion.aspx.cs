using System;
using System.Net.Sockets;
using CapaEntidad;
using CapaNegocio;

namespace RegistroFacturacion
{
    public partial class ModuloFacturacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                NEGEmpresa negEmpresa = new NEGEmpresa();
       
                dpSelecEmpresa.DataTextField = "Nombre_empresa";
                dpSelecEmpresa.DataValueField = "Rut_empresa";
                dpSelecEmpresa.DataSource = negEmpresa.listarTodoasEmpresasNegocio();
                dpSelecEmpresa.DataBind();

                NEGClientes clientes = new NEGClientes();
                dpCliente.DataTextField = "Nombre";
                dpCliente.DataValueField = "Id_cliente";
                dpCliente.DataSource = clientes.listarTodosClientesNegocio();
                dpCliente.DataBind();


                NEGProductos negProductos = new NEGProductos();

                dpProducto.DataTextField = "Descripcion_producto";
                dpProducto.DataValueField = "Codigo_producto";
                dpProducto.DataSource = negProductos.BuscarProductos();
                dpProducto.DataBind();

                NEGEncabezadoFactura negEncabezado = new NEGEncabezadoFactura();
                dpNumeroFactura.DataTextField = "Numero_factura";
                dpNumeroFactura.DataValueField = "Numero_factura";
                dpNumeroFactura.DataSource = negEncabezado.ListarTodosEncabezados();
                dpNumeroFactura.DataBind();

            }
           


        }

        protected void btnEncabezado_Click(object sender, EventArgs e)
        {
            try
            {
                EncabezadoFactura encabezado = new EncabezadoFactura();

                encabezado.Numero_factura = int.Parse(txtNumeroFactura.Text);
                encabezado.Tipo_factura = txtTipofactura.Text;
                Empresa empresa = new Empresa();
                empresa.Rut_empresa = dpSelecEmpresa.SelectedValue;
                empresa.Nombre_empresa = dpSelecEmpresa.SelectedItem.Text;

                encabezado.Empresa = empresa;
                encabezado.Razon_social = txtRazonSocial.Text;
                Clientes cliente = new Clientes();
                cliente.Id_cliente = int.Parse(dpCliente.SelectedValue);
                cliente.Nombre = dpCliente.SelectedItem.Text;

                encabezado.Cliente = cliente;
                encabezado.Fecha = DateTime.Parse(txtFecha.Text);
                encabezado.Condicion_pago = txtCondicionPago.Text;
                encabezado.Estado = txtEstado.Text;

                NEGEncabezadoFactura negEncabezado = new NEGEncabezadoFactura();
                bool registro = negEncabezado.registroEncabezadoFactura(encabezado);




                if (registro)
                {
                    Response.Write("<script>alert('Encabezado factura registrado con exito.')</script>");
                    Session["contadorFacturasTotal"] = ((int)Session["contadorFacturasTotal"]) + 1;
                    Application["contadorFacturasGlobal"] = ((int)Application["contadorFacturasGlobal"]) + 1;
                    Response.Redirect("ModuloFacturacion.aspx");
                   
                }
                else
                {
                    Response.Write("<script>alert('No se pudo ingresar el encabezado, numero de factura ya existe o error de base de dato.')</script>");
                }

              
            }
            catch (Exception)
            {
                Response.Write("<script>alert('todos los campos son obligatorios o error en base de dato.')</script>");

            }
           
          
               

        }

        protected void btnRegistroDetalle_Click(object sender, EventArgs e)
        {
            DetalleFactura detalle = new DetalleFactura();

            EncabezadoFactura encabezado = new EncabezadoFactura();
            encabezado.Numero_factura = int.Parse(dpNumeroFactura.Text);
            detalle.EncabezadoFactura = encabezado;

            Productos producto = new Productos();
            producto.Codigo_producto = int.Parse(dpProducto.Text);
            detalle.Productos = producto;

            detalle.Cantidad_producto = int.Parse(txtCantidadProducto.Text);
            detalle.Precio_unitario = int.Parse(txtPrecio.Text);

            int precio = int.Parse(txtPrecio.Text);
            int cantidadProducto = int.Parse(txtCantidadProducto.Text);
            double montoTotal = precio * cantidadProducto;
            txtMontoTotal.Text = montoTotal.ToString();
            detalle.Monto_total = montoTotal;

            double montoNeto = montoTotal / 1.19;
            txtNeto.Text = montoNeto.ToString();
            detalle.Monto_neto = montoNeto;

            double iva = montoTotal - montoNeto;
            txtIva.Text = iva.ToString();
            detalle.Iva = iva;

          

            NEGDetalleFactura negDetalleFactura = new NEGDetalleFactura();
            bool registro = negDetalleFactura.registroDetalle(detalle);
            
            if (registro)
            {
                Response.Write("<script>alert('Detalle factura registrado con exito.')</script>");
                Application["contadorTotalNetoGlobal"] = ((int) Application["contadorTotalNetoGlobal"]) + Convert.ToInt32(montoNeto);
                Session["contadorMontoNetoSession"] = ((int)Session["contadorMontoNetoSession"]) + Convert.ToInt32(montoNeto);
            }
            else
            {
                Response.Write("<script>alert('No se pudo registrar el Detalle de Factura.')</script>");
            }

        }

        protected void btnEmitirFactura_Click(object sender, EventArgs e)
        {
            EncabezadoFactura encabezado = new EncabezadoFactura();

            encabezado.Numero_factura = int.Parse(txtEmitirFactura.Text);

            NEGEncabezadoFactura negEncabezado = new NEGEncabezadoFactura();
            bool update = negEncabezado.editarEmisionFactura(encabezado);

            if (update)
            {
                Response.Write("<script>alert('Factura Emitida, revisar estado en Modulo Consulta.')</script>");

            }
            else
            {
                Response.Write("<script>alert('No se puedo cambiar el estado de la factura.')</script>");
           
            }

        }

        protected void btnAnularFactura_Click(object sender, EventArgs e)
        {

            if (txtAnularFactura.Text == "")
            {
                Response.Write("<script> alert('Campo vacio')</script>");
            }
            else
            {

                EncabezadoFactura encabezado = new EncabezadoFactura();

                encabezado.Numero_factura = int.Parse(txtAnularFactura.Text);

                NEGEncabezadoFactura negEncabezado = new NEGEncabezadoFactura();
                bool update = negEncabezado.anularEstadoFactura(encabezado);

                if (update)
                {
                    Response.Write("<script>alert('Factura Anulada, revisar estado en Modulo Consulta.')</script>");

                }
                else
                {
                    Response.Write("<script>alert('No se puedo cambiar el estado de la factura por que se encuentra emitida.')</script>");

                }


            }
        }
    }
}