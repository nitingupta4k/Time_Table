using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BussinessLogic;
using BussinessObject;

namespace Time_Table
{
    public partial class index : System.Web.UI.Page
    {
        ClassBo bo = new ClassBo();
        ClassBl bl = new ClassBl();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public List<lecturerList> selectLecturer()
        {
            bl = new ClassBl();
            return bl.selectLecturer();
        }

        public List<coursesList> getCourse(int id)
        {
            bl = new ClassBl();
            return bl.getCourse(id, DBNull.Value.ToString());
        }

        public int deleteCourses(int id)
        {
            bl = new ClassBl();
            return bl.deleteCourses(id);
        }
        
        public int saveCourses(coursesList list)
        {
            bl = new ClassBl();
            return bl.saveCourses(list);
        }

        [System.Web.Services.WebMethod]
        public static List<lecturerList> webselectLecturer()
        {
            index cl = new index();
            return cl.selectLecturer();
        }

        [System.Web.Services.WebMethod]
        public static List<coursesList> webgetCourse(int id)
        {
            index cl = new index();
            return cl.getCourse(id);
        }

        [System.Web.Services.WebMethod]
        public static int webdeleteCourses(int id)
        {
            index cl = new index();
            return cl.deleteCourses(id);
        }

        [System.Web.Services.WebMethod]
        public static int websaveCourses(coursesList list)
        {
            index cl = new index();
            return cl.saveCourses(list);
        }
    }
}