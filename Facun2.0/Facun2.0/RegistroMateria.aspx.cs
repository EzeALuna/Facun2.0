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
    public partial class RegistroMateria2 : System.Web.UI.Page
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
                        // Si es profesor ingresa
                        
                    }
                    else if (rol == "alumno")
                    {
                        // Si es alumno
                        if (Request.Url.AbsolutePath.EndsWith("InicioAlumno.aspx"))
                        {
                            Response.Redirect("InicioAlumno.aspx");
                        }
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


                if (!String.IsNullOrEmpty(textNombre.Text) && !String.IsNullOrEmpty(textDescripcion.Text))
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
                        connection.Open();

                        // Primero, verificamos si el email o el DNI ya existen
                        string checkQuery = "SELECT COUNT(*) FROM Materias WHERE nombre = @nombre AND año = @año AND id_carrera = @carrera";
                        SqlCommand checkCommand = new SqlCommand(checkQuery, connection);
                        checkCommand.Parameters.AddWithValue("@nombre", textNombre.Text);
                        checkCommand.Parameters.AddWithValue("@año", DDLAño.SelectedValue);
                        checkCommand.Parameters.AddWithValue("@carrera", DDLCarrera.SelectedValue);

                        int count = (int)checkCommand.ExecuteScalar();  // Devuelve el número de coincidencias

                        if (count > 0)  // Si ya existe un registro con ese nombre o año
                        {
                            //lblTexto.Text = "El email o DNI ya están registrados";
                            //lblTexto.ForeColor = System.Drawing.Color.Red;
                            //return;  // Salimos del método para no continuar con la inserción
                            string scriptA = "Swal.fire({ icon: 'warning', title: 'Oops...', text: 'La materia ya esta registrada', confirmButtonColor: '#3085d6', confirmButtonText: 'OK' })";
                            ClientScript.RegisterStartupScript(this.GetType(), "sweetalert", scriptA, true);
                            return;
                        }


                        string script = String.Format("INSERT INTO Materias (nombre, descripcion, id_carrera, año) VALUES('{0}', '{1}', {2}, '{3}')",
                                                        textNombre.Text, textDescripcion.Text, DDLCarrera.SelectedValue, DDLAño.SelectedValue );




                        //try
                        //{
                        SqlCommand command = new SqlCommand(script, connection);

                            int resp = command.ExecuteNonQuery();

                            if (resp > 0)
                            {
                                
                                //LabelNombre.Text = "Se ha generado la Materia " + textDescripcion.Text + " AÑO: " + textAño.Text;
                                string scriptA = @"
                                Swal.fire({icon: 'success', 
                                title: 'Materia registrada', 
                                text: 'La materia ha sido registrada con éxito.', 
                                confirmButtonColor: '#3085d6', 
                                confirmButtonText: 'OK'
                                }).then((result) => {
                                if (result.isConfirmed) {
                                    window.location.href = 'RegistroMateria.aspx'; } });";
                                ClientScript.RegisterStartupScript(this.GetType(), "sweetalert", scriptA, true);
                                                         
                                lblTexto.ForeColor = System.Drawing.Color.Green;
                                lblTexto.Focus();
                                textNombre.Text = "";
                                textDescripcion.Text = "";
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
                                string scriptA = "Swal.fire({ icon: 'error', title: 'Error', text: 'Ha ocurrido un error al registrar la materia.', confirmButtonColor: '#d33', confirmButtonText: 'Intentar de nuevo' })";
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