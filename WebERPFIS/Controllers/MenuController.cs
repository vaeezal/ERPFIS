using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebERPFIS.Implementation;
using WebERPFIS.Filters;
using WebERPFIS.Interface;
using WebERPFIS.Models;

namespace WebERPFIS.Controllers
{
    [ValidateSuperAdminSession]
    public class MenuController : Controller
    {
        IMenu _IMenu;

        public MenuController()
        {
            ViewBag.Menu = BuildMenu();
        }

        public IList<MenuVM> BuildMenu()
        {
            _IMenu = new MenuImpl();
            var menulist = _IMenu.ListofMenus();

            IList<MenuVM> mmList = new List<MenuVM>();
            if (menulist != null)
            {
                if (menulist.Count() > 0)
                {
                    for (int i = 0; i < menulist.Count(); i++)
                    {
                        var mmitem = new MenuVM();
                        mmitem.Id = menulist[i].Id;
                        mmitem.Name = menulist[i].Name;
                        mmitem.ParentId = menulist[i].ParentId;
                        mmitem.SortOrder_ = menulist[i].SortOrder_;
                        mmitem.UrlLink = menulist[i].UrlLink == "" || menulist[i].UrlLink == null ? "#" : menulist[i].UrlLink;
                        mmitem.Icon = menulist[i].Icon==null ? "" : menulist[i].Icon;
                        mmitem.ChildCount = menulist[i].ChildCount;
                        mmitem.MenuLevel = getMenuLevel(menulist[i].ParentId);
                        mmList.Add(mmitem);
                    }
                }
            }
            return mmList;
        }

        private int getMenuLevel(string parentId)
        {
            int menuLevel = 1;
            string tempParentId = parentId;

            var menulist = _IMenu.ListofMenus();

            if (menulist != null)
            {
                if (menulist.Count() > 0)
                {
                    while (!tempParentId.Equals("0"))
                    {
                        for (int i = 0; i < menulist.Count(); i++)
                        {
                            if (tempParentId.Equals(menulist[i].Id))
                            {
                                tempParentId = menulist[i].ParentId;
                                menuLevel += 1;
                            }
                        }
                    }
                }
            }

            return menuLevel;
        } 
    }
}