using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Daos
{
    public class ProductDao
    {
        ToeicAspContext myDb = new ToeicAspContext();

        public List<Product> GetAll()
        {
            return myDb.products.ToList();
        }

        public List<UserProduct> GetUserProduct(int id)
        {
            return myDb.userProducts.Where(x => x.idUser == id).ToList();
        }

        public List<UserProduct> GetProductUser(int id)
        {
            return myDb.userProducts.Where(x => x.idProduct == id).ToList();
        }

        public Product GetDetail(int id)
        {
            return myDb.products.FirstOrDefault(x => x.idProduct == id);
        }

        public void Add(Product product)
        {
            myDb.products.Add(product);
            myDb.SaveChanges();
        }

        public void AddUserProduct(UserProduct userProduct)
        {
            myDb.userProducts.Add(userProduct);
            myDb.SaveChanges();
        }

        public void Update(Product product)
        {
            var obj = myDb.products.FirstOrDefault(x => x.idProduct == product.idProduct);
            obj.name = product.name;
            obj.image = product.image;
            obj.point = product.point;
            myDb.SaveChanges();
        }
        public void Delete(int id)
        {
            var obj = myDb.products.FirstOrDefault(x => x.idProduct == id);
            myDb.products.Remove(obj);
            myDb.SaveChanges();
        }
    }
}