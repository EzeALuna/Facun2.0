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
    public partial class Login1 : System.Web.UI.Page
    {
        private static string Cadena = ConfigurationManager.ConnectionStrings["CadenaConexionPP2024"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(Cadena))
            {

                SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
                ////EZE
                builder.DataSource = "DESKTOP-QSS2PVA\\SQLEXPRESS";

                //ESCUELA
                //builder.DataSource = "DESKTOP-U48JRI6\\SQLEXPRESS";

                //HUGO
                //builder.DataSource = "DESKTOP-044COGN";

                //Nombre de la base de datos
                builder.InitialCatalog = "Facun2DB";
                //Indicamos que se trata de Seguridad Integrada
                builder.IntegratedSecurity = true;
                builder.PersistSecurityInfo = true;
                builder.ApplicationName = "Facun2DB";

                using (SqlConnection conn = new SqlConnection(builder.ConnectionString))
                {
                    conn.Open();

                    // Consulta las tres tablas
                    string queryAlumnos = "SELECT Tipo, Nombre, Apellido FROM Alumnos WHERE DNI = @DNI AND CONTRASEÑA = @Contraseña"; ;
                    string queryProfesores = "SELECT Tipo, Nombre, Apellido FROM Profesores WHERE DNI = @DNI AND CONTRASEÑA = @Contraseña"; ;
                    string queryAdmin = "SELECT Tipo, Nombre, Apellido FROM Admin WHERE DNI = @DNI AND CONTRASEÑA = @Contraseña";
                    

                    // 
                    SqlCommand commandAlumnos = new SqlCommand(queryAlumnos, conn);
                    SqlCommand commandProfesores = new SqlCommand(queryProfesores, conn);
                    SqlCommand commandAdmin = new SqlCommand(queryAdmin, conn);

                    // parámetros para las tres consultas
                    commandAlumnos.Parameters.AddWithValue("@DNI", txtDNI.Text);
                    commandAlumnos.Parameters.AddWithValue("@Contraseña", txtContraseña.Text);

                    commandProfesores.Parameters.AddWithValue("@DNI", txtDNI.Text);
                    commandProfesores.Parameters.AddWithValue("@Contraseña", txtContraseña.Text);

                    commandAdmin.Parameters.AddWithValue("@DNI", txtDNI.Text);
                    commandAdmin.Parameters.AddWithValue("@Contraseña", txtContraseña.Text);

                    // Verificar si el usuario es un Alumno
                    using (SqlDataReader readerAlumnos = commandAlumnos.ExecuteReader())
                    {
                        if (readerAlumnos.Read())
                        {
                            string tipo = readerAlumnos["Tipo"].ToString();
                            string nombre = readerAlumnos["Nombre"].ToString();
                            string apellido = readerAlumnos["Apellido"].ToString();
                            Session["DNI"] = txtDNI.Text;
                            Session["NombreAlumno"] = nombre + " " + apellido;
                            Session["Usuario"] = "alumno";
                            Session["AlumnoDNI"] = txtDNI.Text;
                            Response.Redirect("InicioAlumno.aspx");
                        }
                    }

                    // Verificar si el usuario es un Profe
                    using (SqlDataReader readerProfesores = commandProfesores.ExecuteReader())
                    {
                        if (readerProfesores.Read())
                        {
                            string tipo = readerProfesores["Tipo"].ToString();
                            string nombre = readerProfesores["Nombre"].ToString();
                            string apellido = readerProfesores["Apellido"].ToString();
                            Session["DNIProfesor"] = txtDNI.Text;
                            Session["NombreProfesor"] = nombre + " " + apellido;
                            Session["Usuario"] = "profesor";
                            Response.Redirect("InicioProfesor.aspx");
                        }
                    }

                    // Verificar si el usuario es un Admin
                    using (SqlDataReader readerAdmin = commandAdmin.ExecuteReader())
                    {
                        if (readerAdmin.Read())
                        {
                            string tipo = readerAdmin["Tipo"].ToString();
                            string nombre = readerAdmin["Nombre"].ToString();
                            string apellido = readerAdmin["Apellido"].ToString();
                            Session["DNIAdmin"] = txtDNI.Text;
                            Session["NombreAdmin"] = nombre + " " + apellido;
                            Session["Usuario"] = "admin";
                            Response.Redirect("InicioAdmin.aspx");
                        }
                    }

                    lblTexto.Text = "Usuario o Contraseña incorrectos.";
                    lblTexto.ForeColor = System.Drawing.Color.Red;
                    lblTexto.Focus();
                }

            }
        }
               
    }
}