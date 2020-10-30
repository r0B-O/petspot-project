using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PETSPOT.Startup))]
namespace PETSPOT
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
