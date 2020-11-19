using System;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;

namespace RegistroFacturacion
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Código que se ejecuta al iniciar la aplicación
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            Application["contadorFacturasGlobal"] = 0;
            Application["contadorTotalNetoGlobal"] = 0;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
           
            Session["contadorFacturasTotal"] = 0;
            Session["contadorMontoNetoSession"] = 0;
        }
    }
}