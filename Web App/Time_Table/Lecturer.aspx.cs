using BussinessLogic;
using BussinessObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Time_Table.webServicePerson;

namespace Time_Table
{
    public partial class Lecturer : System.Web.UI.Page
    {
        ClassBo bo = new ClassBo();
        ClassBl bl = new ClassBl();
        BasicHttpBinding_IfirstWebService Sref = new BasicHttpBinding_IfirstWebService();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public List<BussinessObject.personList> serchPerson(string code)
        {
            Sref = new BasicHttpBinding_IfirstWebService();
            webServicePerson.personList[] itlist = Sref.Message(code);
            List<BussinessObject.personList> lists = new List<BussinessObject.personList>();
            for (int i = 0; i < itlist.Length; i++)
            {
                BussinessObject.personList list=new BussinessObject.personList();
                list.id = itlist[i].id;
                list.code = itlist[i].code;
                list.commonName = itlist[i].commonName;
                list.middleName = itlist[i].middleName;
                list.givenName  = itlist[i].givenName;
                lists.Add(list);
            }

                return lists;
        }


        public int deleteLecturer(int id)
        {
            bl = new ClassBl();
            return bl.deleteLecturer(id);
        }

        public List<lecturerList> getLecturer(int id)
        {
            bl = new ClassBl();
            return bl.getLecturer(id);
        }

        public int saveLecturer(lecturerList list)
        {
            bl = new ClassBl();
            return bl.saveLecturer(list);
        }


        [System.Web.Services.WebMethod]
        public static List<BussinessObject.personList> webserchPerson(string code)
        {
            Lecturer cl = new Lecturer();
            return cl.serchPerson(code);
        }

        [System.Web.Services.WebMethod]
        public static List<lecturerList> webgetLecturer(int id)
        {
            Lecturer cl = new Lecturer();
            return cl.getLecturer(id);
        }

        [System.Web.Services.WebMethod]
        public static int webdeleteLecturer(int id)
        {
            Lecturer cl = new Lecturer();
            return cl.deleteLecturer(id);
        }

        [System.Web.Services.WebMethod]
        public static int websaveLecturer(lecturerList list)
        {
            Lecturer cl = new Lecturer();
            return cl.saveLecturer(list);
        }


    }
}