<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeleccionRegistro.aspx.cs" Inherits="Facun2._0.SeleccionRegistro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registro-Alumno-Profesor</title>
    <link rel="stylesheet" href="EstilosLogin/css/SeleccionRegistro.css">
</head>

<body>
    <form id="form1" runat="server">
    <div class="style1" align="center">
        <div class="Container">
         <h1 class="Letra">Facundo</h1>
         <asp:Image ID="Image1" runat="server" Height="125px" 
                            ImageUrl="~/Estilos/images/inst.png" Width="125px" ></asp:Image>
            <br />
            <br />
          
            <br />
         <asp:Button class="botton1" ID="Button1" runat="server" Text="Alumno" 
                onclick="Button1_Click"/>
          <br />
            <br /><br />
         <asp:Button class="botton1" ID="Button2" runat="server" Text="Profesor" 
                onclick="Button2_Click"  />
    
            <br /><br /><br />
            <br />
            <asp:HyperLink class="label2" ID="HyperLink1" runat="server" href="Login.aspx">Volver</asp:HyperLink>
        </div>

    </div>
    
    
    </form>
    </body>
</html>
