using CapaEntidad;
using CapaPersistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
   public  class NEGProductos
    {
        public bool registroProductoNegocio(Productos producto)
        {
            if(producto == null)
            {
                return false;
            }
            else
            {
                DAOProductos daoProducto = new DAOProductos();
                return  daoProducto.insertaProducto(producto);
            }
        }


        public List<Productos> BuscarProductos()
        {
            DAOProductos productos = new DAOProductos();
            return productos.listarTodosproductos();

        }
    }
}
