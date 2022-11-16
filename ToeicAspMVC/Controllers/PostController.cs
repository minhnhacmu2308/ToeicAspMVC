using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToeicAspMVC.Daos;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Controllers
{
    public class PostController : Controller
    {
        PostDao postDao = new PostDao();
        UserDao userDao = new UserDao();
        CommentDao commentDao = new CommentDao();
        // GET: Document
        public ActionResult Index(int page)
        {
            if (page == 0)
            {
                page = 1;
            }
            ViewBag.List = postDao.GetPosts(page, 5);
            ViewBag.tag = page;
            ViewBag.pageSize = postDao.GetNumberPost();
            return View();
        }

        [HttpGet]
        public ActionResult Add(string mess)
        {
            ViewBag.Msg = mess;
            return View();
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult Add(Post post)
        {
            var file = Request.Files["file"];
            string reName = DateTime.Now.Ticks.ToString() + file.FileName;
            file.SaveAs(Server.MapPath("~/Content/assets/imgs/" + reName));
            post.created = DateTime.Now.ToString();
            post.image = reName;
            post.status = 0;
            postDao.Add(post);
            return RedirectToAction("Add", new { mess = "1" });
        }

        public ActionResult Detail(int id)
        {
            ViewBag.Detail = postDao.GetDetail(id);
            ViewBag.listComment = commentDao.getCommentById(id);
            return View();
        }

        public ActionResult ListPost(int id, int page)
        {
            if (page == 0)
            {
                page = 1;
            }
            ViewBag.List = postDao.GetPostByUser(id, page, 5);
            ViewBag.tag = page;
            ViewBag.pageSize = postDao.GetNumberPostByUser(id);
            ViewBag.User = userDao.getById(id);
            return View();
        }
    }
}