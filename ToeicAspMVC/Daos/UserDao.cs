using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Daos
{
    public class UserDao
    {
        ToeicAspContext myDb = new ToeicAspContext();
        public bool checkLogin(string email, string password)
        {
            var obj = myDb.users.FirstOrDefault(x => x.email == email && x.password == password);
            if (obj == null) { return false; }
            return true;
        }



        public User getUserByEmail(string email)
        {
            return myDb.users.FirstOrDefault(x => x.email.Equals(email));
        }



        public List<User> getNV()
        {
            return myDb.users.Where(x => x.idRole == 2).ToList();
        }



        public List<User> getKH()
        {
            return myDb.users.Where(x => x.idRole == 3).ToList();
        }
        public void Add(User user)
        {
            myDb.users.Add(user);
            myDb.SaveChanges();
        }
        public User getById(int id)
        {
            return myDb.users.FirstOrDefault(x => x.idUser == id);
        }
      
        public void Delete(int id)
        {
            var obj = myDb.users.FirstOrDefault(x => x.idUser == id);
            myDb.users.Remove(obj);
            myDb.SaveChanges();
        }



        public string md5(string password)
        {
            MD5 md = MD5.Create();
            byte[] inputString = System.Text.Encoding.ASCII.GetBytes(password);
            byte[] hash = md.ComputeHash(inputString);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                sb.Append(hash[i].ToString("x"));
            }
            return sb.ToString();
        }



        public bool checkExistEmail(string email)
        {
            var user = myDb.users.FirstOrDefault(x => x.email == email);
            if (user != null)
            {
                return true;
            }
            return false;
        }

        public bool checkEmailExist(string email)
        {
            var objUser = myDb.users.Where(u => u.email == email).FirstOrDefault();
            if (objUser != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public List<User> GetAll()
        {
            return myDb.users.OrderBy(x => x.idRole).ToList();
        }

        public void Update(User user)
        {
            var obj = myDb.users.FirstOrDefault(x => x.idUser == user.idUser);
            obj.fullName = user.fullName;
            obj.phoneNumber = user.phoneNumber;
            obj.password = user.password;
            obj.idRole = user.idRole;
            obj.point = user.point;
            myDb.SaveChanges();
        }

        public List<Document> GetDocumentByUser(int idUser)
        {
            return myDb.documents.Where(x => x.idUser == idUser).ToList();
        }

        public List<Post> GetPostByUser(int idUser)
        {
            return myDb.posts.Where(x => x.idUser == idUser).ToList();
        }

        public List<Comment> GetCommentByUser(int idUser)
        {
            return myDb.comments.Where(x => x.idUser == idUser).ToList();
        }

        public List<MyTarget> GetMyTargetByUser(int idUser)
        {
            return myDb.myTargets.Where(x => x.idUser == idUser).ToList();
        }

        public List<Role> GetRole()
        {
            return myDb.roles.ToList();
        }

    }
}