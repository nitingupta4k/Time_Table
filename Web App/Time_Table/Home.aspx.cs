using BussinessObject;
using Data_Access_Layer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Time_Table
{
    public partial class Home : System.Web.UI.Page
    {
        ClassBo bo = new ClassBo();
        ClassDa da = new ClassDa();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public List<timeTableList> getTimeTable()
        {
            bo = new ClassBo();
            dt = new DataTable();
            dt = da.getTimeTable();
            List<timeTableList> list = new List<timeTableList>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    timeTableList itlist = new timeTableList();
                    itlist.timeFrom = dr[bo.timeFrom].ToString().Substring(0,5);
                    itlist.timeTo = dr[bo.timeTo].ToString().Substring(0, 5);
                    itlist.room = dr[bo.room].ToString();
                    itlist.Day = dr[bo.day].ToString();
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
                    itlist.colorCode = dr[bo.colorCode].ToString(); 
                    itlist.courseCode = dr[bo.courseCode].ToString();
                    itlist.coursesName = dr[bo.name].ToString();                    
                    itlist.ects = dr[bo.ects].ToString();
                    itlist.givenName = dr[bo.givenName].ToString();
                    itlist.commonName = dr[bo.commonName].ToString();
                    itlist.middleName = dr[bo.middleName].ToString();
                    itlist.contactNumber = dr[bo.contactNumber].ToString();
                    itlist.email = dr[bo.email].ToString();
                    list.Add(itlist);
                }

            }
            return list;
        }


        [System.Web.Services.WebMethod]
        public static List<timeTableList> webgetTimeTable()
        {
            Home cl = new Home();
            return cl.getTimeTable();
        }

    }
}