﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Facun2._0
{
    public partial class SituacionAcademica : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
              if (!Page.IsPostBack)
            {
                // Verifica el usuario 
                if (Session["DNI"] == null || string.IsNullOrEmpty(Session["Usuario"].ToString()))
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
                        
                    }
                    else
                    {
                        // Si el rol no es valido
                        Response.Redirect("Login.aspx");
                    }
                }
            }
        }
    }
}