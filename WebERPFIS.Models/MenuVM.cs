using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebERPFIS.Models
{
    [NotMapped]
    public class MenuVM
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string ParentId { get; set; }
        public int SortOrder_ { get; set; }
        public string UrlLink { get; set; }
        public string Icon { get; set; }
        public int ChildCount { get; set; }
        public int MenuLevel { get; set; }
        public Boolean IsActive { get; set; }
    }
}
