using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Daos
{
    public class DocumentDao
    {
        ToeicAspContext myDb = new ToeicAspContext();
        public void Add(Document document)
        {
            myDb.documents.Add(document);
            myDb.SaveChanges();
        }

        public List<Document> GetDocuments(int page, int pagesize)
        {
            return myDb.documents.Where(u => u.status == 1).OrderByDescending(x => x.idDocument).ToList().
                Skip((page - 1) * pagesize).Take(pagesize).ToList();
        }

        public List<Document> GetDocumentList()
        {
            return myDb.documents.OrderByDescending(x => x.created).ToList();
        }

        public Document GetDocumentById(int id)
        {
            return myDb.documents.Where(p => p.idDocument == id).FirstOrDefault();
        }

        public List<Document> GetDocumentByUser(int id, int page, int pagesize)
        {
            return myDb.documents.Where(p => p.idUser == id).OrderByDescending(u => u.idDocument).ToList().
                Skip((page - 1) * pagesize).Take(pagesize).ToList();
        }
        public void ChangeStatus(int id)
        {
            var post = GetDocumentById(id);
            post.status = 1;
            myDb.SaveChanges();
        }


        public int getNumberPost()
        {
            int total = myDb.documents.Where(p => p.status == 1).ToList().Count;
            int count = 0;
            count = total / 5;
            if (total % 5 != 0)
            {
                count++;
            }
            return count;
        }
        public int GetNumberDocumentByUser(int id)
        {
            int total = myDb.documents.Where(p => p.idUser == id).ToList().Count;
            int count = 0;
            count = total / 5;
            if (total % 5 != 0)
            {
                count++;
            }
            return count;
        }

        public List<Document> GetDocumentIndexs(int page, int pagesize)
        {
            return myDb.documents.Where(x => x.status == 1).OrderByDescending(u => u.idDocument).ToList().
                Skip((page - 1) * pagesize).Take(pagesize).ToList();
        }
    }
}