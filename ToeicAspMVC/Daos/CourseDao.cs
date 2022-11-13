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

        public List<Course> GetAll()
        {
            return myDb.courses.ToList();
        }

        public Course GetDetail(int id)
        {
            return myDb.courses.FirstOrDefault(x => x.idCourse == id);
        }

        public void Add(Course course)
        {
            myDb.courses.Add(course);
            myDb.SaveChanges();
        }

        public void Update(Course course)
        {
            var obj = myDb.courses.FirstOrDefault(x => x.idCourse == course.idCourse);
            obj.name = course.name;
            obj.image = course.image;
            obj.description = course.description;
            myDb.SaveChanges();
        }
        public void Delete(int id)
        {
            var obj = myDb.courses.FirstOrDefault(x => x.idCourse == id);
            myDb.courses.Remove(obj);
            myDb.SaveChanges();
        }
    }
}