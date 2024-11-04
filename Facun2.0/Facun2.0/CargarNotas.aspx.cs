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

            protected void GridViewAlumnosMaterias_RowUpdating(object sender, GridViewUpdateEventArgs e)
{
    var idNota = e.Keys["id_nota"];
    var nota = Convert.ToInt32(e.NewValues["Nota"]);
    var trimestre = e.NewValues["Trimestre"].ToString();
    var idMateria = Convert.ToInt32(ddlMaterias.SelectedValue);
    var dniAlumno = Convert.ToInt32(GridViewAlumnosMaterias.DataKeys[e.RowIndex].Values["DNI"]);

    string query;
    if (idNota == DBNull.Value)
    {
        // Insert command if id_nota is null
        query = "INSERT INTO Notas_Alumnos (dni_alumno, id_materia, nota, trimestre, fecha) VALUES (@dni_alumno, @id_materia, @nota, @trimestre, GETDATE())";
    }
    else
    {
        // Update command if id_nota exists
        query = "UPDATE Notas_Alumnos SET nota = @nota, trimestre = @trimestre, fecha = GETDATE() WHERE id_nota = @id_nota";
    }

    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Facun2DBConnectionString1"].ConnectionString))
    using (SqlCommand cmd = new SqlCommand(query, con))
    {
        cmd.Parameters.AddWithValue("@dni_alumno", dniAlumno);
        cmd.Parameters.AddWithValue("@id_materia", idMateria);
        cmd.Parameters.AddWithValue("@nota", nota);
        cmd.Parameters.AddWithValue("@trimestre", trimestre);
        if (idNota != DBNull.Value)
        {
            cmd.Parameters.AddWithValue("@id_nota", idNota);
        }
        
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    GridViewAlumnosMaterias.EditIndex = -1;
    GridViewAlumnosMaterias.DataBind();
}

            }
    }
       
        
