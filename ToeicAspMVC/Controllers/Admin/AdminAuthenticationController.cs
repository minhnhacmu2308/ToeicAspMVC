
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToeicAspMVC.Daos;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Controllers.Admin
{
    public class AdminAuthenticationController : Controller
    {
        UserDao userDao = new UserDao();
        // GET: AdminAuthentication
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection form)
        {
            User user = new User()
            {
                email = form["email"],
                password = form["password"]
            };
            bool checkLogin = userDao.checkLogin(user.email, user.password);
            if (checkLogin)
            {
                var userInformation = userDao.getUserByEmail(user.email);

                if (userInformation.idRole != 1)
                {
                    ViewBag.mess = "Bạn không có quyền truy cập vào trang quản trị";
                    return View("Login");
                }
                else
                {
                    Session.Add("ADMIN", userInformation);
                    return RedirectToAction("Index", "AdminHome");
                }

            }
            else
            {
                ViewBag.mess = "Thông tin tài khoản hoặc mật khẩu không chính xác";
                return View("Login");
            }

        }
        public ActionResult Logout()
        {
            Session.Remove("ADMIN");
            return Redirect("/AdminHome/Index");
        }
    }
}