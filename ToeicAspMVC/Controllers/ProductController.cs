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
        public ActionResult Index()
        {
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
        public ActionResult Index(UserProduct userProduct)
        {
           
            var product = productDao.GetDetail(userProduct.idProduct);
            User userCurrent = (User)Session["User"];
            
            if(userCurrent.point < product.point)
            {
                ViewBag.Msg = "2";
                ViewBag.List = productDao.GetAll();
                return View("Index");

            }
            else
            {
                userCurrent.point = userCurrent.point - product.point;
                userProduct.status = 0;
                userProduct.created = DateTime.Now.ToString();
                productDao.AddUserProduct(userProduct);
                userDao.Update(userCurrent);
                ViewBag.Msg = "1";
                ViewBag.List = productDao.GetAll();
                return View("Index");
            }
        }
    }
}