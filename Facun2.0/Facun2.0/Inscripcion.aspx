<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalAlumnos.Master" AutoEventWireup="true" CodeBehind="Inscripcion.aspx.cs" Inherits="Facun2._0.Inscripcion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
        EmptyDataText="No hay registros para mostrar." AutoGenerateEditButton="True">
        <Columns>
            <asp:BoundField DataField="id_horario" HeaderText="ID Horario" ReadOnly="True" />
            <asp:BoundField DataField="NombreProfesor" HeaderText="Profesor" ReadOnly="True" />
            <asp:BoundField DataField="NombreMateria" HeaderText="Materia" ReadOnly="True" />
            <asp:BoundField DataField="NombreCarrera" HeaderText="Carrera" ReadOnly="True" />
            <asp:BoundField DataField="dia" HeaderText="Día" ReadOnly="True" />
            <asp:BoundField DataField="modulo" HeaderText="Módulo" ReadOnly="True" />

            <asp:TemplateField HeaderText="Estado">
                <ItemTemplate>
                    <%# Eval("estado") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlEstado" runat="server" 
                        SelectedValue='<%# Bind("estado") %>'>
                        <asp:ListItem Text="Activo" Value="Activo"></asp:ListItem>
                        <asp:ListItem Text="Inactivo" Value="Inactivo"></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>"
        SelectCommand="SELECT 
                           H.id_horario,
                           P.nombre AS NombreProfesor,
                           M.nombre AS NombreMateria,
                           H.dia,
                           H.modulo,
                           C.nombre AS NombreCarrera,
                           I.estado 
                        FROM 
                           HorariosMaterias H
                        LEFT JOIN 
                           Profesores P ON H.dni_profesor = P.dni
                        LEFT JOIN 
                           Materias M ON H.id_materia = M.id_materia
                        LEFT JOIN 
                           Carreras C ON M.id_carrera = C.id_carrera
                        LEFT JOIN 
                           Inscripciones I ON I.id_materia = H.id_materia;"
        UpdateCommand="UPDATE Inscripciones 
                       SET estado=@estado 
                       WHERE id_inscripcion=@id_inscripcion"
        DeleteCommand="DELETE FROM Inscripciones WHERE id_inscripcion=@id_inscripcion">
        <UpdateParameters>
            <asp:Parameter Name="estado" Type="String" />
            <asp:Parameter Name="id_inscripcion" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceMaterias" runat="server"
        ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>"
        SelectCommand="SELECT id_materia, nombre FROM Materias">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceProfesores" runat="server"
        ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>"
        SelectCommand="SELECT dni, nombre FROM Profesores">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceCarreras" runat="server"
        ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>"
        SelectCommand="SELECT id_carrera, nombre FROM Carreras">
    </asp:SqlDataSource>
</form>


</asp:Content>
