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
    public partial class CalendarioAlumnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Trae el DNI de la persona que inicia sesion.
            if (!IsPostBack)
            {
                CargarDatos();
                string valor = Session["DNI"] as string; // Obtener el valor de la sesión
                if (!string.IsNullOrEmpty(valor))
                {
                    Textalumnos.Text = valor; // Asignar el valor a un TextBox
                }
            }
            if (!IsPostBack)
            {
                // Inicializar el TextBox sin valor
                lblMensaje1.Text = string.Empty; // Esto es opcional, ya que por defecto es vacío
            }
        }
          protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            lblMensaje1.Text = Calendar1.SelectedDate.ToLongDateString();
        }

          protected void btnGuardar_Click(object sender, EventArgs e)
          {
              string dniSeleccionado = Textalumnos.Text;
              DateTime fechaSeleccionada = Calendar1.SelectedDate;
              string descripcion = txtDescripcion.Text;
              string tipo = ListTipo.Text;

              string connectionString = ConfigurationManager.ConnectionStrings["CadenaConexionPP2024"].ConnectionString;
              using (SqlConnection connection = new SqlConnection(connectionString))
              {
                  string query = "INSERT INTO Calendario (DNI, Fecha, Descripcion, Tipo) VALUES (@DNI, @Fecha, @Descripcion, @Tipo)";
                  SqlCommand command = new SqlCommand(query, connection);
                  command.Parameters.AddWithValue("@DNI", dniSeleccionado);
                  command.Parameters.AddWithValue("@Fecha", fechaSeleccionada);
                  command.Parameters.AddWithValue("@Descripcion", descripcion);
                  command.Parameters.AddWithValue("@Tipo", tipo);

                  try
                  {
                      connection.Open();
                      command.ExecuteNonQuery();
                      lblMensaje1.Text = "Registro guardado exitosamente.";
                      CargarDatos(); // Cargar datos en el GridView después de guardar
                  }
                  catch (Exception ex)
                  {
                      lblMensaje1.Text = "Error: " + ex.Message;
                  }
              }
          }
          private void CargarDatos()
          {
              string connectionString = ConfigurationManager.ConnectionStrings["CadenaConexionPP2024"].ConnectionString;
              using (SqlConnection connection = new SqlConnection(connectionString))
              {
                  string query = "SELECT Fecha, Descripcion, Tipo FROM Calendario WHERE dni = " + Textalumnos.Text;
                  SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                  DataTable dt = new DataTable();

                  try
                  {
                      connection.Open();
                      adapter.Fill(dt);
                      GridView1.DataSource = dt;
                      GridView1.DataBind();
                  }
                  catch (Exception ex)
                  {
                      lblMensaje1.Text = "Error al cargar datos: " + ex.Message;
                  }
              }
          }
    }    
}