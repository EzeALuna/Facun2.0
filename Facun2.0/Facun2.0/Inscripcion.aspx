<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalAlumnos.Master" AutoEventWireup="true" CodeBehind="Inscripcion.aspx.cs" Inherits="Facun2._0.Inscripcion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link rel="stylesheet" href="EstilosLogin/css/Titulos.css">

    <form id="form1" runat="server">
    <div>
    <h3 class="Titulo" align="center">Situacion Actual</h3
    </div>
    <div align="center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
        EmptyDataText="No hay registros para mostrar." 
        DataKeyNames="id_inscripcion" CellPadding="10" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id_inscripcion" HeaderText="ID Inscripción" ReadOnly="True" Visible="False" />
            <asp:BoundField DataField="NombreMateria" HeaderText="Materia" ReadOnly="True" />
            <asp:BoundField DataField="NombreCarrera" HeaderText="Carrera" ReadOnly="True" />
            <asp:BoundField DataField="dia" HeaderText="Día" ReadOnly="True" Visible="False"/>
            <asp:BoundField DataField="modulo" HeaderText="Módulo" ReadOnly="True" Visible="False" />
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

        <asp:TemplateField HeaderText="Anular">
            <ItemTemplate>
                <asp:Button ID="btnEliminar" runat="server" Text="Anular" CommandName="Delete"
                    CommandArgument='<%# Eval("id_inscripcion") %>'
                    OnClientClick="return confirm('¿Está seguro de que desea anular la inscripción?');" />
            </ItemTemplate>

            <ControlStyle CssClass="botton2" />

            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#4756CA" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    </div>
<br />
    <div class="w-100">
    <h3 class="Titulo" align="center">Inscripcion a materias</h3>
    </div>

    <div align="center">
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id_materia"
        DataSourceID="SqlDataSource2" 
        EmptyDataText="No hay materias de datos para mostrar." 
        OnRowCommand="GridView2_RowCommand" CellPadding="10" ForeColor="#333333" 
        GridLines="None" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id_materia" HeaderText="ID Materia" ReadOnly="True" Visible="False" />
            <asp:BoundField DataField="nombre" HeaderText="Materia" />
            <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
            <asp:TemplateField HeaderText="Inscribirse">
                <ItemTemplate>
                    <asp:Button ID="btnSeleccionar" runat="server" Text="Inscribirse" CommandName="Seleccionar"
                        CommandArgument='<%# Eval("id_materia") %>' />
                </ItemTemplate>
                <ControlStyle CssClass="botton2" />
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#4756CA" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    </div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server"
    ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>"
    SelectCommand="SELECT I.id_inscripcion, M.nombre AS NombreMateria, C.nombre AS NombreCarrera, H.dia, H.modulo, I.estado
    FROM Inscripciones I 
    JOIN Alumnos A ON I.dni_alumno = A.dni
    LEFT JOIN Carreras C ON A.id_carrera = C.id_carrera
    LEFT JOIN Materias M ON I.id_materia = M.id_materia
    LEFT JOIN HorariosMaterias H ON H.id_materia = M.id_materia
    WHERE A.dni = @DNI"
    UpdateCommand="UPDATE Inscripciones SET estado = @estado WHERE id_inscripcion = @id_inscripcion"
    DeleteCommand="DELETE FROM [Inscripciones] WHERE [id_inscripcion] = @id_inscripcion">
    <SelectParameters>
        <asp:SessionParameter Name="dni" SessionField="DNI" Type="String" /> 
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="estado" Type="String" />
        <asp:Parameter Name="id_inscripcion" Type="Int32" />
    </UpdateParameters>
         <DeleteParameters>
            <asp:Parameter Name="id_inscripcion" Type="Int32" />
        </DeleteParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource2" runat="server"
    ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>"
    SelectCommand="
        SELECT M.id_materia, M.nombre, M.descripcion
FROM Materias M
JOIN Alumnos A ON A.id_carrera = M.id_carrera
LEFT JOIN Correlativas C ON C.id_materia = M.id_materia
LEFT JOIN Inscripciones I ON I.id_materia = C.id_materia_requisito AND I.dni_alumno = A.dni AND I.estado = 'Aprobado'
WHERE A.dni = @DNI
    AND (C.id_materia_requisito IS NULL OR I.estado = 'Aprobado')
    AND M.id_materia NOT IN (
        SELECT id_materia
        FROM Inscripciones
        WHERE dni_alumno = @DNI
    );">
    <SelectParameters>
        <asp:SessionParameter Name="dni" SessionField="DNI" Type="Int32" /> 
    </SelectParameters>
</asp:SqlDataSource>


</form>
</asp:Content>
