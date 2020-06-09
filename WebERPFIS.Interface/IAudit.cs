using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebERPFIS.Models;

namespace WebERPFIS.Interface
{
    public interface IAudit
    {
        void InsertAuditData(AuditTB audittb);
    }
}
