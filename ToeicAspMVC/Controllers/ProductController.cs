using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToeicAspMVC.Daos;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Controllers
{
    public class ProductController : Controller
    {
        ProductDao productDao = new ProductDao();
        UserDao userDao = new UserDao();
        // GET: Document
        public ActionResult Index(string msg)
        {
            ViewBag.Msg = msg;
            ViewBag.List = productDao.GetAll();
            return View();
        }

        public ActionResult UserProduct()
        {
            User user = (User)Session["User"];
            ViewBag.List = productDao.GetUserProduct(user.idUser);
            return View();
        }

        public ActionResult Detail(int id)
        {
            ViewBag.Detail = productDao.GetDetail(id);
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Add(UserProduct userProduct)
        {
            userProduct.status = 0;
            userProduct.created = DateTime.Now.ToString();
            productDao.AddUserProduct(userProduct);
            var product = productDao.GetDetail(userProduct.idProduct);
            User userCurrent = (User)Session["User"];
            userCurrent.point = userCurrent.point - product.point;
            if(userCurrent.point < 0)
            {
                return RedirectToAction("Index", new { msg = "2" });
            }
            else
            {
                userDao.Update(userCurrent);
                return RedirectToAction("Index", new { msg = "1" });
            }
        }
    }
}