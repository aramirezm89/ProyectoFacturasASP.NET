using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidad;
using CapaPersistencia;

namespace CapaNegocio
{
   public class NEGClientes
    {
        public List<Clientes> listarTodosClientesNegocio()
        {
            DAOClientes daoEmpressa = new DAOClientes();

            return daoEmpressa.listarTodasCLientes();
        }
    }
}
