using CapaEntidad;
using CapaPersistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public  class NEGDetalleFactura
    {
        public bool registroDetalle(DetalleFactura detalle)
        {
            if (detalle == null)
            {
                return false;
            }
            else
            {
                DAODetalleFactura daoDetalleFactura = new DAODetalleFactura();
                return daoDetalleFactura.isertarDetalleFactura(detalle);
            }
        }
    }
}
