﻿using EventApplicationCore.Library;
using System;
using System.Web.Mvc;
using WebERPFIS.Implementation;
using WebERPFIS.Filters;
using WebERPFIS.Interface;
using WebERPFIS.Models;

namespace WebERPFIS.Controllers
{
    [ValidateSuperAdminSession]
    public class UserProfileController : Controller
    {
        IMenu _IMenu;
        ILogin _ILogin;
        public UserProfileController()
        {
            _IMenu = new MenuImpl();
            ViewBag.Menu = _IMenu.ListofMenus();

            _ILogin = new LoginImpl();
        }

        // GET: UserProfile
        [HttpGet]
        public ActionResult ChangePassword()
        {
            return View(new ChangePasswordModel());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePassword(ChangePasswordModel changepasswordmodel)
        {
            try
            {
                var password = EncryptionLibrary.EncryptText(changepasswordmodel.OldPassword);

                var storedPassword = _ILogin.GetPasswordbyUserID(Convert.ToInt32(Session["UserID"]));

                if (storedPassword == password)
                {
                    var result = _ILogin.UpdatePassword(EncryptionLibrary.EncryptText(changepasswordmodel.NewPassword), Convert.ToInt32(Session["UserID"]));

                    if (result)
                    {
                        ModelState.Clear();
                        ViewBag.message = "Password Changed Successfully";
                        return View(changepasswordmodel);
                    }
                    else
                    {
                        ModelState.AddModelError("", "Something Went Wrong Please try Again after some time");
                        return View(changepasswordmodel);
                    }

                }
                else
                {
                    ModelState.AddModelError("", "Entered Wrong Old Password");
                    return View(changepasswordmodel);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }



    }
}