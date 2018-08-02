using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FlutterwaveTechnical.Startup))]
namespace FlutterwaveTechnical
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
