using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Facun2._0
{
    public partial class Calendario : System.Web.UI.Page
    {
        // Lista estática para simular almacenamiento de días importantes
        private static List<DateTime> diasImportantes = new List<DateTime>();

        protected void Page_Load(object sender, EventArgs e)
        {
             if (!IsPostBack)
            {
                MostrarDiasImportantes();
            }
        }

        // Método manejador del evento SelectionChanged del CalendarEdit
        protected void CalendarEdit_SelectionChanged(object sender, EventArgs e)
        {
            // Mostrar la fecha seleccionada en el label
            lblMensaje.Text = "Has seleccionado: " + CalendarEdit.SelectedDate.ToShortDateString();
        }

        // Método para manejar el botón de marcar días importantes
        protected void btnMarcar_Click(object sender, EventArgs e)
        {
            if (CalendarEdit.SelectedDate != DateTime.MinValue)
            {
                // Agregar el día seleccionado a la lista de días importantes
                diasImportantes.Add(CalendarEdit.SelectedDate);
                MostrarDiasImportantes();

                lblMensaje.Text = "Día marcado como importante: " + CalendarEdit.SelectedDate.ToShortDateString();
            }
            else
            {
                lblMensaje.Text = "Por favor, selecciona un día en el calendario.";
            }
        }

        // Método para mostrar los días importantes
        private void MostrarDiasImportantes()
        {
            lstDiasImportantes.Items.Clear();

            foreach (var dia in diasImportantes)
            {
                lstDiasImportantes.Items.Add(dia.ToShortDateString());
            }
        }
        }
    }