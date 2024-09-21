using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Facun2._0
{
    public partial class SeleccionRegistro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistroAlumno.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistroProfesor.aspx");
        }
    }
}