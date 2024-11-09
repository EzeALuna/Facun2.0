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
    public partial class RegistroAdmin : System.Web.UI.Page
    {
        private static string Cadena = ConfigurationManager.ConnectionStrings["CadenaConexionPP2024"].ConnectionString;

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
        protected void btnLogin_Click(object sender, EventArgs e)
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
                    //builder.DataSource = "DESKTOP-URR4FQN\\SQLEXPRESS";

                    //HUGO
                    builder.DataSource = "DESKTOP-044COGN";

                    //Nombre de la base de datos
                    builder.InitialCatalog = "Facun2DB";
                    //Indicamos que se trata de Seguridad Integrada
                    builder.IntegratedSecurity = true;
                    builder.PersistSecurityInfo = true;
                    builder.ApplicationName = "Facun2DB";


                    using (SqlConnection conn = new SqlConnection(builder.ConnectionString))
                    {
                        try
                        {
                        connection.Open();

                        // Primero, verificamos si el email o el DNI ya existen
                        string checkQuery = "SELECT COUNT(*) FROM Admin WHERE email = @Email OR dni = @DNI";
                        SqlCommand checkCommand = new SqlCommand(checkQuery, connection);
                        checkCommand.Parameters.AddWithValue("@Email", textEmail.Text);
                        checkCommand.Parameters.AddWithValue("@DNI", textDNI.Text);

                        int count = (int)checkCommand.ExecuteScalar();  // Devuelve el número de coincidencias

                        if (count > 0)  // Si ya existe un registro con ese email o DNI
                        {
                            string scriptA = "Swal.fire({ icon: 'warning', title: 'Oops...', text: 'El email o DNI ya están registrados', confirmButtonColor: '#3085d6', confirmButtonText: 'OK' })";
                            ClientScript.RegisterStartupScript(this.GetType(), "sweetalert", scriptA, true);
                            return;
                        }

                            string script =  "INSERT INTO Admin (dni, Nombre, Apellido, Email, contraseña, Tipo)" +
                                              "VALUES (@DNI, @Nombre, @Apellido, @Email, @Contraseña, 'A')";

                            SqlCommand cmdAdmin = new SqlCommand(script, connection);
                            cmdAdmin.Parameters.AddWithValue("@DNI", textDNI.Text);
                            cmdAdmin.Parameters.AddWithValue("@Nombre", textNombre.Text);
                            cmdAdmin.Parameters.AddWithValue("@Apellido", textApellido.Text);
                            cmdAdmin.Parameters.AddWithValue("@Email", textEmail.Text);
                            cmdAdmin.Parameters.AddWithValue("@Contraseña", textContraseña.Text);

                            int resp = cmdAdmin.ExecuteNonQuery();

                            if (resp > 0)
                            {
                                //LabelNombre.Text = "Se ha generado el Admin " + textApellido.Text + " DNI: " + textDNI.Text;
                                string scriptA = @"
                            Swal.fire({icon: 'success', 
                                title: 'Admin registrado', 
                                text: 'El Admin ha sido registrado con éxito.', 
                                confirmButtonColor: '#3085d6', 
                                confirmButtonText: 'OK'
                                }).then((result) => {
                                if (result.isConfirmed) {
                                    window.location.href = 'InicioAdmin.aspx'; } });";
                                ClientScript.RegisterStartupScript(this.GetType(), "sweetalert", scriptA, true);


                                lblTexto.ForeColor = System.Drawing.Color.Green;
                                lblTexto.Focus();
                                textNombre.Text = "";
                                textApellido.Text = "";
                                textContraseña.Text = "";
                                textContraseña2.Text = "";
                                textEmail.Text = "";
                                textDNI.Text = "";
                                //textTipo.Text = "";
                                //textNacimiento.Text = "";
                                //textTelefono.Text = "";
                                //DDLCarrera.SelectedValue = "";
                                lblAlerta.Text = "";

                            }
                            else
                            {
                                string scriptA = "Swal.fire({ icon: 'error', title: 'Error', text: 'Ha ocurrido un error al registrar el Admin.', confirmButtonColor: '#d33', confirmButtonText: 'Intentar de nuevo' })";
                                ClientScript.RegisterStartupScript(this.GetType(), "sweetalert", scriptA, true);
                            }

                            conn.Close();

                        }

                        catch (Exception exception)
                        {
                            Console.WriteLine(exception.Message);

                        }
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