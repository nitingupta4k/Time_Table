using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BussinessLogic;
using BussinessObject;
using Data_Access_Layer;
using System.Data;

namespace Time_Table
{
    public partial class timeslot : System.Web.UI.Page
    {
        ClassBo bo = new ClassBo();
        ClassBl bl = new ClassBl();
        ClassDa da = new ClassDa();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public List<coursesList> selectCourse()
        {
            bl = new ClassBl();
            return bl.selectCourse();
        }

        public List<coursesList> selectedCourse(int id)
        {
            bl = new ClassBl();
            return bl.selectedCourse(id);
        }

        public string getHour(int id,int day)
        {
            bl = new ClassBl();
            return bl.getHour(id,day);
        }

        public List<timeSlotList> getTimeSlot(int id)
        {
            bl = new ClassBl();
            bo = new ClassBo();
            dt = new DataTable();
            dt = da.getTimeSlot(id);
            List<timeSlotList> list = new List<timeSlotList>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    timeSlotList itlist = new timeSlotList();
                    itlist.id = dr[bo.id].ToString();
                    itlist.lecturerToCoursesdId = dr[bo.lecturerToCoursesdId].ToString();
                    itlist.day = dr[bo.day].ToString();
                    itlist.timeFrom = dr[bo.timeFrom].ToString();
                    itlist.timeTo = dr[bo.timeTo].ToString();
                    itlist.room = dr[bo.room].ToString();
                    itlist.coursesID = dr[bo.coursesID].ToString();
                    itlist.coursesName = dr[bo.name].ToString();
                    itlist.commonName = dr[bo.commonName].ToString();
                    itlist.status = dr[bo.status].ToString() == "I" ? "Inactive" : "Active";
                    switch (dr[bo.day].ToString())
                    {
                        case "1":
                            itlist.dayName = "Monday";
                            break; 
                        case "2":
                            itlist.dayName = "Tuesday";
                            break;                                                                     
                        case "3":
                            itlist.dayName = "Wednesday"; 
                            break;                                                                    
                        case "4":
                            itlist.dayName = "Thursday";
                            break;
                        case "5":
                            itlist.dayName = "Friday";
                            break;
                        default:
                            break;
                    }

                    list.Add(itlist);
                }

            }
            return list;
        }

        public int saveTimeSlot(timeSlotList list)
        {
            bl = new ClassBl();
            da = new ClassDa();
            dt = new DataTable();
            dt = da.checkTimeSlot(list);
            if (dt.Rows.Count > 0)
                return 2;
            else
                return da.saveTimeSlot(list); 
        }

        [System.Web.Services.WebMethod]
        public static List<coursesList> webselectCourse()
        {
            timeslot cl = new timeslot();
            return cl.selectCourse();
        }

        [System.Web.Services.WebMethod]
        public static List<coursesList> webselectedCourse(int id)
        {
            timeslot cl = new timeslot();
            return cl.selectedCourse(id);
        }

        [System.Web.Services.WebMethod]
        public static string webgetHour(int id,int day)
        {
            timeslot cl = new timeslot();
            return cl.getHour(id,day);
        }

        [System.Web.Services.WebMethod]
        public static List<timeSlotList> webgetTimeSlot(int id)
        {
            timeslot cl = new timeslot();
            return cl.getTimeSlot(id);
        }

        [System.Web.Services.WebMethod]
        public static int websaveTimeSlot(timeSlotList list)
        {
            timeslot cl = new timeslot();
            return cl.saveTimeSlot(list);
        }

    }
}