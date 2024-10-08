using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Facun2._0
{
    public partial class Login : System.Web.UI.Page
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
            //                Response.Redirect("InicioProfesor.aspx");
            //        }
            //        else if (rol == "alumno")
            //        {
            //            // Si es alumno ingresa

            //        }
            //        else
            //        {
            //            // Si el rol no es valido
            //            Response.Redirect("Login.aspx");
            //        }
            //    }
            //}
        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(Cadena))
            {
                if (!String.IsNullOrEmpty(textApellido.Text) && !String.IsNullOrEmpty(textDNI.Text))
                {
                    //SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
                    //builder.DataSource = "DESKTOP-QSS2PVA\\SQLEXPRESS";  // Ajusta según tu servidor
                    //builder.InitialCatalog = "Facun2DB";
                    //builder.IntegratedSecurity = true;
                    //builder.PersistSecurityInfo = true;

                    SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
                    builder.DataSource = "DESKTOP-U48JRI6\\SQLEXPRESS";  // Ajusta según tu servidor
                    builder.InitialCatalog = "Facun2DB";
                    builder.IntegratedSecurity = true;
                    builder.PersistSecurityInfo = true;



                    try
                    {
                        // Abrir la conexión
                        connection.Open();

                        // Verificar si el email o DNI ya existen
                        string checkQuery = "SELECT COUNT(*) FROM Alumnos WHERE email = @Email OR dni = @DNI";
                        SqlCommand checkCommand = new SqlCommand(checkQuery, connection);
                        checkCommand.Parameters.AddWithValue("@Email", textEmail.Text);
                        checkCommand.Parameters.AddWithValue("@DNI", textDNI.Text);

                        int count = (int)checkCommand.ExecuteScalar();

                        if (count > 0)
                        {
                            // Mostrar mensaje si ya existe el alumno
                            string scriptA = "Swal.fire({ icon: 'warning', title: 'Oops...', text: 'El email o DNI ya están registrados', confirmButtonColor: '#3085d6', confirmButtonText: 'OK' })";
                            ClientScript.RegisterStartupScript(this.GetType(), "sweetalert", scriptA, true);
                            return;
                        }

                        // Insertar el alumno en la tabla Alumnos
                        string scriptAlumno = "INSERT INTO Alumnos (Nombre, Apellido, dni, fecha_nacimiento, direccion, email, contraseña, telefono, tipo, id_carrera) " +
                                              "VALUES (@Nombre, @Apellido, @DNI, @FechaNacimiento, @Direccion, @Email, @Contraseña, @Telefono, 'A', @IdCarrera)";

                        SqlCommand cmdAlumno = new SqlCommand(scriptAlumno, connection);
                        cmdAlumno.Parameters.AddWithValue("@Nombre", textNombre.Text);
                        cmdAlumno.Parameters.AddWithValue("@Apellido", textApellido.Text);
                        cmdAlumno.Parameters.AddWithValue("@DNI", textDNI.Text);
                        cmdAlumno.Parameters.AddWithValue("@FechaNacimiento", textNacimiento.Text);
                        cmdAlumno.Parameters.AddWithValue("@Direccion", textDireccion.Text);
                        cmdAlumno.Parameters.AddWithValue("@Email", textEmail.Text);
                        cmdAlumno.Parameters.AddWithValue("@Contraseña", textContraseña.Text);
                        cmdAlumno.Parameters.AddWithValue("@Telefono", textTelefono.Text);
                        cmdAlumno.Parameters.AddWithValue("@IdCarrera", DDLCarrera.SelectedValue);




                        // Ejecutar la inserción del alumno
                        int filasAfectadasAlumno = cmdAlumno.ExecuteNonQuery();

                        if (filasAfectadasAlumno > 0)
                        {
                            // Alumno insertado correctamente, ahora obtener las materias
                            string obtenerMaterias = "SELECT id_materia FROM Materias WHERE id_carrera = @IdCarrera";
                            SqlCommand cmdMaterias = new SqlCommand(obtenerMaterias, connection);
                            cmdMaterias.Parameters.AddWithValue("@IdCarrera", DDLCarrera.SelectedValue);

                            SqlDataReader reader = cmdMaterias.ExecuteReader();

                            // Insertar inscripciones en la tabla Inscripciones
                            while (reader.Read())
                            {
                                int idMateria = (int)reader["id_materia"];

                                string insertarInscripcion = "INSERT INTO Inscripciones (dni_alumno, id_materia, estado) " +
                                                             "VALUES (@DNI, @IdMateria, 'A cursar')";

                                SqlCommand cmdInscripcion = new SqlCommand(insertarInscripcion, connection);
                                cmdInscripcion.Parameters.AddWithValue("@DNI", textDNI.Text);
                                cmdInscripcion.Parameters.AddWithValue("@IdMateria", idMateria);

                                // Ejecutar la inserción de inscripciones
                                int filasAfectadasInscripcion = cmdInscripcion.ExecuteNonQuery();

                                if (filasAfectadasInscripcion == 0)
                                {
                                    // Mostrar mensaje de error si alguna inscripción no se pudo insertar
                                    string scriptErrorInscripcion = "Swal.fire({ icon: 'error', title: 'Error', text: 'No se pudo insertar la inscripción.', confirmButtonColor: '#d33', confirmButtonText: 'OK' })";
                                    ClientScript.RegisterStartupScript(this.GetType(), "sweetalert", scriptErrorInscripcion, true);
                                }
                            }

                            reader.Close();

                            // Mostrar mensaje de éxito
                            string scriptA = @"
                    Swal.fire({icon: 'success', 
                    title: 'Registro completado', 
                    text: 'El alumno ha sido registrado con éxito junto a sus inscripciones.', 
                    confirmButtonColor: '#3085d6', 
                    confirmButtonText: 'OK'
                    }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = 'InicioAlumno.aspx'; } });";

                            ClientScript.RegisterStartupScript(this.GetType(), "sweetalert", scriptA, true);
                        }
                        else
                        {
                            // Si no se pudo insertar el alumno
                            string scriptErrorAlumno = "Swal.fire({ icon: 'error', title: 'Error', text: 'No se pudo insertar el alumno.', confirmButtonColor: '#d33', confirmButtonText: 'OK' })";
                            ClientScript.RegisterStartupScript(this.GetType(), "sweetalert", scriptErrorAlumno, true);
                        }
                    }
                    catch (Exception ex)
                    {
                        // Mostrar mensaje de error en caso de excepción
                        string scriptError = "Swal.fire({ icon: 'error', title: 'Error', text: 'Ha ocurrido un error: " + ex.Message + "', confirmButtonColor: '#d33', confirmButtonText: 'OK' })";
                        ClientScript.RegisterStartupScript(this.GetType(), "sweetalert", scriptError, true);
                    }
                    finally
                    {
                        // Cerrar la conexión
                        if (connection.State == ConnectionState.Open)
                        {
                            connection.Close();
                        }
                    }
                }
                else
                {
                    // Mostrar mensaje si los campos están vacíos
                    lblTexto.Text = "Todos los campos son obligatorios";
                    lblTexto.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

            }
        
        }
