using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ToeicAspMVC.Models
{
    public class Distance
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int idDistance { get; set; }

        public int fromPoint { get; set; }

        public int point { get; set; }

        public string description { get; set; }

        public int status { get; set; }

        public string created { get; set; }
    }
}