using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ToeicAspMVC.Models;

namespace ToeicAspMVC.Daos
{
    public class CourseDao
    {
        ToeicAspContext myDb = new ToeicAspContext();

        public List<Course> GetCourses()
        {
            return myDb.courses.OrderByDescending(x => x.idCourse).ToList();
        }
        public List<Course> GetCoursesOrderByDescending(int top)
        {
            return myDb.courses.OrderByDescending(x => x.view).Take(top).ToList();
        }

        public List<Course> GetCourses(int top)
        {
            return myDb.courses.Take(top).ToList();
        }

        public Course GetCourse(int id)
        {
            return myDb.courses.FirstOrDefault(x => x.idCourse == id);
        }

        public void UpdateView(int id)
        {
            var obj = myDb.courses.FirstOrDefault(x => x.idCourse ==id);
            obj.view = obj.view + 1;
            myDb.SaveChanges();
        }
    }
}