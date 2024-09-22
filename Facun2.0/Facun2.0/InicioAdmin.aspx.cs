using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Facun2._0
{
    public partial class InicioAdmin : System.Web.UI.Page
    {
        // Lista para almacenar días importantes
        private static List<DateTime> diasImportantes = new List<DateTime>();

        protected void Page_Load(object sender, EventArgs e)
        {
             if (!IsPostBack)
            {
                MostrarDiasImportantes();
            }
        }

        protected void CalendarEdit_SelectionChanged(object sender, EventArgs e)
        {
            lblMensaje.Text = "Has seleccionado: " + CalendarEdit.SelectedDate.ToShortDateString();
        }

        protected void btnMarcar_Click(object sender, EventArgs e)
        {
            if (CalendarEdit.SelectedDate != DateTime.MinValue)
            {
                diasImportantes.Add(CalendarEdit.SelectedDate);
                MostrarDiasImportantes();
                lblMensaje.Text = "Día marcado como importante: " + CalendarEdit.SelectedDate.ToShortDateString();
            }
            else
            {
                lblMensaje.Text = "Por favor, selecciona un día en el calendario.";
            }
        }

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