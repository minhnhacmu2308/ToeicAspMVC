using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ToeicAspMVC.Models
{
    public class Comment
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int idComment { get; set; }

        public string content { get; set; }

        public int status { get; set; }

        public int parent { get; set; }

        public int idUser { get; set; }

        public int idPost { get; set; }


        public string created { get; set; }

        public virtual User User { get; set; }

        public virtual Post Post { get; set; }
    }
}