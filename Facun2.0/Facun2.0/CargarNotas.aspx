<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalProfesor.Master" AutoEventWireup="true" CodeBehind="CargarNotas.aspx.cs" Inherits="Facun2._0.CargarNotas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<form id="form1" runat="server">

   <asp:DropDownList ID="ddlMaterias" runat="server" AutoPostBack="true"
    DataSourceID="SqlDataSourceMaterias" DataTextField="nombre" DataValueField="id_materia"
    OnSelectedIndexChanged="ddlMaterias_SelectedIndexChanged">
</asp:DropDownList>
    <asp:Label ID="lblSelectedMateria" runat="server" Text='<%# ddlMaterias.SelectedValue %>'></asp:Label>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        DataSourceID="SqlDataSourceNotas" EmptyDataText="No hay registros de datos para mostrar."
        CellPadding="4" ForeColor="#333333" GridLines="None">
        <Columns>
            <asp:BoundField DataField="dni_alumno" HeaderText="DNI Alumno" />
            <asp:BoundField DataField="trimestre" HeaderText="Trimestre" />
            <asp:BoundField DataField="nota" HeaderText="Nota" />
            <asp:BoundField DataField="fecha" HeaderText="Fecha" />
            <asp:BoundField DataField="observaciones" HeaderText="Observaciones" />
        </Columns>
    </asp:GridView>

    <h3>Ingresar Nueva Nota</h3>
    <label for="ddlAlumnos">Alumno:</label>
    <asp:DropDownList ID="ddlAlumnos" runat="server" DataSourceID="SqlDataSourceAlumnos"
        DataTextField="nombre_completo" DataValueField="dni_alumno" OnClick="btnInsertarNota_Click">
    </asp:DropDownList>

    <label for="ddlTrimestre">Trimestre:</label>
    <asp:DropDownList ID="ddlTrimestre" runat="server">
        <asp:ListItem>1er Trimestre</asp:ListItem>
        <asp:ListItem>2do Trimestre</asp:ListItem>
        <asp:ListItem>Final</asp:ListItem>
    </asp:DropDownList>

    <label for="ddlNota">Nota:</label>
    <asp:DropDownList ID="ddlNota" runat="server">
        <asp:ListItem Value="0">0</asp:ListItem>
        <asp:ListItem Value="1">1</asp:ListItem>
        <asp:ListItem Value="2">2</asp:ListItem>
        <asp:ListItem Value="3">3</asp:ListItem>
        <asp:ListItem Value="4">4</asp:ListItem>
        <asp:ListItem Value="5">5</asp:ListItem>
        <asp:ListItem Value="6">6</asp:ListItem>
        <asp:ListItem Value="7">7</asp:ListItem>
        <asp:ListItem Value="8">8</asp:ListItem>
        <asp:ListItem Value="9">9</asp:ListItem>
        <asp:ListItem Value="10">10</asp:ListItem>
    </asp:DropDownList>

    <label for="txtObservaciones">Observaciones:</label>
    <asp:TextBox ID="txtObservaciones" runat="server"></asp:TextBox>

    <asp:Button ID="btnAgregarNota" runat="server" Text="Agregar Nota" OnClick="btnAgregarNota_Click" />


    <asp:SqlDataSource ID="SqlDataSourceMaterias" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>"
        SelectCommand="SELECT M.id_materia, M.nombre 
                   FROM Materias M
                   JOIN HorariosMaterias H ON M.id_materia = H.id_materia
                   WHERE H.dni_profesor = 12345678">
            <SelectParameters>
             <asp:SessionParameter Name="DNIProfesor" SessionField="DNIProfesor" Type="Int32" />
            </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceAlumnos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>"
        SelectCommand="SELECT A.dni AS dni_alumno, (A.nombre + ' ' + A.apellido) AS nombre_completo
                       FROM Alumnos A
                       INNER JOIN Inscripciones N ON A.dni = N.dni_alumno
                       WHERE N.id_materia = @id_materia">
        <SelectParameters>
            <asp:ControlParameter Name="id_materia" ControlID="ddlMaterias" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceNotas" runat="server" 
    ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>" 
    InsertCommand="INSERT INTO Notas_Alumnos (dni_alumno, id_materia, trimestre, nota, fecha, observaciones) VALUES (@dni_alumno, @id_materia, @trimestre, @nota, GETDATE(), @observaciones)"
    SelectCommand="SELECT N.dni_alumno, N.id_materia, N.trimestre, N.nota, N.fecha, N.observaciones 
                   FROM Notas_Alumnos N
                   WHERE N.id_materia = @id_materia">
    <SelectParameters>
        <asp:ControlParameter Name="id_materia" ControlID="ddlMaterias" PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="dni_alumno" Type="Int32" />
        <asp:Parameter Name="id_materia" Type="Int32" />
        <asp:Parameter Name="trimestre" Type="String" />
        <asp:Parameter Name="nota" Type="Int32" />
        <asp:Parameter Name="observaciones" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>


</form>


</asp:Content>
