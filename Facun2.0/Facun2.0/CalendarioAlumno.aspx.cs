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
    public partial class CalendarioAlumno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextFecha.Text = Calendar1.SelectedDate.ToLongDateString();
        }

        protected void ButtonGuardar_Click(object sender, EventArgs e)
        {
            //using (SqlConnection connection = new SqlConnection(Cadena))
            //{

            //    SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            //    //EZE
            //    //builder.DataSource = "DESKTOP-QSS2PVA\\SQLEXPRESS";

            //    //ESCUELA
            //    //builder.DataSource = "DESKTOP-U48JRI6\\SQLEXPRESS";

            //    //HUGO
            //    builder.DataSource = "DESKTOP-044COGN";

            //    //Nombre de la base de datos
            //    builder.InitialCatalog = "Facun2DB";
            //    //Indicamos que se trata de Seguridad Integrada
            //    builder.IntegratedSecurity = true;
            //    builder.PersistSecurityInfo = true;
            //    builder.ApplicationName = "Facun2DB";
                   
            //    // using (SqlConnection conn = new SqlConnection(builder.ConnectionString))
            //    //{
            //    //     try
            //    //    {
            //    //        // Abrir la conexión
            //    //        connection.Open();

            //    //        //DNI_ALUMNO string = "SELECT dni from alumnos where"

            //    //        string scriptCalendario = "INSERT INTO Calendario (fecha, descripcion) " +
            //    //                              "VALUES (@fecha, @descripcion)";

            //    //        SqlCommand cmdcalendario = new SqlCommand(scriptCalendario, connection);
            //    //        cmdcalendario.Parameters.AddWithValue("@fecha", TextFecha.Text);
            //    //        cmdcalendario.Parameters.AddWithValue("@descripcion", TextDescripcion.Text);

                          
                //         connection.Close();
                //    }
            //      }
            //    }
        }
        }
}