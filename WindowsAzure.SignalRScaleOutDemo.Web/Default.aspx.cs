using System;
using System.Web.UI;

using Microsoft.WindowsAzure.ServiceRuntime;

namespace WindowsAzure.SignalRScaleOutDemo.Web
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblCurrentInstance.Text = Environment.MachineName + " - " + RoleEnvironment.CurrentRoleInstance.Id;
        }
    }
}