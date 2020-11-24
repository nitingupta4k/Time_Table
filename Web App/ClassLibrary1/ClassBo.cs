using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BussinessObject
{
    public class ClassBo
    {
        public string id = "id";
        public string code = "code";
        public string commonName = "commonName";
        public string givenName = "givenName";
        public string middleName = "middleName";
        public string gender = "gender";
        public string Dob = "dob";
        public string address1 = "address1";
        public string address2 = "address2";
        public string city = "city";
        public string country = "country";
        public string zip = "zip";
        public string contactNumber = "contactNumber";
        public string email = "email";
        public string userName = "userName";
        public string password = "password";
        public string status = "status";
        public string createdBy = "createdBy";
        public string createdDate = "createdDate";
        public string modifiedBy = "modifiedBy";
        public string modifiedDate = "modifiedDate";
        public string CountryCode = "CountryCode";
        public string universityID = "universityID";
        public string personalID = "personalID";
        public string position = "position";
        public string department = "department";
        public string description = "description";
        public string maximumLecturePerDay = "maximumLecturePerDay";
        public string maxLectureHoursPerDay = "maxLectureHoursPerDay";
        public string maximumLecturePerCycle = "maximumLecturePerCycle";
        public string qualification = "qualification";
        public string courseCode = "courseCode";
        public string name = "name";
        public string types = "types";
        public string ects = "ects";
        public string labFlag = "labFlag";
        public string maximumHoursPerCycle = "maximumHoursPerCycle";
        public string maximumDaysPerCycle = "maximumDaysPerCycle";
        public string maximumEnrollment = "maximumEnrollment";
        public string maximumHoursPerDay = "maximumHoursPerDay";
        public string startingDate = "startingDate";
        public string endingDate = "endingDate";
        public string lcid = "lcid";
        public string coursesID = "coursesID";
        public string lectureID = "lectureID";
        public string colorCode = "colorCode";
        public string lcstatus = "lcstatus";
        public string day = "day";
        public string lecturerToCoursesdId = "lecturerToCoursesdId";
        public string timeFrom = "timeFrom";
        public string timeTo = "timeTo";
        public string room = "room";



        //Procedures
        public static string getPerson = "SP_getPerson";
        public static string deletePerson = "SP_deletePerson";
        public static string insPerson = "SP_InsertorUpdatePerson";
        public static string serchPerson = "SP_getPersonSearch";
        public static string getLecturer = "SP_getLecturer";
        public static string deleteLecturer = "SP_deleteLecturer";
        public static string insLecturer = "SP_InsertorUpdateLecturer";
        public static string selectLecturer = "SP_getLecturerSelect";
        public static string getCourse = "SP_getCourse";
        public static string deleteCourses = "SP_deleteCourses";
        public static string insCourses = "SP_InsertorUpdateCourses";
        public static string selectCourse = "SP_getCourseSelect";
        public static string selectedCourse = "SP_getCourseSelectDetail";
        public static string getHour = "SP_getHour";
        public static string getTimeSlot = "SP_getTimeSlot";
        public static string checkTimeSlot = "SP_checkTimeSlot";
        public static string insTimeSlot = "SP_InsertorUpdateTimeSlot";
        public static string getTimeTable = "SP_getTimeTable"; 


        //Parameters
        public string P_id = "@id";
        public string P_code = "@code";
        public string P_commonName = "@commonName";
        public string P_givenName = "@givenName";
        public string P_middleName = "@middleName";
        public string P_gender = "@gender";
        public string P_dob = "@dob";
        public string P_address1 = "@address1 ";
        public string P_address2 = "@address2 ";
        public string P_city = "@city ";
        public string P_country = "@country ";
        public string P_zip = "@zip ";
        public string P_contactNumber = "@contactNumber";
        public string P_email = "@email ";
        public string P_userName = "@userName ";
        public string P_password = "@password ";
        public string P_status = "@status ";
        public string P_By = "@By";
        public string P_CountryCode = "@CountryCode";
        public string P_universityID = "@universityID";
        public string P_personalID = "@personalID";
        public string P_position = "@position";
        public string P_department = "@department";
        public string P_description = "@description";
        public string P_maximumLecturePerDay = "@maximumLecturePerDay";
        public string P_maxLectureHoursPerDay = "@maxLectureHoursPerDay";
        public string P_maximumLecturePerCycle = "@maximumLecturePerCycle";
        public string P_qualification = "@qualification";
        public string P_courseCode = "@courseCode";
        public string P_name = "@name";
        public string P_types = "@types";
        public string P_ects = "@ects";
        public string P_labFlag = "@labFlag";
        public string P_maximumHoursPerCycle = "@maximumHoursPerCycle";
        public string P_maximumDaysPerCycle = "@maximumDaysPerCycle";
        public string P_maximumEnrollment = "@maximumEnrollment";
        public string P_maximumHoursPerDay = "@maximumHoursPerDay";
        public string P_startingDate = "@startingDate";
        public string P_endingDate = "@endingDate";
        public string P_lcid = "@lcid";
        public string P_coursesID = "@coursesID";
        public string P_lectureID = "@lectureID";
        public string P_colorCode = "@colorCode";
        public string P_lcstatus = "@lcstatus";
        public string P_day = "@day";
        public string P_lecturerToCoursesdId = "@lecturerToCoursesdId";
        public string P_timeFrom = "@timeFrom";
        public string P_timeTo = "@timeTo";
        public string P_room = "@room";




    }

    //Lists

    public class timeSlotList
    {
        public string id { get; set; }
        public string lecturerToCoursesdId { get; set; }
        public string day { get; set; }
        public string dayName { get; set; }
        public string timeFrom { get; set; }
        public string timeTo { get; set; }
        public string room { get; set; }
        public string coursesID { get; set; }
        public string coursesName { get; set; }
        public string commonName { get; set; }
        public string status { get; set; }
        public string By { get; set; }
    }

    public class personList
    {
        public string id { get; set; }
        public string code { get; set; }
        public string commonName { get; set; }
        public string givenName { get; set; }
        public string middleName { get; set; }
        public string gender { get; set; }
        public string dob { get; set; }
        public string address1 { get; set; }
        public string address2 { get; set; }
        public string city { get; set; }
        public string country { get; set; }
        public string zip { get; set; }
        public string contactNumber { get; set; }
        public string email { get; set; }
        public string userName { get; set; }
        public string password { get; set; }
        public string status { get; set; }
        public string By { get; set; }
        public string CountryCode { get; set; }
    }

    public class lecturerList
    {
        public string id { get; set; }
        public string universityID { get; set; }
        public string personalID { get; set; }
        public string personalCode { get; set; }
        public string position { get; set; }
        public string department { get; set; }
        public string description { get; set; }
        public string maximumLecturePerDay { get; set; }
        public string maxLectureHoursPerDay { get; set; }
        public string maximumLecturePerCycle { get; set; }
        public string qualification { get; set; }
        public string status { get; set; }
        public string By { get; set; }
    }

    public class coursesList
    {
        public string id { get; set; }
        public string courseCode { get; set; }
        public string name { get; set; }
        public string types { get; set; }
        public string ects { get; set; }
        public string department { get; set; }
        public string labFlag { get; set; }
        public string maximumHoursPerCycle { get; set; }
        public string maximumDaysPerCycle { get; set; }
        public string maximumEnrollment { get; set; }
        public string maximumHoursPerDay { get; set; }
        public string description { get; set; }
        public string startingDate { get; set; }
        public string endingDate { get; set; }
        public string status { get; set; }
        public string By { get; set; }

        public string lcid { get; set; }
        public string coursesID { get; set; }
        public string lectureID { get; set; }
        public string colorCode { get; set; }
        public string lcstatus { get; set; }
    }

    public class timeTableList
    {
        public string Day { get; set; }
        public string dayName { get; set; }
        public string timeFrom { get; set; }
        public string timeTo { get; set; }
        public string colorCode { get; set; }        
        public string room { get; set; }
        public string courseCode { get; set; }
        public string coursesName { get; set; }
        public string ects { get; set; }
        public string types { get; set; }
        public string commonName { get; set; }
        public string givenName { get; set; }
        public string middleName { get; set; }
        public string contactNumber { get; set; }
        public string email { get; set; }
    }

}
