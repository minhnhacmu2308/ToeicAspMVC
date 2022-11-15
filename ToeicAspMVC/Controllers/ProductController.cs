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
        // GET: Document
        public ActionResult Index()
        {
            ViewBag.List = productDao.GetAll();
            return View();
        }

        public ActionResult Detail(int id)
        {
            ViewBag.Detail = productDao.GetDetail(id);
            return View();
        }
    }
}