using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ToeicAspMVC.Models
{
    public class Course
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int idCourse { get; set; }

        [StringLength(255)]
        [Required]
        public string name { get; set; }

        [StringLength(255)]
        [Required]
        public string image { get; set; }

        public string description { get; set; }

        public int status { get; set; }

        public string created { get; set; }
    }
}