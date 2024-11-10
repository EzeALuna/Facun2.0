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
                if (Session["DNI"] == null || string.IsNullOrEmpty(Session["Usuario"].ToString()))
                {
                    //// Si no hay sesión
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
            if (e.CommandName == "Eliminar")
            {
                // Obtén el ID de la inscripción a eliminar desde CommandArgument
                int idInscripcion = Convert.ToInt32(e.CommandArgument);

                // Ejecuta la eliminación en la base de datos
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Facun2DBConnectionString1"].ConnectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM Inscripciones WHERE id_inscripcion = @id_inscripcion", conn);
                    cmd.Parameters.AddWithValue("@id_inscripcion", idInscripcion);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

                GridView2.DataBind();
                GridView1.DataBind();
                
            }
  

            if (e.CommandName == "Seleccionar")
            {
                int dniAlumno = Convert.ToInt32(Session["DNI"]);
                int idMateria = Convert.ToInt32(e.CommandArgument);

                if (idMateria > 0)
                {
                    // Insertar materia en tabla Inscripciones 
                    //string dniAlumno = Session["dni"].ToString(); 

                    string query = "INSERT INTO Inscripciones (dni_alumno, id_materia,fecha_inscripcion, estado) VALUES (@dniAlumno, @idMateria, getdate(), 'Cursando')";

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
                    GridView2.DataBind();
                }
                else
                {
                    // 
                }
            }
        }


    }
}