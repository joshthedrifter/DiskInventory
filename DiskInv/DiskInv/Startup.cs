using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DiskInv.Startup))]
namespace DiskInv
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
