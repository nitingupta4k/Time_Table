using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BussinessObject;
using BussinessLogic;
using System.Xml.Linq;

namespace Time_Table
{
    public partial class person : System.Web.UI.Page
    {
        ClassBo bo = new ClassBo();
        ClassBl bl = new ClassBl();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public int deletePerson(int id)
        {
            bl = new ClassBl();
            return bl.deletePerson(id);
        }

        public List<personList> getPerson(int id)
        {
            bl = new ClassBl();
            return bl.getPerson(id,null);
        }


        public int savePerson(personList list)
        {
            bl = new ClassBl();
            return bl.savePerson(list);
        }

        [System.Web.Services.WebMethod]
        public static List<personList> webgetPerson(int id)
        {
            person cl = new person();
            return cl.getPerson(id);
        }

        [System.Web.Services.WebMethod]
        public static int webdeletePerson(int id)
        {
            person cl = new person();
            return cl.deletePerson(id);
        }

        [System.Web.Services.WebMethod]
        public static int websavePerson(personList list)
        {
            person cl = new person();
            return cl.savePerson(list);
        }


    }
}