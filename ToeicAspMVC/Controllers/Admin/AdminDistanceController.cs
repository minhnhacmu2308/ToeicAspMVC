using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToeicAspMVC.Daos;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Controllers.Admin
{
    public class AdminDistanceController : Controller
    {
        DistanceDao distanceDao = new DistanceDao();        
        public ActionResult Index(string msg)
        {
            ViewBag.Msg = msg;
            ViewBag.List = distanceDao.GetAll();
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Add(Distance distance)
        {
            distance.status = 1;
            distance.created = DateTime.Now.ToString();
            distanceDao.Add(distance);
            return RedirectToAction("Index", new { msg = "1" });
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Update(Distance distance)
        {
            distanceDao.Update(distance);
            return RedirectToAction("Index", new { msg = "1" });
        }

        public ActionResult Delete(Distance distance)
        {
            distanceDao.Delete(distance.idDistance);
            return RedirectToAction("Index", new { msg = "1" });
        }
    }
}