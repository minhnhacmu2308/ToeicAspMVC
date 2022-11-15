using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToeicAspMVC.Daos;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Controllers
{
    public class DocumentController : Controller
    {
        DocumentDao documentDao = new DocumentDao();
        UserDao userDao = new UserDao();
        // GET: Document
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Add(string mess)
        {
            ViewBag.Msg = mess;
            return View();
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult Add(Document document)
        {
            var file = Request.Files["file"];
            string reName = DateTime.Now.Ticks.ToString() + file.FileName;
            file.SaveAs(Server.MapPath("~/Content/images/" + reName));
            document.created = DateTime.Now.ToString();
            document.image = reName;
            document.status = 0;
            documentDao.Add(document);
            return RedirectToAction("Add", new { mess = "1" });
        }

        public ActionResult Detail(int id)
        {
            ViewBag.Detail = documentDao.GetDocumentById(id);
           /* ViewBag.ListDocument = documentDao.GetDocumentById(id);*/
            return View();
        }

        public ActionResult ListDocument(int id, int page)
        {
            if (page == 0)
            {
                page = 1;
            }
            ViewBag.List = documentDao.GetDocumentByUser(id, page, 5);
            ViewBag.tag = page;
            ViewBag.pageSize = documentDao.GetNumberDocumentByUser(id);
            ViewBag.User = userDao.getById(id);
            return View();
        }
    }
}