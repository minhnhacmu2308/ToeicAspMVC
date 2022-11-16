using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Daos
{
    public class CommentDao
    {
        ToeicAspContext myDb = new ToeicAspContext();
        public List<Comment> getComments()
        {
            return myDb.comments.ToList();
        }

        public List<Comment> getCommentById(int id)
        {
            return myDb.comments.Where(c => c.Post.idPost == id).OrderByDescending(u => u.idComment).ToList();
        }

        public void postComment(Comment comment)
        {
            comment.status = 1;
            myDb.comments.Add(comment);
            /*   var obj = myDb.Comments.FirstOrDefault(x => x.id_comment == comment.id_comment);
               obj.status = 1;
               obj.text = comment.text;
               obj.parent = comment.parent;
               obj.id_post = comment.id_post;
               obj.id_user = comment.id_user;
               obj.createdAt = comment.createdAt;*/
            myDb.SaveChanges();
        }

        public void deleteComment(int id)
        {
            var comment = myDb.comments.FirstOrDefault(x => x.idComment== id);
            myDb.comments.Remove(comment);
            myDb.SaveChanges();
        }
    }
}