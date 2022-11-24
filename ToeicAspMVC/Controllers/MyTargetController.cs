using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToeicAspMVC.Daos;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Controllers
{
    public class MyTargetController : Controller
    {
        MyTargetDao myTargetDao = new MyTargetDao();
        TargetDao targetDao = new TargetDao();
        // GET: MyTarget
        public ActionResult Index(string mess)
        {
            DateTime aDateTime = DateTime.Now;
            ViewBag.CurrentDate = aDateTime.Year + "-" + aDateTime.Month + "-" + aDateTime.Day;
            ViewBag.Msg = mess;
            var user = (User)Session["User"];
            ViewBag.List = myTargetDao.GetByUser(user.idUser);
            ViewBag.Target = targetDao.GetAll();
            return View();
        }

        public ActionResult ApproveTarget(string mess)
        {
            ViewBag.Msg = mess;
            ViewBag.List = myTargetDao.GetTargetOption();
            return View();
        }

        public ActionResult Approved(FormCollection form)
        {
            var id = Int32.Parse(form["idMyTarget"]);
            myTargetDao.Approved(id);
            return RedirectToAction("ApproveTarget", new { mess = "1" });
        }

        public ActionResult Complete(FormCollection form)
        {
            var id = Int32.Parse(form["idMyTarget"]);
            myTargetDao.Approved(id);
            return RedirectToAction("Index", new { mess = "1" });
        }

        [HttpGet]
        public ActionResult Add(string mess)
        {
            ViewBag.Msg = mess;
            return View();
        }

        [HttpGet]
        public ActionResult AddOption(string mess)
        {
            ViewBag.Msg = mess;
            return View();
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult Add(MyTarget myTarget)
        {
            myTarget.created = DateTime.Now.ToString();
            myTarget.status = 0;
            myTarget.idTarget = 1;
            myTargetDao.Add(myTarget);
            return RedirectToAction("Index", new { mess = "1" });
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult AddOption(MyTarget myTarget)
        {
            myTarget.created = DateTime.Now.ToString();
            myTarget.status = 0;
            myTarget.name = "Mục tiêu";
            myTargetDao.Add(myTarget);
            return RedirectToAction("Index", new { mess = "1" });
        }
    }
}