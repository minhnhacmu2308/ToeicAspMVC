using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToeicAspMVC.Daos;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Controllers.Admin
{
    public class AdminCourseController : Controller
    {
        CourseDao courseDao = new CourseDao();
        // GET: AdminCourse
        public ActionResult Index(string msg)
        {
            ViewBag.Msg = msg;
            ViewBag.List = courseDao.GetAll();
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Add(Course course)
        {
            var file = Request.Files["file"];
            string reName = DateTime.Now.Ticks.ToString() + file.FileName;
            file.SaveAs(Server.MapPath("~/Content/images/" + reName));
            course.image = reName;
            course.status = 1;
            course.view = 0;
            course.created = DateTime.Now.ToString();
            courseDao.Add(course);
            return RedirectToAction("Index", new { msg = "1" });
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Update(Course course)
        {
            string reName = "";
            var objCourse = courseDao.GetDetail(course.idCourse);
            var file = Request.Files["file"];
            if (file.FileName == "")
            {
                reName = objCourse.image;
            }
            else
            {
                reName = DateTime.Now.Ticks.ToString() + file.FileName;
                file.SaveAs(Server.MapPath("~/Content/images/" + reName));
            }
            course.image = reName;
            courseDao.Update(course);
            return RedirectToAction("Index", new { msg = "1" });
        }

        public ActionResult Delete(Course course)
        {
            courseDao.Delete(course.idCourse);
            return RedirectToAction("Index", new { msg = "1" });
        }
    }
}