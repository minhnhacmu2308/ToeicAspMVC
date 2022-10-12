using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ToeicAspMVC.Models
{
    public class Document
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int idDocument { get; set; }

        [StringLength(255)]
        [Required]
        public string name { get; set; }

        public string image { get; set; }

        public string fileName { get; set; }

        public string content { get; set; }

        public int status { get; set; }

        public int idUser { get; set; }

        public string created { get; set; }

        public virtual User User { get; set; }
    }
}