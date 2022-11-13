using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToeicAspMVC.Daos;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Controllers.Admin
{
    public class AdminProductController : Controller
    {
        ProductDao productDao = new ProductDao();
        public ActionResult Index(string msg)
        {
            ViewBag.Msg = msg;
            ViewBag.List = productDao.GetAll();
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Add(Product product)
        {
            var file = Request.Files["file"];
            string reName = DateTime.Now.Ticks.ToString() + file.FileName;
            file.SaveAs(Server.MapPath("~/Content/images/" + reName));
            product.image = reName;
            product.status = 1;
            product.created = DateTime.Now.ToString();
            productDao.Add(product);
            return RedirectToAction("Index", new { msg = "1" });
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Update(Product product)
        {
            string reName = "";
            var objCourse = productDao.GetDetail(product.idProduct);
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
            product.image = reName;
            productDao.Update(product);
            return RedirectToAction("Index", new { msg = "1" });
        }

        public ActionResult Delete(Product product)
        {
            productDao.Delete(product.idProduct);
            return RedirectToAction("Index", new { msg = "1" });
        }
    }
}