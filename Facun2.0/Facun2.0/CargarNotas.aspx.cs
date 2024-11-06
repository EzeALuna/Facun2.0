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
            if (e.CommandName == "Insertar")
            {
                // Obtener el FooterRow del GridView
                GridViewRow footerRow = GridViewAlumnosMaterias.FooterRow;

                // Obtener los valores de los controles en el FooterTemplate
                DropDownList ddlAlumnoFooter = (DropDownList)footerRow.FindControl("ddlAlumnoFooter");
                DropDownList ddlTrimestreFooter = (DropDownList)footerRow.FindControl("ddlTrimestreFooter");
                TextBox txtNotaFooter = (TextBox)footerRow.FindControl("txtNotaFooter");

                // Verificar que los valores no estén vacíos
                if (ddlAlumnoFooter != null && ddlTrimestreFooter != null && txtNotaFooter != null)
                {
                    // Asignar valores a las variables
                    int dniAlumno = int.Parse(ddlAlumnoFooter.SelectedValue);
                    string trimestre = ddlTrimestreFooter.SelectedValue;
                    int nota = int.Parse(txtNotaFooter.Text);
                    int idMateria = int.Parse(ddlMaterias.SelectedValue);

                    // Realizar la inserción en la base de datos
                    string insertQuery = "INSERT INTO Notas_Alumnos (dni_alumno, id_materia, trimestre, nota, fecha) VALUES (@dni_alumno, @id_materia, @trimestre, @nota, GETDATE())";

                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Facun2DBConnectionString1"].ConnectionString))
                    {
                        using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                        {
                            cmd.Parameters.AddWithValue("@dni_alumno", dniAlumno);
                            cmd.Parameters.AddWithValue("@id_materia", idMateria);
                            cmd.Parameters.AddWithValue("@trimestre", trimestre);
                            cmd.Parameters.AddWithValue("@nota", nota);

                            conn.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }

                    // Recargar el GridView después de la inserción
                    GridViewAlumnosMaterias.DataBind();
                }
            }
        }


            }
    }
       
        
