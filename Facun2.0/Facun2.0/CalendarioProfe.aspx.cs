using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Facun2._0
{
    public partial class CalendarioProfe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             if (!IsPostBack)
            {
                CargarDatos();
            }
        }
        private void CargarDatos()
        {
            
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            lblMensaje1.Text = Calendar1.SelectedDate.ToLongDateString();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            //Asigna los valores de las fecha del calendario y descripcion en variables.
              //string dniSeleccionado = Textalumnos.Text;
              DateTime fechaSeleccionada = Calendar1.SelectedDate;
              string descripcion = txtDescripcion.Text;
              string tipo = ListTipo.Text;

              //abre base de datos
              string connectionString = ConfigurationManager.ConnectionStrings["CadenaConexionPP2024"].ConnectionString;

              string queryy = "SELECT Fecha, Descripcion, Tipo FROM CalendarioProfe WHERE dni = " + Session["DNI"];

              using (SqlConnection connection = new SqlConnection(connectionString))
              {
                  connection.Open();
                  //Guarda las variables asignadas en los atributos de SQL
                  string query = "INSERT INTO CalendarioProfe (DNI, Fecha, Descripcion, Tipo) VALUES (@DNI, @Fecha, @Descripcion, @Tipo)";
                  SqlCommand command = new SqlCommand(query, connection);
                  command.Parameters.AddWithValue("@DNI", Session["DNI"]);
                  command.Parameters.AddWithValue("@Fecha", fechaSeleccionada);
                  command.Parameters.AddWithValue("@Descripcion", descripcion);
                  command.Parameters.AddWithValue("@Tipo", tipo);
                  command.ExecuteNonQuery();
                  Response.Redirect(Request.RawUrl);

                  connection.Close();
        }
    }
    }
}