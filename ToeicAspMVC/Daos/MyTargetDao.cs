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

        public List<MyTarget> GetTargetOption()
        {
            return myDb.myTargets.Where(x => x.idTarget != 1).ToList();
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

        public void Approved(int id)
        {
            var obj = myDb.myTargets.FirstOrDefault(x => x.idMyTarget == id);
            var user = myDb.users.FirstOrDefault(x => x.idUser == obj.idUser);
            user.point = user.point + obj.Target.point;
            obj.status = 1;
            myDb.SaveChanges();
        }
    }
}