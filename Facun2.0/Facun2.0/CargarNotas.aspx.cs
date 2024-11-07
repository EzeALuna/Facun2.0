using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Facun2._0
{
    public partial class CargarNotas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {


                // Verifica el usuario 
                if (Session["DNIProfesor"] == null || string.IsNullOrEmpty(Session["Usuario"].ToString()))
                {
                    // Si no hay sesión
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    // Verifica rol 
                    string rol = Session["Usuario"].ToString().ToLower(); // Obtenee rol

                    // Redirigir o permitir acceso
                    if (rol == "admin")
                    {
                        // Si es admin ingresa
                    }
                    else if (rol == "profesor")
                    {
                        // Si es profesor ingresa

                    }
                    else if (rol == "alumno")
                    {
                        // Si es alumno 
                        Response.Redirect("InicioAlumno.aspx");
                    }
                    else
                    {
                        // Si el rol no es valido
                        Response.Redirect("Login.aspx");
                    }
                }
                ddlMaterias.DataBind();
                ddlAlumnos.DataBind();
            }
        }

      
        protected void btnAgregarNota_Click(object sender, EventArgs e)
{
    int dniAlumno = int.Parse(ddlAlumnos.SelectedValue);
    int idMateria = int.Parse(ddlMaterias.SelectedValue);
    string trimestre = ddlTrimestre.SelectedValue;
    int nota = int.Parse(ddlNota.SelectedValue);
    string observaciones = txtObservaciones.Text;

    SqlDataSourceNotas.InsertParameters["dni_alumno"].DefaultValue = dniAlumno.ToString();
    SqlDataSourceNotas.InsertParameters["id_materia"].DefaultValue = idMateria.ToString();
    SqlDataSourceNotas.InsertParameters["trimestre"].DefaultValue = trimestre;
    SqlDataSourceNotas.InsertParameters["nota"].DefaultValue = nota.ToString();
    SqlDataSourceNotas.InsertParameters["observaciones"].DefaultValue = observaciones;

    SqlDataSourceNotas.Insert();

    GridView1.DataBind();

    txtObservaciones.Text = "";
    ddlNota.SelectedIndex = 0;
    ddlTrimestre.SelectedIndex = 0;
    ddlAlumnos.SelectedIndex = 0;
}


        protected void ddlMaterias_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Aquí puedes recargar los datos del GridView u otros controles
            GridView1.DataBind(); // Esto recarga los datos en el GridView1
            ddlAlumnos.DataBind(); // Esto recarga los datos en el ddlAlumnos
        }

            }
    }
       
        
