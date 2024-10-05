<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalAlumnos.Master" AutoEventWireup="true" CodeBehind="Inscripcion.aspx.cs" Inherits="Facun2._0.Inscripcion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
        EmptyDataText="No hay registros para mostrar." DataKeyNames="id_inscripcion">
        <Columns>
            <asp:BoundField DataField="id_inscripcion" HeaderText="ID Inscripción" ReadOnly="True" Visible="False" />
            <asp:BoundField DataField="id_horario" HeaderText="ID Horario" ReadOnly="True" Visible="False" />
            <asp:BoundField DataField="NombreProfesor" HeaderText="Profesor" ReadOnly="True" Visible="False"/>
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
            <asp:ListItem Text="A cursar" Value="A cursar"></asp:ListItem>
        </asp:DropDownList>
    </EditItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <!-- Botón Editar -->
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar"></asp:Button>
                </ItemTemplate>
                <EditItemTemplate>
                    <!-- Botón Actualizar -->
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar"></asp:Button>
                    <p></p>
                    <!-- Botón Cancelar -->
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar"></asp:Button>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>

         <EditRowStyle BackColor="#bdc9f2" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
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
                        I.id_inscripcion,
                        I.estado
                     FROM 
    Inscripciones I 
 JOIN 
    Alumnos A ON I.dni_alumno = A.dni
 JOIN 
    Carreras C ON A.id_carrera = C.id_carrera
 JOIN 
    Materias M ON I.id_materia = M.id_materia
left JOIN 
    HorariosMaterias H ON H.id_materia = M.id_materia
left JOIN 
    Profesores P ON H.dni_profesor = P.dni
WHERE A.dni = @dniAlumno;;"
        UpdateCommand="UPDATE [Inscripciones] SET [estado] = @estado WHERE [id_inscripcion] = @id_inscripcion"
   
        DeleteCommand="DELETE FROM Inscripciones WHERE id_inscripcion=@id_inscripcion">
        
        <SelectParameters>
            <asp:SessionParameter Name="dniAlumno" SessionField="dni" Type="String" />
        </SelectParameters>

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
