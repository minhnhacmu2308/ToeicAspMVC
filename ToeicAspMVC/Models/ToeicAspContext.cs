using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;

namespace ToeicAspMVC.Models
{
    public class ToeicAspContext : DbContext
    {
        public ToeicAspContext() : base("DBConnectionString")
        {

        }
        public DbSet<User> users { get; set; }
        public DbSet<Role> roles { get; set; }

        public DbSet<Document> documents { get; set; }

        public DbSet<Target> targets { get; set; }
        public DbSet<MyTarget> myTargets { get; set; }
        public DbSet<Post> posts { get; set; }
        public DbSet<Product> products { get; set; }
        public DbSet<Course> courses { get; set; }

        public DbSet<Comment> comments { get; set; }

        public DbSet<Distance> distances { get; set; }

        public DbSet<UserProduct> userProducts { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {

            modelBuilder.Conventions.Remove<OneToManyCascadeDeleteConvention>();

        }
        public override int SaveChanges()
        {
            try
            {
                return base.SaveChanges();
            }
            catch (DbEntityValidationException ex)
            {
                string errorMessages = string.Join("; ", ex.EntityValidationErrors.SelectMany(x => x.ValidationErrors).Select(x => x.PropertyName + ": " + x.ErrorMessage));
                throw new DbEntityValidationException(errorMessages);
            }
        }
    }
}