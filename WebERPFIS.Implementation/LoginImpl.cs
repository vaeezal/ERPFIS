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

namespace WebERPFIS.Implementation
{
    public class LoginImpl : ILogin
    {
        public Registration ValidateUser(string userName, string passWord)
        {
            try
            {
                using (var _context = new DatabaseContext())
                {
                    var validate = (from user in _context.Registration
                                    where user.Username == userName && user.Password == passWord
                                    select user).SingleOrDefault();

                    return validate;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public bool UpdatePassword(string NewPassword, int UserID)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ERPFISDBEntities"].ToString()))
            {
                con.Open();
                SqlTransaction sql = con.BeginTransaction();
                try
                {
                    var param = new DynamicParameters();
                    param.Add("@NewPassword", NewPassword);
                    param.Add("@UserID", UserID);
                    var result = con.Execute("Usp_Updatepassword", param, sql, 0, System.Data.CommandType.StoredProcedure);
                    if (result > 0)
                    {
                        sql.Commit();
                        return true;
                    }
                    else
                    {
                        sql.Rollback();
                        return false;
                    }
                }
                catch (Exception)
                {
                    sql.Rollback();
                    throw;
                }
            }
        }

        public string GetPasswordbyUserID(int UserID)
        {
            try
            {
                using (var _context = new DatabaseContext())
                {
                    var password = (from temppassword in _context.Registration
                                    where temppassword.RegistrationID == UserID
                                    select temppassword.Password).FirstOrDefault();

                    return password;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Roles GetRolebyUserID(int UserID)
        {
            try
            {
                using (var _context = new DatabaseContext())
                {
                    var role = (from efuser in _context.Registration
                                join efassignedrole in _context.AssignedRoles on efuser.RegistrationID equals efassignedrole.RegistrationID
                                join efrole in _context.Role on efassignedrole.AssignToAdmin equals efrole.RoleID
                                where efuser.RegistrationID == UserID
                                    select efrole).FirstOrDefault();

                    return role;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
