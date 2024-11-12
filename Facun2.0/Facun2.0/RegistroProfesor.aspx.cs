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
    public partial class RegistroProfesor : System.Web.UI.Page
    {
        private static string Cadena = ConfigurationManager.ConnectionStrings["CadenaConexionPP2024"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
            //    // Verifica el usuario 
            //    if (Session["Usuario"] == null || string.IsNullOrEmpty(Session["Usuario"].ToString()))
            //    {
            //        // Si no hay sesión
            //        Response.Redirect("Login.aspx");
            //    }
            //    else
            //    {
            //        // Verifica rol 
            //        string rol = Session["Usuario"].ToString().ToLower(); // Obtenee rol

            //        // Redirigir o permitir acceso
            //        if (rol == "admin")
            //        {
            //            // Si es admin ingresa
            //        }
            //        else if (rol == "profesor")
            //        {
            //            // Si es profesor
            //        }
            //        else if (rol == "alumno")
            //        {
            //            // Si es alumno ingresa
            //            Response.Redirect("InicioAlumno.aspx");
            //        }
            //        else
            //        {
            //            // Si el rol no es valido
            //            Response.Redirect("Login.aspx");
            //        }
            //    }
            //}
        }

        protected void btnLoginprofesor_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(Cadena))
            {


                if (!String.IsNullOrEmpty(textApellido.Text) && !String.IsNullOrEmpty(textDNI.Text))
                {
                    SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();

                    //EZE
                    //builder.DataSource = "DESKTOP-QSS2PVA\\SQLEXPRESS";

                    //ESCUELA
                    //builder.DataSource = "DESKTOP-U48JRI6\\SQLEXPRESS";
                    builder.DataSource = "DESKTOP-URR4FQN\\SQLEXPRESS";

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
                        connection.Open();

                        // Primero, verificamos si el email o el DNI ya existen
                        string checkQuery = "SELECT COUNT(*) FROM Profesores WHERE email = @Email OR dni = @DNI";
                        SqlCommand checkCommand = new SqlCommand(checkQuery, connection);
                        checkCommand.Parameters.AddWithValue("@Email", textEmail.Text);
                        checkCommand.Parameters.AddWithValue("@DNI", textDNI.Text);

                        int count = (int)checkCommand.ExecuteScalar();  // Devuelve el número de coincidencias

                        if (count > 0)  // Si ya existe un registro con ese email o DNI
                        {
                            //lblTexto.Text = "El email o DNI ya están registrados";
                            //lblTexto.ForeColor = System.Drawing.Color.Red;
                            //return;  // Salimos del método para no continuar con la inserción
                            string scriptA = "Swal.fire({ icon: 'warning', title: 'Oops...', text: 'El email o DNI ya están registrados', confirmButtonColor: '#3085d6', confirmButtonText: 'OK' })";
                            ClientScript.RegisterStartupScript(this.GetType(), "sweetalert", scriptA, true);
                            return;
                        }


                        string script = "INSERT INTO Profesores (dni, Nombre, Apellido, email, contraseña, tipo)" +
                                        "VALUES (@DNI, @Nombre, @Apellido, @Email, @Contraseña, 'A')";

                        SqlCommand cmdProfe = new SqlCommand(script, connection);
                        cmdProfe.Parameters.AddWithValue("@DNI", textDNI.Text);
                        cmdProfe.Parameters.AddWithValue("@Nombre", textNombre.Text);
                        cmdProfe.Parameters.AddWithValue("@Apellido", textApellido.Text);
                        cmdProfe.Parameters.AddWithValue("@Email", textEmail.Text);
                        cmdProfe.Parameters.AddWithValue("@Contraseña", textContraseña.Text);


                            int resp = cmdProfe.ExecuteNonQuery();

                            if (resp > 0)
                            {

                                //LabelNombre.Text = "Se ha generado el Profesor " + textApellido.Text + " DNI: " + textDNI.Text;
                                string scriptA = @"
                                Swal.fire({icon: 'success', 
                                title: 'Profesor registrado', 
                                text: 'El Profesor ha sido registrado con éxito.', 
                                confirmButtonColor: '#3085d6', 
                                confirmButtonText: 'OK'
                                }).then((result) => {
                                if (result.isConfirmed) {
                                    window.location.href = 'InicioProfesor.aspx'; } });";
                                ClientScript.RegisterStartupScript(this.GetType(), "sweetalert", scriptA, true);

                                lblTexto.ForeColor = System.Drawing.Color.Green;
                                lblTexto.Focus();
                                textDNI.Text = "";
                                textNombre.Text = "";
                                textApellido.Text = "";
                                textContraseña.Text = "";
                                textContraseña2.Text = "";
                                textEmail.Text = "";
                                //textTipo.Text = "";
                                //textNacimiento.Text = "";
                                //textTelefono.Text = "";
                                //DDLCarrera.SelectedValue = "";
                                lblAlerta.Text = "";
                                //Response.Redirect("Login.aspx");
                            }
                            else
                            {
                                //lblTexto.Text = "Ha ocurrido un error";
                                //lblTexto.ForeColor = System.Drawing.Color.Red;
                                //lblAlerta.Text = "Ha ocurrido un error";
                                //lblAlerta.ForeColor = System.Drawing.Color.Red;
                                //lblTexto.Focus();
                                string scriptA = "Swal.fire({ icon: 'error', title: 'Error', text: 'Ha ocurrido un error al registrar el Profesor.', confirmButtonColor: '#d33', confirmButtonText: 'Intentar de nuevo' })";
                                ClientScript.RegisterStartupScript(this.GetType(), "sweetalert", scriptA, true);
                            }

                            conn.Close();

                        //}

                        //catch (Exception exception)
                        //{
                        //    Console.WriteLine(exception.Message);


                        //}
                    }
                }
                else
                {
                    lblTexto.Text = "Todos los campos son obligatorios";
                }

            }

        }

    }

}
