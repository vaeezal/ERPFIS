using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebERPFIS.Startup))]
namespace WebERPFIS
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            app.MapSignalR();
        }
    }
}
