<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalAdmin.Master" AutoEventWireup="true" CodeBehind="Calendario.aspx.cs" Inherits="Facun2._0.Calendario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html lang="en">
  <head>
    <title>Sistema Facundo</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="Estilos/css/style.css">
  </head>
  <body />

        <form id="form1" runat="server">
          <!-- Sección de ver y editar calendario -->
          <div id="viewCalendar" style="display: none;">
            <h3>Calendario de Visualización</h3>
            <asp:Calendar ID="CalendarView" runat="server"></asp:Calendar>
          </div>

          <div id="editCalendar" style="display: none;">
            <h3>Calendario de Edición</h3>
            <asp:Calendar ID="CalendarEdit" runat="server" OnSelectionChanged="CalendarEdit_SelectionChanged"></asp:Calendar>
            <asp:Button ID="btnMarcar" runat="server" Text="Marcar Día Importante" OnClick="btnMarcar_Click" />
            <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
            <asp:BulletedList ID="lstDiasImportantes" runat="server"></asp:BulletedList>
          </div>
        </form>

    <!-- Scripts -->
    <script src="Estilos/js/jquery.min.js"></script>
    <script src="Estilos/js/popper.js"></script>
    <script src="Estilos/js/bootstrap.min.js"></script>
    <script src="Estilos/js/main.js"></script>

    <!-- JavaScript para alternar entre ver y editar calendario -->
    <script>
        $(document).ready(function () {
            // Mostrar Calendario de Visualización
            $('#showViewCalendar').click(function () {
                $('#viewCalendar').show();
                $('#editCalendar').hide();
            });

            // Mostrar Calendario de Edición
            $('#showEditCalendar').click(function () {
                $('#editCalendar').show();
                $('#viewCalendar').hide();
            });
        });
    </script>
  </body>
</html>

</asp:Content>
