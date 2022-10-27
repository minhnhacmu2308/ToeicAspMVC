using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToeicAspMVC.Daos;

namespace ToeicAspMVC.Controllers
{
    public class HomeController : Controller
    {
        CourseDao courseDao = new CourseDao();
        public ActionResult Index()
        {
            ViewBag.ListTopSix = courseDao.GetCoursesOrderByDescending(6);
            ViewBag.Course = courseDao.GetCourses(4);
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}