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
        
    }
}