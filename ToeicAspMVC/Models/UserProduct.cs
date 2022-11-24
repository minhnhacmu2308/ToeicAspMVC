using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ToeicAspMVC.Models
{
    public class UserProduct
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int idUserProduct { get; set; }

        public string note { get; set; }

        public int status { get; set; }

        public int idUser { get; set; }
        public int idProduct { get; set; }

        public string created { get; set; }

        public virtual User User { get; set; }

        public virtual Product Product { get; set; }
     
    }
}