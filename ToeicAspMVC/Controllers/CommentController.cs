using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToeicAspMVC.Daos;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Controllers
{
    public class CommentController : Controller
    {
        CommentDao commentDao = new CommentDao();
        // GET: Comment
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult PostComment(Comment comment)
        {
            var user = (User)Session["User"];
            if (user == null)
            {
                return RedirectToAction("Login", "Authentication");
            }
            else
            {
                DateTime now = DateTime.Now;
                comment.created = now.ToString();
                comment.idUser = user.idUser;
                commentDao.postComment(comment);
                string url = "/Post/Detail/" + comment.idPost;
                return Redirect(url);
            }

        }

        [HttpPost]
        public ActionResult DeleteComment(FormCollection form)
        {
            var id = form["id"];
            var postId = form["postId"];
            commentDao.deleteComment(Int32.Parse(id));
            string url = "/Post/Detail/" + postId;
            return Redirect(url);
        }
    }
}