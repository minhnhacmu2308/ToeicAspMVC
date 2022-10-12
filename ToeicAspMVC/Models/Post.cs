using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ToeicAspMVC.Models
{
    public class Post
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int idPost { get; set; }

        [StringLength(255)]
        [Required]
        public string title { get; set; }

        public string image { get; set; }


        public string content { get; set; }

        public int status { get; set; }

        public int idUser { get; set; }

        public string created { get; set; }

        public virtual User User { get; set; }

        public virtual ICollection<Comment> Comments { get; set; }
    }
}