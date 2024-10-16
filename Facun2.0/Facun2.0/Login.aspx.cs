﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Facun2._0
{
    public partial class Login1 : System.Web.UI.Page
    {
        private static string Cadena = ConfigurationManager.ConnectionStrings["CadenaConexionPP2024"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(Cadena))
            {

                SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
                //EZE
                //builder.DataSource = "DESKTOP-QSS2PVA\\SQLEXPRESS";

                //ESCUELA
                //builder.DataSource = "DESKTOP-U48JRI6\\SQLEXPRESS";

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
                    conn.Open();

                    // Consulta las tres tablas
                    string queryAlumnos = "SELECT Tipo FROM Alumnos WHERE DNI = " + txtDNI.Text + " AND" + " CONTRASEÑA = '" + txtContraseña.Text + "'"; ;
                    string queryProfesores = "SELECT Tipo FROM Profesores WHERE DNI = " + txtDNI.Text + " AND" + " CONTRASEÑA = '" + txtContraseña.Text + "'"; ;
                    string queryAdmin = "SELECT Tipo FROM Admin WHERE DNI = " + txtDNI.Text + " AND" + " CONTRASEÑA = '" + txtContraseña.Text + "'"; ;

                    // 
                    SqlCommand commandAlumnos = new SqlCommand(queryAlumnos, conn);
                    SqlCommand commandProfesores = new SqlCommand(queryProfesores, conn);
                    SqlCommand commandAdmin = new SqlCommand(queryAdmin, conn);

                    // parámetros para las tres consultas
                    //commandAlumnos.Parameters.AddWithValue("@DNI", txtDNI.Text);
                    //commandAlumnos.Parameters.AddWithValue("@Contraseña", txtContraseña.Text);

                    //commandProfesores.Parameters.AddWithValue("@DNI", txtDNI.Text);
                    //commandProfesores.Parameters.AddWithValue("@Contraseña", txtContraseña.Text);

                    //commandAdmin.Parameters.AddWithValue("@DNI", txtDNI.Text);
                    //commandAdmin.Parameters.AddWithValue("@Contraseña", txtContraseña.Text);

                    // Verificar si el usuario es un Alumno
                    using (SqlDataReader readerAlumnos = commandAlumnos.ExecuteReader())
                    {
                        if (readerAlumnos.Read())
                        {
                            string tipo = readerAlumnos["Tipo"].ToString();
                            Session["DNI"] = txtDNI.Text;
                            Session["Usuario"] = "alumno";
                            Response.Redirect("InicioAlumno.aspx");
                        }
                    }

                    // Verificar si el usuario es un Profe
                    using (SqlDataReader readerProfesores = commandProfesores.ExecuteReader())
                    {
                        if (readerProfesores.Read())
                        {
                            string tipo = readerProfesores["Tipo"].ToString();
                            Session["DNI"] = txtDNI.Text;
                            Session["Usuario"] = "profesor";
                            Response.Redirect("InicioProfesor.aspx");
                        }
                    }

                    // Verificar si el usuario es un Admin
                    using (SqlDataReader readerAdmin = commandAdmin.ExecuteReader())
                    {
                        if (readerAdmin.Read())
                        {
                            string tipo = readerAdmin["Tipo"].ToString();
                            Session["DNI"] = txtDNI.Text;
                            Session["Usuario"] = "admin";
                            Response.Redirect("InicioAdmin.aspx");
                        }
                    }

                    lblTexto.Text = "Usuario o Contraseña incorrectos.";
                    lblTexto.ForeColor = System.Drawing.Color.Red;
                    lblTexto.Focus();
                }

            }
        }
               
    }
}