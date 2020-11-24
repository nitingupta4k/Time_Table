using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BussinessObject;
using System.Data;
using Data_Access_Layer;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.IO;

namespace BussinessLogic
{
    public class ClassBl
    {
        
        ClassDa da = new ClassDa();
        DataTable dt = new DataTable();
        ClassBo bo = new ClassBo();

        
        
        public List<personList> getPerson(int id, string code)
        {
            bo = new ClassBo();
            dt = new DataTable();
            dt = da.getPerson(id, code);
            List<personList> list = new List<personList>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    personList itlist = new personList();
                    itlist.id = dr[bo.id].ToString();
                    itlist.code = dr[bo.code].ToString();
                    itlist.commonName = dr[bo.commonName].ToString();
                    itlist.givenName = dr[bo.givenName].ToString();
                    itlist.middleName = dr[bo.middleName].ToString();
                    itlist.contactNumber = dr[bo.contactNumber].ToString();
                    itlist.email = dr[bo.email].ToString();
                    itlist.status = dr[bo.status].ToString() == "I" ? "Inactive" : "Active";
                    itlist.gender = dr[bo.gender].ToString();
                    itlist.address1 = dr[bo.address1].ToString();
                    itlist.address2 = dr[bo.address2].ToString();
                    itlist.city = dr[bo.city].ToString();
                    itlist.country = dr[bo.country].ToString();
                    itlist.zip = dr[bo.zip].ToString();
                    itlist.dob = dr[bo.Dob].ToString().Length > 0 ? DateTime.Parse(dr[bo.Dob].ToString()).ToString("MM/dd/yyyy") : null;
                    itlist.CountryCode = dr[bo.CountryCode].ToString();
                    list.Add(itlist);
                }

            }
            return list;
        }

        public int deletePerson(int id)
        {
            return da.deletePerson(id);
        }

        public int savePerson(personList list)
        {
            return da.savePerson(list);
        }

        public List<personList> serchPerson(string code)
        {
            bo = new ClassBo();
            dt = new DataTable();
            dt = da.serchPerson(code);
            List<personList> list = new List<personList>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    personList itlist = new personList();
                    itlist.id = dr[bo.id].ToString();
                    itlist.code = dr[bo.code].ToString();
                    itlist.commonName = dr[bo.commonName].ToString();
                    itlist.givenName = dr[bo.givenName].ToString();
                    itlist.middleName = dr[bo.middleName].ToString();
                    list.Add(itlist);
                }

            }
            return list;
        }

        public List<lecturerList> getLecturer(int id)
        {
            bo = new ClassBo();
            dt = new DataTable();
            dt = da.getLecturer(id);
            List<lecturerList> list = new List<lecturerList>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    lecturerList itlist = new lecturerList();
                    itlist.id = dr[bo.id].ToString();
                    itlist.universityID = dr[bo.universityID].ToString();
                    itlist.personalID = dr[bo.personalID].ToString();
                    itlist.personalCode = dr[bo.code].ToString();
                    itlist.position = dr[bo.position].ToString();
                    itlist.department = dr[bo.department].ToString();
                    itlist.description = dr[bo.description].ToString();
                    itlist.maximumLecturePerDay = dr[bo.maximumLecturePerDay].ToString();
                    itlist.maxLectureHoursPerDay = dr[bo.maxLectureHoursPerDay].ToString();
                    itlist.maximumLecturePerCycle = dr[bo.maximumLecturePerCycle].ToString();
                    itlist.qualification = dr[bo.qualification].ToString();
                    itlist.status = dr[bo.status].ToString() == "I" ? "Inactive" : "Active";
                    list.Add(itlist);
                }

            }
            return list;
        }

        public int deleteLecturer(int id)
        {
            return da.deleteLecturer(id);
        }

        public int saveLecturer(lecturerList list)
        {
            return da.saveLecturer(list);
        }

        public List<lecturerList> selectLecturer()
        {
            bo = new ClassBo();
            dt = new DataTable();
            dt = da.selectLecturer();
            List<lecturerList> list = new List<lecturerList>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    lecturerList itlist = new lecturerList();
                    itlist.id = dr[bo.id].ToString();
                    itlist.universityID = dr[bo.universityID].ToString();
                    itlist.personalID = dr[bo.commonName].ToString();
                    list.Add(itlist);
                }

            }
            return list;
        }

        public List<coursesList> getCourse(int id, string code)
        {
            bo = new ClassBo();
            dt = new DataTable();
            dt = da.getCourse(id, code);
            List<coursesList> list = new List<coursesList>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    coursesList itlist = new coursesList();
                    itlist.id = dr[bo.id].ToString();
                    itlist.courseCode = dr[bo.courseCode].ToString();
                    itlist.name = dr[bo.name].ToString();
                    itlist.types = dr[bo.types].ToString();
                    itlist.ects = dr[bo.ects].ToString();
                    itlist.department = dr[bo.department].ToString();
                    itlist.labFlag = dr[bo.labFlag].ToString();
                    itlist.maximumHoursPerCycle = dr[bo.maximumHoursPerCycle].ToString();
                    itlist.maximumDaysPerCycle = dr[bo.maximumDaysPerCycle].ToString();
                    itlist.maximumEnrollment = dr[bo.maximumEnrollment].ToString();
                    itlist.maximumHoursPerDay = dr[bo.maximumHoursPerDay].ToString();
                    itlist.description = dr[bo.description].ToString();
                    itlist.startingDate = dr[bo.startingDate].ToString().Length > 0 ? DateTime.Parse(dr[bo.startingDate].ToString()).ToString("MM/dd/yyyy") : null;
                    itlist.endingDate = dr[bo.endingDate].ToString().Length > 0 ? DateTime.Parse(dr[bo.endingDate].ToString()).ToString("MM/dd/yyyy") : null;
                    itlist.status = dr[bo.status].ToString() == "I" ? "Inactive" : "Active";
                    itlist.lcid = dr[bo.lcid].ToString();
                    itlist.coursesID = dr[bo.coursesID].ToString();
                    itlist.lectureID = dr[bo.lectureID].ToString();
                    itlist.colorCode = dr[bo.colorCode].ToString();
                    itlist.lcstatus = dr[bo.lcstatus].ToString() == "I" ? "Inactive" : "Active"; 
                    list.Add(itlist);
                }

            }
            return list;
        }

        public int deleteCourses(int id)
        {
            return da.deleteCourses(id);
        }

        public int saveCourses(coursesList list)
        {
            return da.saveCourses(list);
        }

        public List<coursesList> selectCourse()
        {
            bo = new ClassBo();
            dt = new DataTable();
            dt = da.selectCourse();
            List<coursesList> list = new List<coursesList>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    coursesList itlist = new coursesList();
                    itlist.id = dr[bo.id].ToString();
                    itlist.courseCode = dr[bo.courseCode].ToString();
                    list.Add(itlist);
                }

            }
            return list;
        }

        public List<coursesList> selectedCourse(int id)
        {
            bo = new ClassBo();
            dt = new DataTable();
            dt = da.selectedCourse(id);
            List<coursesList> list = new List<coursesList>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    coursesList itlist = new coursesList();
                    itlist.id = dr[bo.id].ToString();
                    itlist.courseCode = dr[bo.courseCode].ToString();
                    itlist.maximumDaysPerCycle = dr[bo.maximumDaysPerCycle].ToString();
                    itlist.maximumHoursPerCycle = dr[bo.maximumHoursPerCycle].ToString();
                    itlist.maximumHoursPerDay = dr[bo.maximumHoursPerDay].ToString();
                    itlist.lcid = dr[bo.lcid].ToString();
                    itlist.name = dr[bo.commonName].ToString();
                    list.Add(itlist);
                }

            }
            return list;
        }

        public string getHour(int id, int day)
        {
            dt = new DataTable();
            string diff = "00:00"; ;
            dt=da.getHour(id,day);
            if (dt.Rows.Count > 0)
            {
                diff = DateTime.Parse(dt.Rows[0][2].ToString()).ToString("HH:mm");
            }
            return diff;
        }
                       
    }
}

