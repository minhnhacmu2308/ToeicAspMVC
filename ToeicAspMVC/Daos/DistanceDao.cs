using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Daos
{
    public class DistanceDao
    {
        ToeicAspContext myDb = new ToeicAspContext();

        public List<Distance> GetAll()
        {
            return myDb.distances.ToList();
        }

        public List<Distance> Recommend(int point)
        {
            return myDb.distances.Where(x => x.fromPoint <= point && x.point >= point).ToList();
        }

        public Distance GetDetail(int id)
        {
            return myDb.distances.FirstOrDefault(x => x.idDistance == id);
        }

        public void Add(Distance distance)
        {
            myDb.distances.Add(distance);
            myDb.SaveChanges();
        }

        public void Update(Distance distance)
        {
            var obj = myDb.distances.FirstOrDefault(x => x.idDistance == distance.idDistance);
            obj.fromPoint = distance.fromPoint;
            obj.description = distance.description;
            obj.point = distance.point;
            myDb.SaveChanges();
        }
        public void Delete(int id)
        {
            var obj = myDb.distances.FirstOrDefault(x => x.idDistance == id);
            myDb.distances.Remove(obj);
            myDb.SaveChanges();
        }
    }
}