using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Daos
{
    public class TargetDao
    {
        ToeicAspContext myDb = new ToeicAspContext();

        public List<Target> GetAll()
        {
            return myDb.targets.Where(x => x.idTarget != 1).OrderByDescending(x => x.point).ToList();
        }
    }
}