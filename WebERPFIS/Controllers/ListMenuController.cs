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
    public class ListMenuController : Controller
    {
        IMenu _IMenu;

        public ListMenuController()
        {
            _IMenu = new MenuImpl();
        }

        ////////////////

        // GET: AllMenu
        public ActionResult ListMenus()
        {
            ViewBag.Menu = _IMenu.ListofMenus();
            //LoadMenusData();
            return View();
        }

        public ActionResult LoadMenusData()
        {
            try
            {
                var draw = Request.Form.GetValues("draw").FirstOrDefault();
                var start = Request.Form.GetValues("start").FirstOrDefault();
                var length = Request.Form.GetValues("length").FirstOrDefault();
                var sortColumn = Request.Form.GetValues("columns[" + Request.Form.GetValues("order[0][column]").FirstOrDefault() + "][name]").FirstOrDefault();
                var sortColumnDir = Request.Form.GetValues("order[0][dir]").FirstOrDefault();
                var searchValue = Request.Form.GetValues("search[value]").FirstOrDefault();
                int pageSize = length != null ? Convert.ToInt32(length) : 0;
                int skip = start != null ? Convert.ToInt32(start) : 0;

                int recordsTotal = 0;

                var menusData = _IMenu.ListofMenus(sortColumn, sortColumnDir, searchValue);
                recordsTotal = menusData.Count();
                var data = menusData.Skip(skip).Take(pageSize).ToList();

                return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = data });
            }
            catch (Exception)
            {
                throw;
            }
        }

        public ActionResult RemovefromMenu(string MenuId)
        {
            try
            {
                if (string.IsNullOrEmpty(MenuId))
                {
                    return RedirectToAction("Menus");
                }

                var role = _IMenu.RemovefromMenu(MenuId);
                return Json(role);
            }
            catch (Exception)
            {
                return Json(false);
            }
        }

        public ActionResult MenuDetails(string Id)
        {
            try
            {
                if (Id == null)
                {

                }
                var menuDetailsResponse = _IMenu.GetMenuDetailsByMenuid(Id).First();
                return PartialView("_MenuDetails", menuDetailsResponse);
            }
            catch (Exception)
            {
                throw;
            }
        }

        ////Create
        ////------
        //// POST: Registration/Create
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Registration(Registration registration)
        //{
        //    try
        //    {
        //        var isUsernameExists = _IRegistration.CheckUserNameExists(registration.Username);

        //        if (isUsernameExists)
        //        {
        //            ModelState.AddModelError("", errorMessage: "Username Already Used try unique one!");
        //        }
        //        else
        //        {
        //            registration.CreatedOn = DateTime.Now;
        //            registration.RoleID = _IRoles.getRolesofUserbyRolename("Users");
        //            registration.Password = EncryptionLibrary.EncryptText(registration.Password);
        //            registration.ConfirmPassword = EncryptionLibrary.EncryptText(registration.ConfirmPassword);
        //            if (_IRegistration.AddUser(registration) > 0)
        //            {
        //                TempData["MessageRegistration"] = "Data Saved Successfully!";
        //                return RedirectToAction("Registration");
        //            }
        //            else
        //            {
        //                return View(registration);
        //            }
        //        }
        //        return RedirectToAction("Registration");
        //    }
        //    catch
        //    {
        //        return View(registration);
        //    }
        //}

        //public JsonResult CheckUserNameExists(string Username)
        //{
        //    try
        //    {
        //        var isUsernameExists = false;

        //        if (Username != null)
        //        {
        //            isUsernameExists = _IRegistration.CheckUserNameExists(Username);
        //        }

        //        if (isUsernameExists)
        //        {
        //            return Json(data: true);
        //        }
        //        else
        //        {
        //            return Json(data: false);
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //}
    }
}