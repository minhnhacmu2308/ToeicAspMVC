using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ToeicAspMVC.Models
{
    public class Target
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int idTarget { get; set; }

        [StringLength(255)]
        [Required]
        public string name { get; set; }

        public int point { get; set; }

        public int status { get; set; }

        public string created { get; set; }

        public virtual ICollection<MyTarget> MyTargets { get; set; }
    }
}