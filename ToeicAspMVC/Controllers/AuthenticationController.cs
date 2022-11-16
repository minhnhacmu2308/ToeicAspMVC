using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToeicAspMVC.Daos;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Controllers
{
    public class AuthenticationController : Controller
    {
        UserDao userDao = new UserDao();

        // GET: Authentication
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }
        public ActionResult Register()
        {
            return View();
        }

        public ActionResult TestExam()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(User user,FormCollection form)
        {
            var rePassword = form["rePassword"];
            int status = 1;
            if (string.IsNullOrEmpty(user.email) || string.IsNullOrEmpty(user.password) || string.IsNullOrEmpty(rePassword) || string.IsNullOrEmpty(user.fullName))
            {
                ViewBag.message = "Cần điền đầy đủ thông tin";
                return View();
            }
            else if (user.password != rePassword)
            {
                ViewBag.message = "Hai mật khẩu không trùng khớp";
                return View();
            }
            else
            {
                bool checkEmail = userDao.checkEmailExist(user.email);
                if (checkEmail)
                {
                    ViewBag.message = "Email đã tồn tại";
                    return View();
                }
                else
                {
                    string passwordMd5 = user.password;
                    User userObj = new User();
                    userObj.email = user.email;
                    userObj.password = passwordMd5;
                    userObj.fullName = user.fullName;
                    userObj.phoneNumber = user.phoneNumber;
                    userObj.status = status;
                    userObj.idRole = 3;
                    userDao.Add(userObj);
                    return RedirectToAction("Login");
                }
            }

        }
        [HttpPost]
        public ActionResult Login(FormCollection form)
        {
            var email = form["email"];
            var password = form["password"];
            string passwordMd5 = password;
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                ViewBag.message = "Cần điền đầy đủ thông tin";
                return View();
            }
            else
            {
                bool checkLogin = userDao.checkLogin(email, passwordMd5);
                if (checkLogin)
                {
                    var userInformation = userDao.getUserByEmail(email);
                    Session.Add("User", userInformation);
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ViewBag.message = "Tài khoản hoặc mật khẩu không chính xác";
                    return View();
                }
            }

        }
        public ActionResult Logout()
        {
            Session.Remove("User");
            return Redirect("/");
        }

    }
}