namespace ToeicAspMVC.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class addtable : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.UserProducts",
                c => new
                    {
                        idUserProduct = c.Int(nullable: false, identity: true),
                        note = c.String(),
                        status = c.Int(nullable: false),
                        idUser = c.Int(nullable: false),
                        idProduct = c.Int(nullable: false),
                        created = c.String(),
                    })
                .PrimaryKey(t => t.idUserProduct)
                .ForeignKey("dbo.Products", t => t.idProduct)
                .ForeignKey("dbo.Users", t => t.idUser)
                .Index(t => t.idUser)
                .Index(t => t.idProduct);
            
            AddColumn("dbo.Users", "isTest", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.UserProducts", "idUser", "dbo.Users");
            DropForeignKey("dbo.UserProducts", "idProduct", "dbo.Products");
            DropIndex("dbo.UserProducts", new[] { "idProduct" });
            DropIndex("dbo.UserProducts", new[] { "idUser" });
            DropColumn("dbo.Users", "isTest");
            DropTable("dbo.UserProducts");
        }
    }
}
