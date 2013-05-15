using System;
using System.Web;
using System.Web.Routing;

using Microsoft.WindowsAzure;
using Microsoft.AspNet.SignalR;

namespace WindowsAzure.SignalRScaleOutDemo.Web
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            GlobalHost.DependencyResolver.UseServiceBus(
                CloudConfigurationManager.GetSetting("ServiceBusConnectionString"), "MyChatApplication");  
            RouteTable.Routes.MapHubs();
        }
    }
}
