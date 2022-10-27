namespace ToeicAspMVC.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class newa : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Courses", "view", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Courses", "view");
        }
    }
}
