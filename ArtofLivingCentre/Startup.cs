using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ArtofLivingCentre.Startup))]
namespace ArtofLivingCentre
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
