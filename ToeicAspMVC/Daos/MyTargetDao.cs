using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Daos
{
    public class MyTargetDao
    {
        ToeicAspContext myDb = new ToeicAspContext();
        public List<MyTarget> GetByUser(int id)
        {
            return myDb.myTargets.Where(x => x.idUser == id).ToList();
        }

        public MyTarget GetDetail(int id)
        {
            return myDb.myTargets.FirstOrDefault(x => x.idMyTarget == id);
        }

        public void Add(MyTarget myTarget)
        {
            myDb.myTargets.Add(myTarget);
            myDb.SaveChanges();
        }
    }
}