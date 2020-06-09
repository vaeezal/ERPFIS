using System.Web;
using System.Web.Mvc;
using WebERPFIS.Helpers;

namespace WebERPFIS
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
           filters.Add(new ErrorLoggerAttribute());
        }
    }
}
