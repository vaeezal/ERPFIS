using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebERPFIS.Models
{
    [Table("Menu")]
    public class Menu
    {
        [Key]
        public string Id { get; set; }
        public string Name { get; set; }
        public string ParentId { get; set; }
        public int SortOrder_ { get; set; }
        public string UrlLink { get; set; }
        public string Icon { get; set; }
        public Boolean IsActive { get; set; }
    }
}
