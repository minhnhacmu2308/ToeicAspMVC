using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToeicAspMVC.Daos;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Controllers.Admin
{
    public class AdminUserController : Controller
    {
        UserDao userDao = new UserDao();
        public ActionResult Index(string msg)
        {
            ViewBag.Msg = msg;
            ViewBag.List = userDao.GetAll();
            ViewBag.Role = userDao.GetRole();
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Add(User user)
        {
            bool checkEmail = userDao.checkEmailExist(user.email);
            if (checkEmail)
            {
                return RedirectToAction("Index", new { msg = "3" });
            }
            else
            {
                user.point = 0;
                user.status = 1;
                user.isTest = false;
                user.created = DateTime.Now.ToString();
                userDao.Add(user);
                return RedirectToAction("Index", new { msg = "1" });
            }
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Update(User user)
        {
            userDao.UpdateAdmin(user);
            return RedirectToAction("Index", new { msg = "1" });
        }

        public ActionResult Delete(User user)
        {
            var documents = userDao.GetDocumentByUser(user.idUser);
            var posts = userDao.GetPostByUser(user.idUser);
            var comments = userDao.GetCommentByUser(user.idUser);
            var targets = userDao.GetMyTargetByUser(user.idUser);
            if (documents.Count > 0 || posts.Count > 0 || comments.Count > 0 || targets.Count > 0)
            {
                return RedirectToAction("Index", new { msg = "2" });
            }
            else
            {
                userDao.Delete(user.idUser);
                return RedirectToAction("Index", new { msg = "1" });
            }
        }
    }
}