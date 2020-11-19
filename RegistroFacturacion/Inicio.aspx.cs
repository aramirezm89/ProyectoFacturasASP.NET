using System;

namespace RegistroFacturacion
{
    public partial class inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtFacturaSession.Text = Session["contadorFacturasTotal"].ToString(); ;
            txtFacturasGlobal.Text = Application["contadorFacturasGlobal"].ToString();
            txtMontoNetoGLobal.Text = Application["contadorTotalNetoGlobal"].ToString();
            txtMontoNetoSession.Text = Session["contadorMontoNetoSession"].ToString();
        }
    }
}