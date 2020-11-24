using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BussinessObject;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Data_Access_Layer
{
    public class ClassDa
    {
        ClassBo bo = new ClassBo();
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();

        public DataTable getPerson(int id, string code)
        {
            try
            {
                bo = new ClassBo();
                dt = new DataTable();
                con.ConnectionString = connStr;
                cmd = new SqlCommand(ClassBo.getPerson, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue(bo.P_id, id);
                cmd.Parameters.AddWithValue(bo.P_code, code == null ? DBNull.Value.ToString() : code);
                con.Open();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception ex)
            {
                con.Close();
                return null;
            }
        }

        public int deletePerson(int id)
        {
            int rowCount = 0;
            try
            {
                bo = new ClassBo();
                con.ConnectionString = connStr;
                cmd = new SqlCommand(ClassBo.deletePerson, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue(bo.P_id, id);
                con.Open();
                rowCount = cmd.ExecuteNonQuery();
                con.Close();
                return rowCount;

            }
            catch (Exception ex)
            {
                con.Close();
                return rowCount;
            }
        }

        public int savePerson(personList list)
        {
            int rowCount = 0;
            try
            {
                bo = new ClassBo();
                con.ConnectionString = connStr;
                cmd = new SqlCommand(ClassBo.insPerson, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue(bo.P_id, Convert.ToInt32(list.id));
                cmd.Parameters.AddWithValue(bo.P_code, list.code);
                cmd.Parameters.AddWithValue(bo.P_commonName, list.commonName);
                cmd.Parameters.AddWithValue(bo.P_givenName, list.givenName);
                cmd.Parameters.AddWithValue(bo.P_middleName, list.middleName);
                cmd.Parameters.AddWithValue(bo.P_gender, list.gender);
                if (list.dob == null)
                    cmd.Parameters.AddWithValue(bo.P_dob, DBNull.Value);
                else
                    cmd.Parameters.AddWithValue(bo.P_dob, list.dob);
                cmd.Parameters.AddWithValue(bo.P_address1, list.address1);
                cmd.Parameters.AddWithValue(bo.P_address2, list.address2);
                cmd.Parameters.AddWithValue(bo.P_city, list.city);
                cmd.Parameters.AddWithValue(bo.P_country, list.country);
                cmd.Parameters.AddWithValue(bo.P_zip, list.zip);
                cmd.Parameters.AddWithValue(bo.P_contactNumber, Convert.ToInt32(list.contactNumber));
                cmd.Parameters.AddWithValue(bo.P_email, list.email);
                cmd.Parameters.AddWithValue(bo.P_userName, list.userName);
                cmd.Parameters.AddWithValue(bo.P_password, list.password);
                cmd.Parameters.AddWithValue(bo.P_status, list.status);
                cmd.Parameters.AddWithValue(bo.P_By, 1);
                cmd.Parameters.AddWithValue(bo.P_CountryCode, Convert.ToInt32(list.CountryCode));
                con.Open();
                rowCount = cmd.ExecuteNonQuery();
                con.Close();
                return rowCount;

            }
            catch (Exception ex)
            {
                con.Close();
                return rowCount;
            }
        }

        public DataTable serchPerson(string code)
        {
            try
            {
                bo = new ClassBo();
                dt = new DataTable();
                con.ConnectionString = connStr;
                cmd = new SqlCommand(ClassBo.serchPerson, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue(bo.P_code, code == null ? DBNull.Value.ToString() : code);
                con.Open();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception ex)
            {
                con.Close();
                return null;
            }
        }

        public DataTable getLecturer(int id)
        {
            try
            {
                bo = new ClassBo();
                dt = new DataTable();
                con.ConnectionString = connStr;
                cmd = new SqlCommand(ClassBo.getLecturer, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue(bo.P_id, id);
                con.Open();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception ex)
            {
                con.Close();
                return null;
            }
        }

        public int deleteLecturer(int id)
        {
            int rowCount = 0;
            try
            {
                bo = new ClassBo();
                con.ConnectionString = connStr;
                cmd = new SqlCommand(ClassBo.deleteLecturer, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue(bo.P_id, id);
                con.Open();
                rowCount = cmd.ExecuteNonQuery();
                con.Close();
                return rowCount;

            }
            catch (Exception ex)
            {
                con.Close();
                return rowCount;
            }
        }

        public int saveLecturer(lecturerList list)
        {
            int rowCount = 0;
            try
            {
                bo = new ClassBo();
                con.ConnectionString = connStr;
                cmd = new SqlCommand(ClassBo.insLecturer, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue(bo.P_id, Convert.ToInt32(list.id));
                cmd.Parameters.AddWithValue(bo.P_universityID, list.universityID);
                cmd.Parameters.AddWithValue(bo.P_personalID, list.personalID);
                cmd.Parameters.AddWithValue(bo.P_position, list.position);
                cmd.Parameters.AddWithValue(bo.P_department, Convert.ToInt32(list.department));
                cmd.Parameters.AddWithValue(bo.P_description, list.description);
                cmd.Parameters.AddWithValue(bo.P_maximumLecturePerDay, Convert.ToInt32(list.maximumLecturePerDay));
                cmd.Parameters.AddWithValue(bo.P_maxLectureHoursPerDay, float.Parse(list.maxLectureHoursPerDay));
                cmd.Parameters.AddWithValue(bo.P_maximumLecturePerCycle, Convert.ToInt32(list.maximumLecturePerCycle));
                cmd.Parameters.AddWithValue(bo.P_qualification, list.qualification);
                cmd.Parameters.AddWithValue(bo.P_status, list.status);
                cmd.Parameters.AddWithValue(bo.P_By, 1);
                con.Open();
                rowCount = cmd.ExecuteNonQuery();
                con.Close();
                return rowCount;

            }
            catch (Exception ex)
            {
                con.Close();
                return rowCount;
            }
        }

        public DataTable selectLecturer()
        {
            try
            {
                bo = new ClassBo();
                dt = new DataTable();
                con.ConnectionString = connStr;
                cmd = new SqlCommand(ClassBo.selectLecturer, con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception ex)
            {
                con.Close();
                return null;
            }
        }

        public DataTable getCourse(int id, string code)
        {
            try
            {
                bo = new ClassBo();
                dt = new DataTable();
                con.ConnectionString = connStr;
                cmd = new SqlCommand(ClassBo.getCourse, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue(bo.P_id, id);
                cmd.Parameters.AddWithValue(bo.P_code, code == null ? DBNull.Value.ToString() : code);
                con.Open();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception ex)
            {
                con.Close();
                return null;
            }
        }

        public int deleteCourses(int id)
        {
            int rowCount = 0;
            try
            {
                bo = new ClassBo();
                con.ConnectionString = connStr;
                cmd = new SqlCommand(ClassBo.deleteCourses, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue(bo.P_id, id);
                con.Open();
                rowCount = cmd.ExecuteNonQuery();
                con.Close();
                return rowCount;

            }
            catch (Exception ex)
            {
                con.Close();
                return rowCount;
            }
        }

        public int saveCourses(coursesList list)
        {
            int rowCount = 0;
            try
            {
                bo = new ClassBo();
                con.ConnectionString = connStr;
                cmd = new SqlCommand(ClassBo.insCourses, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue(bo.P_id, Convert.ToInt32(list.id));
                cmd.Parameters.AddWithValue(bo.P_courseCode, list.courseCode);
                cmd.Parameters.AddWithValue(bo.P_name, list.name);
                cmd.Parameters.AddWithValue(bo.P_types, list.types);
                cmd.Parameters.AddWithValue(bo.P_ects, float.Parse(list.ects));
                
                cmd.Parameters.AddWithValue(bo.P_description, list.description);
                cmd.Parameters.AddWithValue(bo.P_labFlag, list.labFlag);
                cmd.Parameters.AddWithValue(bo.P_maximumHoursPerCycle, float.Parse(list.maximumHoursPerCycle));
                cmd.Parameters.AddWithValue(bo.P_maximumDaysPerCycle, Convert.ToInt32(list.maximumDaysPerCycle));
                cmd.Parameters.AddWithValue(bo.P_maximumEnrollment, Convert.ToInt32(list.maximumEnrollment));
                cmd.Parameters.AddWithValue(bo.P_maximumHoursPerDay, float.Parse(list.maximumHoursPerDay));
                if (list.startingDate == null)
                    cmd.Parameters.AddWithValue(bo.P_startingDate, DBNull.Value);
                else
                    cmd.Parameters.AddWithValue(bo.P_startingDate, list.startingDate);
                if (list.endingDate == null)
                    cmd.Parameters.AddWithValue(bo.P_endingDate, DBNull.Value);
                else
                    cmd.Parameters.AddWithValue(bo.P_endingDate, list.endingDate);
                
                cmd.Parameters.AddWithValue(bo.P_By, 1);
                cmd.Parameters.AddWithValue(bo.P_lcid, Convert.ToInt32(list.lcid));
                cmd.Parameters.AddWithValue(bo.P_coursesID, list.coursesID);
                cmd.Parameters.AddWithValue(bo.P_lectureID, list.lectureID);
                cmd.Parameters.AddWithValue(bo.P_colorCode, list.colorCode);
                cmd.Parameters.AddWithValue(bo.P_lcstatus, list.lcstatus);

                cmd.Parameters.AddWithValue("@department", Convert.ToInt32(list.department));
                cmd.Parameters.AddWithValue(bo.status, list.status);
                con.Open();
                rowCount = cmd.ExecuteNonQuery();
                con.Close();
                return rowCount;

            }
            catch (Exception ex)
            {
                con.Close();
                return rowCount;
            }
        }

        public DataTable selectCourse()
        {
            try
            {
                bo = new ClassBo();
                dt = new DataTable();
                con.ConnectionString = connStr;
                cmd = new SqlCommand(ClassBo.selectCourse, con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception ex)
            {
                con.Close();
                return null;
            }
        }

        public DataTable selectedCourse(int id)
        {
            try
            {
                bo = new ClassBo();
                dt = new DataTable();
                con.ConnectionString = connStr;
                cmd = new SqlCommand(ClassBo.selectedCourse, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue(bo.P_id, id);
                con.Open();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception ex)
            {
                con.Close();
                return null;
            }
        }

        public DataTable getHour(int id, int day)
        {
            try
            {
                bo = new ClassBo();
                dt = new DataTable();
                con.ConnectionString = connStr;
                cmd = new SqlCommand(ClassBo.getHour, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue(bo.P_id, id);
                cmd.Parameters.AddWithValue(bo.P_day, day);
                con.Open();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception ex)
            {
                con.Close();
                return null;
            }
        }

        public DataTable getTimeSlot(int id)
        {
            try
            {
                bo = new ClassBo();
                dt = new DataTable();
                con.ConnectionString = connStr;
                cmd = new SqlCommand(ClassBo.getTimeSlot, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue(bo.P_id, id);
                con.Open();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception ex)
            {
                con.Close();
                return null;
            }
        }

        public DataTable checkTimeSlot(timeSlotList list)
        {
            try
            {
                bo = new ClassBo();
                dt = new DataTable();
                con.ConnectionString = connStr;
                cmd = new SqlCommand(ClassBo.checkTimeSlot, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue(bo.P_id, list.id);
                cmd.Parameters.AddWithValue(bo.P_day, list.day);
                cmd.Parameters.AddWithValue(bo.P_timeFrom, list.timeFrom);
                cmd.Parameters.AddWithValue(bo.P_timeTo, list.timeTo);
                con.Open();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception ex)
            {
                con.Close();
                return null;
            }
        }

        public int saveTimeSlot(timeSlotList list)
        {
            int rowCount = 0;
            try
            {
                bo = new ClassBo();
                con.ConnectionString = connStr;
                cmd = new SqlCommand(ClassBo.insTimeSlot, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue(bo.P_id, Convert.ToInt32(list.id));
                cmd.Parameters.AddWithValue(bo.P_lecturerToCoursesdId, list.lecturerToCoursesdId);
                cmd.Parameters.AddWithValue(bo.P_timeFrom, list.timeFrom);
                cmd.Parameters.AddWithValue(bo.P_timeTo, list.timeTo);
                cmd.Parameters.AddWithValue(bo.P_room, list.room);
                cmd.Parameters.AddWithValue(bo.P_day, list.day);                
                cmd.Parameters.AddWithValue(bo.status, list.status);
                cmd.Parameters.AddWithValue(bo.P_By, 1);
                con.Open();
                rowCount = cmd.ExecuteNonQuery();
                con.Close();
                return rowCount;
            }
            catch (Exception ex)
            {
                con.Close();
                return rowCount;
            }
        }

        public DataTable getTimeTable()
        {
            try
            {
                bo = new ClassBo();
                dt = new DataTable();
                con.ConnectionString = connStr;
                cmd = new SqlCommand(ClassBo.getTimeTable, con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception ex)
            {
                con.Close();
                return null;
            }
        }
    }
}
