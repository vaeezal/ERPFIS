using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebERPFIS.Models;

namespace WebERPFIS.Interface
{
    public interface IMenu
    {
        List<MenuVM> ListofMenus();
        IQueryable<MenuVM> ListofMenus(string sortColumn, string sortColumnDir, string Search);
        bool RemovefromMenu(string menuid);
        IQueryable<MenuVM> GetMenuDetailsByMenuid(string MenuId);

        ////Create
        ////------
        //bool CheckUserNameExists(string Username);
        //int AddUser(Registration entity);
        //IQueryable<Registration> ListofRegisteredUser(string sortColumn, string sortColumnDir, string Search);
        //bool UpdatePassword(string RegistrationID, string Password);
    }
}
