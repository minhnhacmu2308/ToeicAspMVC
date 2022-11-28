using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Daos
{
    public class PostDao
    {
        ToeicAspContext myDb = new ToeicAspContext();

        public List<Post> GetAll()
        {
            return myDb.posts.OrderByDescending( x => x.created).ToList();
        }

        public Post GetDetail(int id)
        {
            return myDb.posts.FirstOrDefault(x => x.idPost == id);
        }


        public void Approved(Post post)
        {
            var obj = myDb.posts.FirstOrDefault(x => x.idPost == post.idPost);
            obj.status = 1;
            myDb.SaveChanges();
        }

        public void Add(Post post)
        {
            myDb.posts.Add(post);
            myDb.SaveChanges();
        }

        public List<Post> GetPostByUser(int id, int page, int pagesize)
        {
            return myDb.posts.Where(p => p.idUser == id).OrderByDescending(u => u.idPost).ToList().
                Skip((page - 1) * pagesize).Take(pagesize).ToList();
        }

        public int GetNumberPostByUser(int id)
        {
            int total = myDb.posts.Where(p => p.idUser == id).ToList().Count;
            int count = 0;
            count = total / 5;
            if (total % 5 != 0)
            {
                count++;
            }
            return count;
        }

        public List<Post> GetPostApprove()
        {
            return myDb.posts.Where(x => x.status == 1).OrderByDescending(x => x.created).ToList();
        }

        public int getNumberPost()
        {
            int total = myDb.posts.Where(p => p.status == 1).ToList().Count;
            int count = 0;
            count = total / 5;
            if (total % 5 != 0)
            {
                count++;
            }
            return count;
        }
        public int GetNumberPost()
        {
            int total = myDb.posts.Where(x => x.status == 1).ToList().Count;
            int count = 0;
            count = total / 5;
            if (total % 5 != 0)
            {
                count++;
            }
            return count;
        }

        public List<Post> GetPosts(int page, int pagesize)
        {
            return myDb.posts.Where(x => x.status == 1).OrderByDescending(u => u.idPost).ToList().
                Skip((page - 1) * pagesize).Take(pagesize).ToList();
        }

        public void Delete(int id)
        {
            var obj = myDb.posts.FirstOrDefault(x => x.idPost == id);
            var comment = myDb.comments.Where(x => x.idPost == id).ToList();
            myDb.comments.RemoveRange(comment);
            myDb.SaveChanges();
            myDb.posts.Remove(obj);
            myDb.SaveChanges();
        }

    }
}