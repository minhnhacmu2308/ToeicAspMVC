using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ToeicAspMVC.Models
{
    public class Product
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int idProduct { get; set; }

        [StringLength(255)]
        [Required]
        public string name { get; set; }

        [StringLength(255)]
        public string image { get; set; }

        public int point { get; set; }

        public int status { get; set; }

        public string created { get; set; }
    }
}