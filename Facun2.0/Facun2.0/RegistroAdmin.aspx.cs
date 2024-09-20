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
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(Cadena))
            {

                if (!String.IsNullOrEmpty(textApellido.Text) && !String.IsNullOrEmpty(textDNI.Text))
                {
                    SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();

                    //EZE
                    builder.DataSource = "DESKTOP-QSS2PVA\\SQLEXPRESS";

                    //ESCUELA
                    //builder.DataSource = "DESKTOP-U48JRI6\\SQLEXPRESS";

                    //HUGO
                    //builder.DataSource = "DESKTOP-L84NEUL";

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


                        string script = String.Format("INSERT INTO Admin (Nombre, Apellido, dni, fecha_nacimiento, direccion, email, contraseña, telefono, tipo, cargo) VALUES('{0}', '{1}', {2}, '{3}', '{4}', '{5}', '{6}', {7}, '{8}', '{9}')",
                                                        textNombre.Text, textApellido.Text, textDNI.Text, textNacimiento.Text, textDireccion.Text, textEmail.Text, textContraseña.Text, textTelefono.Text, 'D', textCargo.Text);

                        conn.Open();

                        try
                        {
                            SqlCommand command = new SqlCommand(script, conn);

                            int resp = command.ExecuteNonQuery();

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
                                textNacimiento.Text = "";
                                textTelefono.Text = "";
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