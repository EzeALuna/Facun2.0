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
    public partial class Login : System.Web.UI.Page
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
                        string script = String.Format("INSERT INTO USUARIO (Nombre, Apellido, Email, Contraseña, TipoUsuario, Nacimiento, DNI, IdCarrera, IdMateria) VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', {6}, {7}, {8})",
                                                        textNombre.Text, textApellido.Text, textEmail.Text, textContraseña.Text, textTipo.Text, textNacimiento.Text, textDNI.Text, textCarrera.Text, textMateria.Text);

                        conn.Open();
                        try
                        {
                        SqlCommand command = new SqlCommand(script, conn);

                        int resp = command.ExecuteNonQuery();
                       
                            if (resp > 0)
                            {
                                LabelNombre.Text = "Se ha generado el usuario " + textApellido.Text + " DNI: " + textDNI.Text;
                                lblTexto.ForeColor = System.Drawing.Color.Green;
                                lblTexto.Focus();
                                textNombre.Text = "";
                                textApellido.Text = "";
                                textContraseña.Text = "";
                                textContraseña2.Text = "";
                                textEmail.Text = "";
                                textDNI.Text = "";
                                textTipo.Text = "";
                                textNacimiento.Text = "";
                                textMateria.Text = "";
                                textCarrera.Text = "";
                            }
                            else
                            {
                                lblTexto.Text = "Ha ocurrido un error";
                                lblTexto.ForeColor = System.Drawing.Color.Red;
                                lblAlerta.Text = "Ha ocurrido un error";
                                lblAlerta.ForeColor = System.Drawing.Color.Red;
                                lblTexto.Focus();
                            }

                            conn.Close();

                        }
                        catch (Exception exception)
                        {
                            Console.WriteLine(exception.Message);
                            lblTexto.Text = "El DNI ya fue ingresado"; 
                            lblTexto.ForeColor = System.Drawing.Color.Red;
                            lblAlerta.Text = "El DNI ya fue ingresado";
                            lblAlerta.ForeColor = System.Drawing.Color.Red;
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