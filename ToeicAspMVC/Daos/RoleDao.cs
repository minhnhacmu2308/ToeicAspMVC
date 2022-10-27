using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Daos
{
    public class RoleDao
    {
        ToeicAspContext myDb = new ToeicAspContext();

        public List<Role> GetRoles()
        {
            return myDb.roles.ToList();
        }
        public Role GetRole(int id)
        {
            return myDb.roles.FirstOrDefault(x => x.idRole == id);
        }
    }
}