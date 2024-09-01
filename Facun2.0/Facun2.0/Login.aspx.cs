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
                try
                {
                    SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
                    //EZE
                    //builder.DataSource = "DESKTOP-QSS2PVA\\SQLEXPRESS";

                    //ESCUELA
                    //builder.DataSource = "DESKTOP-U48JRI6\\SQLEXPRESS";

                    //HUGO

                    builder.DataSource = "DESKTOP-L84NEUL";


                    //Nombre de la base de datos
                    builder.InitialCatalog = "Facun2DB";
                    //Indicamos que se trata de Seguridad Integrada
                    builder.IntegratedSecurity = true;
                    builder.PersistSecurityInfo = true;
                    builder.ApplicationName = "Facun2DB";

                    using (SqlConnection conn = new SqlConnection(builder.ConnectionString))
                    {

                        string script = "SELECT COUNT(*) FROM USUARIO WHERE DNI = " + txtDNI.Text + " AND" +
                                " CONTRASEÑA = '" + txtContraseña.Text + "'";
                        string query = "SELECT TipoUsuario FROM Usuario WHERE DNI = " + txtDNI.Text + " AND Contraseña = '" + txtContraseña.Text + "'";

                        SqlCommand commando = new SqlCommand(query, conn);

                        //connection.Open();
                        conn.Open();

                        SqlCommand command = new SqlCommand(script, conn);

                        //int filas = command.ExecuteNonQuery();
                        int count = (int)command.ExecuteScalar();

                        using (SqlDataReader reader = commando.ExecuteReader())
                            //if (filas < 0)
                            if (count > 0)
                            {

                                if (reader.Read())
                                {
                                    string Tipo = reader["TipoUsuario"].ToString(); // Obtener el valor del atributo 'Tipo'

                                    // Verificar si el Tipo = "A" (mayúscula)
                                    if (Tipo.Equals("A"))
                                    {
                                        // Redirigir a la página de inicio si cumple la condición
                                        Session["Usuario"] = txtDNI.Text;
                                        Response.Redirect("InicioAlumno.aspx");
                                    }
                                    else if (Tipo.Equals("a"))
                                    {
                                        // Verificar si el Tipo = "a" (minuscula)
                                        Session["Usuario"] = txtDNI.Text;
                                        Response.Redirect("InicioAlumno.aspx");
                                    }
                                }
                                else Session["Usuario"] = txtDNI.Text;
                                Page.Response.Redirect("InicioProfesor.aspx");
                                //Response.Redirect("Inicio.aspx", true);
                            }

                            else
                                lblTexto.Text = "Usuario o Contraseña incorrectos.";
                        lblTexto.ForeColor = System.Drawing.Color.Red;
                        lblTexto.Focus();
                        conn.Close();
                    }
                }
                catch (Exception exception)
                {
                    Console.WriteLine(exception.Message);
                }
            }

        }
    }
}