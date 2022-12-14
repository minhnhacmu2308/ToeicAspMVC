using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToeicAspMVC.Daos;
using ToeicAspMVC.Models;
using ToeicAspMVC.Requests;

namespace ToeicAspMVC.Controllers
{
    public class AuthenticationController : Controller
    {
        UserDao userDao = new UserDao();
        DistanceDao distanceDao = new DistanceDao();
        string[] answers = { "A", "B", "B", "A", "C", "B", "A", "C", "B", "B", "A", "B", "C", "D", "A", "B", "A", "C", "B", "A"};
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

        public ActionResult RecommendDistance()
        {
            User user = (User)Session["User"];
            var point = user.point;
            ViewBag.Distance = distanceDao.Recommend(point);
            ViewBag.point = point.ToString();
            return View();
        }

        public ActionResult Information(string msg)
        {
            User user = (User)Session["USER"];
            ViewBag.Msg = msg;
            ViewBag.User = userDao.getById(user.idUser);
            return View();
        }

        [HttpPost]
        public ActionResult UpdateInfor(User user)
        {
            User usercurrent = (User)Session["User"];
            usercurrent.fullName = user.fullName;
            usercurrent.phoneNumber = user.phoneNumber;
            usercurrent.password = user.password;
            userDao.Update(usercurrent);
            return RedirectToAction("Information", new { msg = "1" });
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
                    userObj.isTest = false;
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

        [HttpPost]
        public JsonResult TestExam(AjaxRequest request)
        {
            User user = (User)Session["User"];
            for(int i = 0; i< 20; i++)
            {
                if ("".Equals(request.Answers[i])){
                    return Json(new { Data = "Cần chọn đầy đủ đáp án ", Status = false }, JsonRequestBehavior.AllowGet);
                }
            };
            int total = 0;
            for (int i = 0; i < 20; i++)
            {
                if (answers[i].Equals(request.Answers[i]))
                {
                    total += 50;
                }
            };
            user.point = user.point +  total;
            user.isTest = true;
            userDao.Update(user);
            return Json(new { Total = total, Status = true }, JsonRequestBehavior.AllowGet);
           
        }


        public ActionResult Logout()
        {
            Session.Remove("User");
            return Redirect("/");
        }

    }
}