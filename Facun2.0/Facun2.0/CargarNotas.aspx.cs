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
                if (Session["DNI"] == null || string.IsNullOrEmpty(Session["Usuario"].ToString()))
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

        //protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    // Establece la fila en modo de edición
        //    GridView1.EditIndex = e.NewEditIndex;
        //    GridView1.DataBind(); // Vuelve a enlazar los datos para reflejar el modo de edición
        //}

        //protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    // Obtiene la fila actual en modo de edición
        //    GridViewRow row = GridView1.Rows[e.RowIndex];

        //    // Obtiene valores de las columnas editables
        //    string trimestre = ((TextBox)row.Cells[2].Controls[0]).Text;
        //    int nota = Convert.ToInt32(((TextBox)row.Cells[3].Controls[0]).Text);
        //    string observaciones = ((TextBox)row.Cells[5].Controls[0]).Text;

        //    // Obtiene los valores clave de DataKeyNames
        //    int dni_alumno = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["dni_alumno"]);
        //    DateTime fecha = Convert.ToDateTime(GridView1.DataKeys[e.RowIndex].Values["fecha"]);

        //    // Asigna los parámetros de actualización
        //    SqlDataSourceNotas.UpdateParameters["dni_alumno"].DefaultValue = dni_alumno.ToString();
        //    SqlDataSourceNotas.UpdateParameters["id_materia"].DefaultValue = ddlMaterias.SelectedValue;
        //    SqlDataSourceNotas.UpdateParameters["trimestre"].DefaultValue = trimestre;
        //    SqlDataSourceNotas.UpdateParameters["nota"].DefaultValue = nota.ToString();
        //    SqlDataSourceNotas.UpdateParameters["observaciones"].DefaultValue = observaciones;
        //    SqlDataSourceNotas.UpdateParameters["fecha"].DefaultValue = fecha.ToString("yyyy-MM-dd");

        //    // Ejecuta la actualización
        //    SqlDataSourceNotas.Update();

        //    // Sale del modo de edición
        //    GridView1.EditIndex = -1;
        //    GridView1.DataBind();
        //}

        //protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    // Cancela el modo de edición
        //    GridView1.EditIndex = -1;
        //    GridView1.DataBind();
        //}

    }
    }
       
        
