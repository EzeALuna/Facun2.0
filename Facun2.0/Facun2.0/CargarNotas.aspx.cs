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
            if (e.CommandName == "Insert")
            {
                // Obtener la fila desde la que se llamó el comando
                GridViewRow row = ((Control)e.CommandSource).NamingContainer as GridViewRow;

                // Obtener valores necesarios para el InsertCommand
                string dniAlumno = ((Label)row.FindControl("DNI")).Text;
                string trimestre = ((DropDownList)GridViewAlumnosMaterias.FooterRow.FindControl("ddlTrimestreFooter")).SelectedValue;
                string nota = ((DropDownList)GridViewAlumnosMaterias.FooterRow.FindControl("ddlNotaFooter")).SelectedValue;

                // Pasar los valores al SqlDataSource para la inserción
                SqlDataSourceAlumnosMaterias.InsertParameters["dni_alumno"].DefaultValue = dniAlumno;
                SqlDataSourceAlumnosMaterias.InsertParameters["trimestre"].DefaultValue = trimestre;
                SqlDataSourceAlumnosMaterias.InsertParameters["nota"].DefaultValue = nota;

                // Ejecutar la inserción
                SqlDataSourceAlumnosMaterias.Insert();
                GridViewAlumnosMaterias.DataBind();
            }
        }


            }
    }
       
        
