using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidad;
using CapaPersistencia;

namespace CapaNegocio
{
   public class NEGEmpresa
    {
        public List<Empresa> listarTodoasEmpresasNegocio()
        {
            DAOEmpresa daoEmpressa = new DAOEmpresa();

            return daoEmpressa.listarTodasEmpresas();
        }
    }
}
