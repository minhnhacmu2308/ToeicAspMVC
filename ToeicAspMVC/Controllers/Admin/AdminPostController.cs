using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToeicAspMVC.Daos;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Controllers.Admin
{
    public class AdminPostController : Controller
    {
        PostDao postDao = new PostDao();
        // GET: AdminPost
        public ActionResult Index(string msg)
        {
            ViewBag.Msg = msg;
            ViewBag.List = postDao.GetAll();
            return View();
        }

        public ActionResult Approved(Post post)
        {
            postDao.Approved(post);
            return RedirectToAction("Index", new { msg = "1" });
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult Delete(Post post)
        {
            postDao.Delete(post.idPost);
            return RedirectToAction("Index", new { msg = "1" });
        }
    }
}