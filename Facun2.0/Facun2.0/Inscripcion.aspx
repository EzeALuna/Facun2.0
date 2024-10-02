<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalAlumnos.Master" AutoEventWireup="true" CodeBehind="Inscripcion.aspx.cs" Inherits="Facun2._0.Inscripcion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server"
        DataKeyNames="id_inscripcion" DataSourceID="SqlDataSource1"
        EmptyDataText="No hay registros de datos para mostrar."
        AutoGenerateEditButton="True">
        <Columns>
            <!-- Columna para mostrar y editar el nombre de la materia -->
            <asp:TemplateField HeaderText="Materia">
                <ItemTemplate>
                    <%# Eval("Materia") %> <!-- Muestra el nombre de la materia -->
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlMateria" runat="server" 
                        SelectedValue='<%# Bind("id_materia") %>' 
                        DataSourceID="SqlDataSourceMaterias" 
                        DataTextField="nombre" 
                        DataValueField="id_materia">
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>

            <!-- Columna para mostrar y editar la fecha de inscripción -->
            <asp:TemplateField HeaderText="Fecha de Inscripción">
                <ItemTemplate>
                    <%# Eval("fecha_inscripcion", "{0:yyyy-MM-dd}") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtFechaInscripcion" runat="server" 
                        Text='<%# Bind("fecha_inscripcion", "{0:yyyy-MM-dd}") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <!-- Columna para mostrar y editar el estado -->
            <asp:TemplateField HeaderText="Estado">
                <ItemTemplate>
                    <%# Eval("estado") %> <!-- Muestra el estado cuando no está en edición -->
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlEstado" runat="server" 
                        SelectedValue='<%# Bind("estado") %>'>
                        <asp:ListItem Value="A cursar" Text="A cursar"></asp:ListItem>
                        <asp:ListItem Value="Cursando" Text="Cursando"></asp:ListItem>
                        <asp:ListItem Value="Finalizada" Text="Finalizada"></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <!-- Fuente de datos para las inscripciones -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>"
        DeleteCommand="DELETE FROM [Inscripciones] WHERE [id_inscripcion] = @id_inscripcion"
        InsertCommand="INSERT INTO [Inscripciones] ([dni_alumno], [id_materia], [fecha_inscripcion], [estado]) 
                       VALUES (@dni_alumno, @id_materia, @fecha_inscripcion, @estado)"
        SelectCommand="SELECT I.id_inscripcion, I.dni_alumno, I.id_materia, I.fecha_inscripcion, I.estado, 
                              M.nombre AS Materia 
                       FROM Inscripciones I 
                       JOIN Materias M ON I.id_materia = M.id_materia"
        UpdateCommand="UPDATE [Inscripciones] 
                       SET [dni_alumno] = @dni_alumno, [id_materia] = @id_materia, [fecha_inscripcion] = @fecha_inscripcion, [estado] = @estado 
                       WHERE [id_inscripcion] = @id_inscripcion">
        <DeleteParameters>
            <asp:Parameter Name="id_inscripcion" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="dni_alumno" Type="Int32" />
            <asp:Parameter Name="id_materia" Type="Int32" />
            <asp:Parameter DbType="Date" Name="fecha_inscripcion" />
            <asp:Parameter Name="estado" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="dni_alumno" Type="Int32" />
            <asp:Parameter Name="id_materia" Type="Int32" />
            <asp:Parameter DbType="Date" Name="fecha_inscripcion" />
            <asp:Parameter Name="estado" Type="String" />
            <asp:Parameter Name="id_inscripcion" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <!-- Fuente de datos para las materias -->
    <asp:SqlDataSource ID="SqlDataSourceMaterias" runat="server"
        ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>"
        SelectCommand="SELECT id_materia, nombre FROM Materias">
    </asp:SqlDataSource>
</form>

</asp:Content>
