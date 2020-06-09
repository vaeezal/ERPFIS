using Dapper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebERPFIS.Interface;
using WebERPFIS.Models;
using System.Linq.Dynamic;

namespace WebERPFIS.Implementation
{
    public class MenuImpl : IMenu
    {
        public List<MenuVM> ListofMenus()
        {

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ERPFISDBEntities"].ToString()))
            {
                con.Open();
                try
                {
                    var result = con.Query<MenuVM>("Usp_GetListofMenus", null, null, true, 0, System.Data.CommandType.StoredProcedure).ToList();
                    return result;
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }

        public IQueryable<MenuVM> ListofMenus(string sortColumn, string sortColumnDir, string Search)
        {
            var _context = new DatabaseContext();
            try
            {

                var IQueryableERPFIS = (from menutemp in _context.Menu
                                        select new MenuVM
                                        {
                                            Id = menutemp.Id,
                                            Name = menutemp.Name,
                                            ParentId = menutemp.ParentId,
                                            SortOrder_ = menutemp.SortOrder_,
                                            UrlLink = menutemp.UrlLink,
                                            Icon = menutemp.Icon,
                                            IsActive = menutemp.IsActive
                                        });

                if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDir)))
                {
                    IQueryableERPFIS = IQueryableERPFIS.Where(x => x.IsActive == true).OrderBy(sortColumn + " " + sortColumnDir);
                }
                if (!string.IsNullOrEmpty(Search))
                {
                    IQueryableERPFIS = IQueryableERPFIS.Where(x => (x.Id.ToUpper().Contains(Search.ToUpper())
                    || x.Name.ToUpper().Contains(Search.ToUpper()))&& x.IsActive == true);
                }

                return IQueryableERPFIS;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public bool RemovefromMenu(string MenuId)
        {
            using (var _context = new DatabaseContext())
            {
                try
                {
                    var IQueryableERPFIS = (_context.Menu.SingleOrDefault(x => x.Id == MenuId));

                    if (IQueryableERPFIS != null)
                    {
                        IQueryableERPFIS.IsActive = false;
                        _context.SaveChanges();
                    }
                    return true;
                }
                catch (Exception e)
                {
                    throw e;
                }
            }
        }

        public IQueryable<MenuVM> GetMenuDetailsByMenuid(string menuid)
        {
            var _context = new DatabaseContext();
            try
            {

                var IQueryableERPFIS = (
                                        //from menutemp in _context.Menu join 
                                        //parentmenutemp in _context.Menu on menutemp.ParentId equals parentmenutemp.Id into gj
                                        //from x in gj.DefaultIfEmpty()
                                        from menutemp in _context.Menu
                                        from parentmenutemp in _context.Menu.Where(x => x.ParentId == menutemp.Id && x.IsActive==true).DefaultIfEmpty()
                                        select new MenuVM
                                        {
                                            Id = menutemp.Id,
                                            Name = menutemp.Name,
                                            ParentId = menutemp.ParentId,
                                            SortOrder_ = menutemp.SortOrder_,
                                            UrlLink = menutemp.UrlLink,
                                            Icon = menutemp.Icon

                                        });
                if (!string.IsNullOrEmpty(menuid))
                {
                    IQueryableERPFIS = IQueryableERPFIS.Where(m => m.Id.ToUpper().Equals(menuid));
                }

                return IQueryableERPFIS;
            }
            catch (Exception)
            {
                throw;
            }
        }

        ////Create
        ////------
        //public bool CheckUserNameExists(string Username)
        //{
        //    try
        //    {
        //        using (var _context = new DatabaseContext())
        //        {
        //            var result = (from user in _context.Registration
        //                          where user.Username == Username
        //                          select user).Count();

        //            if (result > 0)
        //            {
        //                return true;
        //            }
        //            else
        //            {
        //                return false;
        //            }
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //}

        //public int AddUser(Registration entity)
        //{
        //    try
        //    {
        //        using (var _context = new DatabaseContext())
        //        {
        //            _context.Registration.Add(entity);
        //            return _context.SaveChanges();
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //}

        //public IQueryable<Registration> ListofRegisteredUser(string sortColumn, string sortColumnDir, string Search)
        //{
        //    try
        //    {
        //        var _context = new DatabaseContext();

        //        var IQueryableRegistered = (from register in _context.Registration
        //                                    select register
        //                        );

        //        if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDir)))
        //        {
        //            IQueryableRegistered = IQueryableRegistered.OrderBy(sortColumn + " " + sortColumnDir);
        //        }
        //        if (!string.IsNullOrEmpty(Search))
        //        {
        //            IQueryableRegistered = IQueryableRegistered.Where(m => m.Username.Contains(Search) || m.Name.Contains(Search));
        //        }

        //        return IQueryableRegistered;

        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //}

        //public bool UpdatePassword(string RegistrationID, string Password)
        //{
        //    try
        //    {
        //        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ERPFISDBEntities"].ToString()))
        //        {
        //            var param = new DynamicParameters();
        //            param.Add("@RegistrationID", RegistrationID);
        //            param.Add("@Password", Password);
        //            var result = con.Execute("Usp_UpdatePasswordbyRegistrationID", param, null, 0, System.Data.CommandType.StoredProcedure);
        //            if (result > 0)
        //            {
        //                return true;
        //            }
        //            else
        //            {
        //                return false;
        //            }
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //}
    }
}
