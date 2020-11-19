using CapaEntidad;
using CapaPersistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class NEGEncabezadoFactura
    {

        public bool registroEncabezadoFactura(EncabezadoFactura encabezado)
        {
            if (encabezado == null)
            {
                return false;
            }
            else
            {
                DAOEncabezadoFactura dAOEncabezado = new DAOEncabezadoFactura();
                return dAOEncabezado.insertarEncabezadoFactura(encabezado);
            }
        }

        public List<EncabezadoFactura> ListarTodosEncabezados(){

            DAOEncabezadoFactura encabezados = new DAOEncabezadoFactura();
            return encabezados.listarTodosEncabezados();
         }

        public bool editarEmisionFactura(EncabezadoFactura encabezado)
        {
            if (encabezado == null)
            {
                return false;
            }
            else
            {
                DAOEncabezadoFactura daoEncabezado = new DAOEncabezadoFactura();
                return daoEncabezado.emitirFactura(encabezado.Numero_factura);
            }
        }

        public bool anularEstadoFactura(EncabezadoFactura encabezado)
        {
            if(encabezado == null)
            {
                return false;
            }
            else
            {
                DAOEncabezadoFactura daoEncabezado = new DAOEncabezadoFactura();
                return daoEncabezado.anularFactura(encabezado.Numero_factura);
            }
        }

    }
}
