using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebERPFIS.Interface;

namespace WebERPFIS.Implementation
{
    public class RolesImpl : IRoles
    {

        /// <summary>
        /// Get RoleID Name by RoleName
        /// </summary>
        /// <param name="Rolename"></param>
        /// <returns></returns>
        public int getRolesofUserbyRolename(string Rolename)
        {
            using (var _context = new DatabaseContext())
            {
                var roleID = (from role in _context.Role
                              where role.Rolename == Rolename
                              select role.RoleID).SingleOrDefault();

                return roleID;
            }
        }

        public int getRolesofUserbyUserId(string Rolename)
        {
            using (var _context = new DatabaseContext())
            {
                var roleID = (from role in _context.Role
                              where role.Rolename == Rolename
                              select role.RoleID).SingleOrDefault();

                return roleID;
            }
        }
    }
}
