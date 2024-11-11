<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalAlumnos.Master" AutoEventWireup="true" CodeBehind="NosotrosA.aspx.cs" Inherits="Facun2._0.NosotrosA" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link rel="stylesheet" href="EstilosLogin/css/Nosotros.css"> 
    <form id="form1" runat="server">
    <div align="center" 
        style="margin: 10px; width: 100%; height: 150px; display: flex;">
        
    <div class="conteiner" align="center">
        <asp:Image ID="Image2" runat="server" EnableTheming="True"
            ImageAlign="Left" ImageUrl="~/Estilos/images/And.jpg" 
            CssClass="ima" />
        <h3>Luna Ezequiel</h3>
        <p style="font-size: 11px">Tec. en Programacion</p>
    </div>
    <div class="conteiner" align="center">
        <asp:Image ID="Image1" runat="server" EnableTheming="True" 
            ImageAlign="Left" ImageUrl="~/Estilos/images/RJ.jpeg" 
            CssClass="ima" />
        <h3>Ramirez Jeremias</h3>
        <p style="font-size: 11px">Tec. en Programacion</p>
    </div>

    </div>

    <div align="center" 
        style="margin: 10px; width: 100%; height: 150px; display: flex;">
        
    <div class="conteiner" align="center">
        <asp:Image ID="Image3" runat="server" EnableTheming="True" 
            ImageAlign="Left"  ImageUrl="~/Estilos/images/Jon.png" CssClass="ima"  />
        <h3>Segovia Jonathan</h3>
        <p style="font-size: 11px">Tec. en Programacion</p>
    </div>
    <div class="conteiner" align="center">
        <asp:Image ID="Image4" runat="server" EnableTheming="True"
            ImageAlign="Left" ImageUrl="~/Estilos/images/HZZ.jpg" 
            CssClass="ima"  />
        <h3>Zarate Hugo</h3>
        <p style="font-size: 11px">Tec. en Programacion</p>
    </div>
 

    </div>

    </form>
</asp:Content>
