﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalProfesor.Master" AutoEventWireup="true" CodeBehind="CargarNotas.aspx.cs" Inherits="Facun2._0.CargarNotas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<form id="form1" runat="server">

   <asp:DropDownList ID="ddlMaterias" runat="server" AutoPostBack="True"
    DataSourceID="SqlDataSourceMaterias" DataTextField="nombre" DataValueField="id_materia"
    OnSelectedIndexChanged="ddlMaterias_SelectedIndexChanged">
</asp:DropDownList>
    <asp:Label ID="lblSelectedMateria" runat="server" Text='<%# ddlMaterias.SelectedValue %>'></asp:Label>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        DataSourceID="SqlDataSourceNotas" EmptyDataText="No hay registros de datos para mostrar."
        CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="dni_alumno,id_materia">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="dni_alumno" HeaderText="DNI Alumno" />
            <asp:BoundField DataField="trimestre" HeaderText="Trimestre" />
            <asp:BoundField DataField="nota" HeaderText="Nota" />
            <asp:BoundField DataField="fecha" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}"/>
            <asp:BoundField DataField="observaciones" HeaderText="Observaciones" />

            <asp:CommandField ShowDeleteButton="True" />

        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />

<SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
    </asp:GridView>

    <h3>Ingresar Nota</h3>
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
        
       SelectCommand="SELECT M.id_materia, M.nombre, H.dni_profesor FROM Materias AS M RIGHT OUTER JOIN HorariosMaterias AS H ON M.id_materia = H.id_materia WHERE (H.dni_profesor = @dni_profesor)">
            <SelectParameters>
             <asp:SessionParameter Name="dni_profesor" SessionField="DNI" />
            </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceAlumnos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>"
        SelectCommand="SELECT A.dni AS dni_alumno, (A.apellido + ' ' + A.nombre) AS nombre_completo
                       FROM Alumnos A
                       INNER JOIN Inscripciones N ON A.dni = N.dni_alumno
                       WHERE N.id_materia = @id_materia order by apellido">
        <SelectParameters>
            <asp:ControlParameter Name="id_materia" ControlID="ddlMaterias" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceNotas" runat="server" 
    ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>" 
    DeleteCommand="DELETE FROM Notas_Alumnos WHERE dni_alumno = @dni_alumno AND id_materia = @id_materia"
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
    <DeleteParameters>
        <asp:Parameter Name="dni_alumno" Type="Int32" />
        <asp:Parameter Name="id_materia" Type="Int32" />
    </DeleteParameters>
</asp:SqlDataSource>


</form>

</asp:Content>
