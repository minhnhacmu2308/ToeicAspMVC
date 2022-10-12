using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ToeicAspMVC.Models
{
    public class MyTarget
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int idMyTarget { get; set; }

        [StringLength(255)]
        [Required]
        public string name { get; set; }

        public string deadline { get; set; }

        public string content { get; set; }

        public int status { get; set; }

        public int idUser { get; set; }

        public int idTarget { get; set; }

        public string created { get; set; }

        public virtual User User { get; set; }
        public virtual Target Target { get; set; }
    }
}