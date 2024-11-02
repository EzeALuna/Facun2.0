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
            }
        }

        protected void GridViewAlumnosMaterias_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            //if (e.CommandName == "Seleccionar")
            //{
            //    int dniAlumno = Convert.ToInt32(Session["AlumnoDNI"]);
            //    int idMateria = Convert.ToInt32(e.CommandArgument);
            //    int trimestre = Convert.ToInt32(e.CommandArgument);
            //    int nota = Convert.ToInt32(e.CommandArgument);

            //    if (idMateria > 0)
            //    {

            //        string query = "INSERT INTO Notas_Alumnos (dni_alumno, id_materia, trimestre, nota, fecha) VALUES (@dniAlumno, @idMateria, @trimestre, @nota, GETDATE())";

            //        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Facun2DBConnectionString1"].ConnectionString))
            //        {
            //            using (SqlCommand cmd = new SqlCommand(query, con))
            //            {
            //                cmd.Parameters.AddWithValue("@dniAlumno", dniAlumno);
            //                cmd.Parameters.AddWithValue("@idMateria", idMateria);
            //                cmd.Parameters.AddWithValue("@trimestre", trimestre);
            //                cmd.Parameters.AddWithValue("@nota", nota);

            //                con.Open();
            //                cmd.ExecuteNonQuery();
            //                con.Close();
            //            }
            //        }

            //        GridViewAlumnosMaterias.DataBind();

            //    }
            //    else
            //    {
            //        // 
            //    }
            //}

            }
    }
        }

        
