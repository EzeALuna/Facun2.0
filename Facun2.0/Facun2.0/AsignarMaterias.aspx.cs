using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Facun2._0
{
    public partial class AsignarMaterias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // if (!Page.IsPostBack)
            //{


            //    // Verifica el usuario 
            //    if (Session["DNI"] == null || string.IsNullOrEmpty(Session["Usuario"].ToString()))
            //    {
            //        // Si no hay sesión
            //        Response.Redirect("Login.aspx");
            //    }
            //    else
            //    {
            //        // Verifica rol 
            //        string rol = Session["Usuario"].ToString().ToLower(); // Obtenee rol

            //        // Redirigir o permitir acceso
            //        if (rol == "admin")
            //        {
            //            // Si es admin ingresa
            //        }
            //        else if (rol == "profesor")
            //        {
            //            // Si es profesor ingresa

            //        }
            //        else if (rol == "alumno")
            //        {
            //            // Si es alumno 
            //            Response.Redirect("InicioAlumno.aspx");
            //        }
            //        else
            //        {
            //            // Si el rol no es valido
            //            Response.Redirect("Login.aspx");
            //        }
            //    }
                //ddlCarrera.DataBind();
                //ddlDia.DataBind();
                //ddlMateria.DataBind();
                //ddlModulo.DataBind();
                //ddlPRofesor.DataBind();
            //}
        }


        protected void btnAgregarNota_Click(object sender, EventArgs e)
        {
//    int dni_profe = int.Parse(ddlPRofesor.SelectedValue);
//    int id_materia = int.Parse(ddlMateria.SelectedValue);
//    string dia = ddlDia.SelectedValue;
//    int modulo = int.Parse(ddlModulo.SelectedValue);
//    string carrera = ddlCarrera.SelectedValue;
//    string observaciones = txtObservaciones.Text;

//    SqlDataSource1.InsertParameters["dni_profe"].DefaultValue = ddlPRofesor.ToString();
//    SqlDataSource1.InsertParameters["id_materia"].DefaultValue = ddlMateria.ToString();
//    SqlDataSource1.InsertParameters["dia"].DefaultValue = dia;
//    SqlDataSource1.InsertParameters["modulo"].DefaultValue = ddlModulo.ToString();
//    SqlDataSource1.InsertParameters["carrera"].DefaultValue = carrera;
//    SqlDataSource1.InsertParameters["observaciones"].DefaultValue = observaciones;


//    SqlDataSource1.Insert();

//    GridView1.DataBind();

//    txtObservaciones.Text = "";
//    ddlCarrera.SelectedIndex = 0;
//    ddlDia.SelectedIndex = 0;
//    ddlMateria.SelectedIndex = 0;
//    ddlModulo.SelectedIndex = 0;
//    ddlPRofesor.SelectedIndex = 0;
//}


//        //protected void ddlMaterias_SelectedIndexChanged(object sender, EventArgs e)
//        //{
//        //    // Aquí puedes recargar los datos del GridView u otros controles
//        //    GridView1.DataBind(); // Esto recarga los datos en el GridView1
//        //    ddlAlumnos.DataBind(); // Esto recarga los datos en el ddlAlumnos
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
              //abre base de datos
              string connectionString = ConfigurationManager.ConnectionStrings["CadenaConexionPP2024"].ConnectionString;

              string queryy = "SELECT * FROM HorariosMaterias WHERE id_materia = " + DropDownList3.Text;

              using (SqlConnection connection = new SqlConnection(connectionString))
              {
                  connection.Open();
                  //Guarda las variables asignadas en los atributos de SQL
                  string query = "INSERT INTO HorariosMaterias (dni_profesor, id_materia, id_carrera, dia, observaciones) VALUES (@dni_profesor, @id_materia, @id_carrera, @dia, @observaciones)";
                  SqlCommand command = new SqlCommand(query, connection);
                  command.Parameters.AddWithValue("@dni_profesor", DropDownList2.Text);
                  command.Parameters.AddWithValue("@id_materia", DropDownList3.Text);
                  command.Parameters.AddWithValue("@id_carrera", DropDownList5.Text);
                  command.Parameters.AddWithValue("@dia", DropDownList1.Text);
                  command.Parameters.AddWithValue("@observaciones", TextBox1.Text);
                  command.ExecuteNonQuery();
                  Response.Redirect(Request.RawUrl);

                  connection.Close();
        }
        }
    }
}