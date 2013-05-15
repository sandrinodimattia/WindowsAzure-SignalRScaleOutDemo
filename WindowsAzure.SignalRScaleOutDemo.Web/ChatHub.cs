using System;

using Microsoft.AspNet.SignalR;
using Microsoft.WindowsAzure.ServiceRuntime;

namespace WindowsAzure.SignalRScaleOutDemo.Web
{
    public class ChatHub : Hub
    {
        public void Send(string name, string message)
        {
            Clients.All.broadcastMessage(name, message, Environment.MachineName, RoleEnvironment.CurrentRoleInstance.Id);
        }
    }
}