namespace ToeicAspMVC.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class _new : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Comments",
                c => new
                    {
                        idComment = c.Int(nullable: false, identity: true),
                        content = c.String(),
                        status = c.Int(nullable: false),
                        parent = c.Int(nullable: false),
                        idUser = c.Int(nullable: false),
                        idPost = c.Int(nullable: false),
                        created = c.String(),
                    })
                .PrimaryKey(t => t.idComment)
                .ForeignKey("dbo.Posts", t => t.idPost)
                .ForeignKey("dbo.Users", t => t.idUser)
                .Index(t => t.idUser)
                .Index(t => t.idPost);
            
            CreateTable(
                "dbo.Posts",
                c => new
                    {
                        idPost = c.Int(nullable: false, identity: true),
                        title = c.String(nullable: false, maxLength: 255),
                        image = c.String(),
                        content = c.String(),
                        status = c.Int(nullable: false),
                        idUser = c.Int(nullable: false),
                        created = c.String(),
                    })
                .PrimaryKey(t => t.idPost)
                .ForeignKey("dbo.Users", t => t.idUser)
                .Index(t => t.idUser);
            
            CreateTable(
                "dbo.Users",
                c => new
                    {
                        idUser = c.Int(nullable: false, identity: true),
                        email = c.String(nullable: false, maxLength: 255),
                        fullName = c.String(nullable: false, maxLength: 255),
                        password = c.String(nullable: false, maxLength: 255),
                        phoneNumber = c.String(maxLength: 255),
                        point = c.Int(nullable: false),
                        status = c.Int(nullable: false),
                        idRole = c.Int(nullable: false),
                        created = c.String(),
                    })
                .PrimaryKey(t => t.idUser)
                .ForeignKey("dbo.Roles", t => t.idRole)
                .Index(t => t.idRole);
            
            CreateTable(
                "dbo.Documents",
                c => new
                    {
                        idDocument = c.Int(nullable: false, identity: true),
                        name = c.String(nullable: false, maxLength: 255),
                        image = c.String(),
                        fileName = c.String(),
                        content = c.String(),
                        status = c.Int(nullable: false),
                        idUser = c.Int(nullable: false),
                        created = c.String(),
                    })
                .PrimaryKey(t => t.idDocument)
                .ForeignKey("dbo.Users", t => t.idUser)
                .Index(t => t.idUser);
            
            CreateTable(
                "dbo.MyTargets",
                c => new
                    {
                        idMyTarget = c.Int(nullable: false, identity: true),
                        name = c.String(nullable: false, maxLength: 255),
                        deadline = c.String(),
                        content = c.String(),
                        status = c.Int(nullable: false),
                        idUser = c.Int(nullable: false),
                        idTarget = c.Int(nullable: false),
                        created = c.String(),
                    })
                .PrimaryKey(t => t.idMyTarget)
                .ForeignKey("dbo.Targets", t => t.idTarget)
                .ForeignKey("dbo.Users", t => t.idUser)
                .Index(t => t.idUser)
                .Index(t => t.idTarget);
            
            CreateTable(
                "dbo.Targets",
                c => new
                    {
                        idTarget = c.Int(nullable: false, identity: true),
                        name = c.String(nullable: false, maxLength: 255),
                        point = c.Int(nullable: false),
                        status = c.Int(nullable: false),
                        created = c.String(),
                    })
                .PrimaryKey(t => t.idTarget);
            
            CreateTable(
                "dbo.Roles",
                c => new
                    {
                        idRole = c.Int(nullable: false, identity: true),
                        name = c.String(nullable: false, maxLength: 255),
                    })
                .PrimaryKey(t => t.idRole);
            
            CreateTable(
                "dbo.Courses",
                c => new
                    {
                        idCourse = c.Int(nullable: false, identity: true),
                        name = c.String(nullable: false, maxLength: 255),
                        image = c.String(nullable: false, maxLength: 255),
                        description = c.String(),
                        status = c.Int(nullable: false),
                        created = c.String(),
                    })
                .PrimaryKey(t => t.idCourse);
            
            CreateTable(
                "dbo.Distances",
                c => new
                    {
                        idDistance = c.Int(nullable: false, identity: true),
                        fromPoint = c.Int(nullable: false),
                        point = c.Int(nullable: false),
                        description = c.String(),
                        status = c.Int(nullable: false),
                        created = c.String(),
                    })
                .PrimaryKey(t => t.idDistance);
            
            CreateTable(
                "dbo.Products",
                c => new
                    {
                        idProduct = c.Int(nullable: false, identity: true),
                        name = c.String(nullable: false, maxLength: 255),
                        image = c.String(maxLength: 255),
                        point = c.Int(nullable: false),
                        status = c.Int(nullable: false),
                        created = c.String(),
                    })
                .PrimaryKey(t => t.idProduct);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Users", "idRole", "dbo.Roles");
            DropForeignKey("dbo.Posts", "idUser", "dbo.Users");
            DropForeignKey("dbo.MyTargets", "idUser", "dbo.Users");
            DropForeignKey("dbo.MyTargets", "idTarget", "dbo.Targets");
            DropForeignKey("dbo.Documents", "idUser", "dbo.Users");
            DropForeignKey("dbo.Comments", "idUser", "dbo.Users");
            DropForeignKey("dbo.Comments", "idPost", "dbo.Posts");
            DropIndex("dbo.MyTargets", new[] { "idTarget" });
            DropIndex("dbo.MyTargets", new[] { "idUser" });
            DropIndex("dbo.Documents", new[] { "idUser" });
            DropIndex("dbo.Users", new[] { "idRole" });
            DropIndex("dbo.Posts", new[] { "idUser" });
            DropIndex("dbo.Comments", new[] { "idPost" });
            DropIndex("dbo.Comments", new[] { "idUser" });
            DropTable("dbo.Products");
            DropTable("dbo.Distances");
            DropTable("dbo.Courses");
            DropTable("dbo.Roles");
            DropTable("dbo.Targets");
            DropTable("dbo.MyTargets");
            DropTable("dbo.Documents");
            DropTable("dbo.Users");
            DropTable("dbo.Posts");
            DropTable("dbo.Comments");
        }
    }
}
