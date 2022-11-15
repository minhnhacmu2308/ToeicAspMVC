using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ToeicAspMVC
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
            name: "Teacher Document",
            url: "Document/List/{id}/{page}",
            defaults: new { controller = "Document", action = "ListDocument", id = UrlParameter.Optional }
           );
            routes.MapRoute(
            name: "Student Post",
            url: "Post/List/{id}/{page}",
            defaults: new { controller = "Post", action = "ListPost", id = UrlParameter.Optional }
           );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
