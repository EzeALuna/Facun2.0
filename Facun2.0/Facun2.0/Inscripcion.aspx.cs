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
    public partial class Inscripcion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Verifica el usuario 
                if (Session["Usuario"] == null || string.IsNullOrEmpty(Session["Usuario"].ToString()))
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
                        // Si es profesor
                        Response.Redirect("InicioProfesor.aspx");
                    }
                    else if (rol == "alumno")
                    {
                        // Si es alumno ingresa
                    }
                    else
                    {
                        // Si el rol no es valido
                        Response.Redirect("Login.aspx");
                    }
                }
            }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Seleccionar")
            {
                int idMateria = Convert.ToInt32(e.CommandArgument);

                if (idMateria > 0)
                {
                    // Insertar materia en tabla Inscripciones 
                    string dniAlumno = Session["dni"].ToString(); 

                    string query = "INSERT INTO Inscripciones (dni_alumno, id_materia, estado) VALUES (@dniAlumno, @idMateria, 'Cursando')";

                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Facun2DBConnectionString1"].ConnectionString))
                    {
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@dniAlumno", dniAlumno);
                            cmd.Parameters.AddWithValue("@idMateria", idMateria);  

                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }

                    // Recarga Inscripciones
                    
                    GridView1.DataBind();
                }
                else
                {
                    // 
                }
            }
        }



    }
}