using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebERPFIS.Implementation;
using WebERPFIS.Interface;
using WebERPFIS.Models;

namespace WebERPFIS.Controllers
{
    public class DemoAssignController : Controller
    {
        IMenu _IMenu;
        private IAssignRoles _IAssignRoles;
        public DemoAssignController()
        {
            _IMenu = new MenuImpl();
            ViewBag.Menu = _IMenu.ListofMenus();

            _IAssignRoles = new AssignRolesImpl();
        }
        // GET: DemoAssign
        public ActionResult Index()
        {
            try
            {
                AssignRolesModel assignRolesModel = new AssignRolesModel();
                assignRolesModel.ListofAdmins = _IAssignRoles.ListofAdmins();
                assignRolesModel.ListofUser = _IAssignRoles.GetListofUnAssignedUsers();
                assignRolesModel.ListofRoles = _IAssignRoles.ListofRoles();
                return View(assignRolesModel);
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpPost]
        public ActionResult Index(List<UserModel> list ,AssignRolesModel assignRolesModel)
        {
            try
            {
                if (assignRolesModel.ListofUser == null)
                {
                    TempData["MessageErrorRoles"] = "There are no Users to Assign Roles";
                    assignRolesModel.ListofAdmins = _IAssignRoles.ListofAdmins();
                    assignRolesModel.ListofUser = _IAssignRoles.GetListofUnAssignedUsers();
                    assignRolesModel.ListofRoles = _IAssignRoles.ListofRoles();
                    return View(assignRolesModel);
                }

                if (ModelState.IsValid)
                {
                    assignRolesModel.CreatedBy = Convert.ToInt32(Session["SuperAdmin"]);
                    _IAssignRoles.SaveAssignedRoles(assignRolesModel);
                    TempData["MessageRoles"] = "Roles Assigned Successfully!";
                }

                assignRolesModel = new AssignRolesModel();
                assignRolesModel.ListofAdmins = _IAssignRoles.ListofAdmins();
                assignRolesModel.ListofUser = _IAssignRoles.GetListofUnAssignedUsers();
                assignRolesModel.ListofRoles = _IAssignRoles.ListofRoles();

                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}