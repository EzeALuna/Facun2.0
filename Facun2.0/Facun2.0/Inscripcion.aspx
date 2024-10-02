<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalAlumnos.Master" AutoEventWireup="true" CodeBehind="Inscripcion.aspx.cs" Inherits="Facun2._0.Inscripcion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
        EmptyDataText="No hay registros para mostrar." AutoGenerateEditButton="True" >
        <Columns>
            <asp:BoundField DataField="id_horario" HeaderText="ID Horario" ReadOnly="True" />

            <asp:TemplateField HeaderText="Profesor">
                <ItemTemplate>
                    <%# Eval("NombreProfesor") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlProfesor" runat="server" 
                        SelectedValue='<%# Bind("dni_profesor") %>' 
                        DataSourceID="SqlDataSourceProfesores" 
                        DataTextField="nombre" 
                        DataValueField="dni">
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Materia">
                <ItemTemplate>
                    <%# Eval("NombreMateria") %>
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

            <asp:TemplateField HeaderText="Carrera">
                <ItemTemplate>
                    <%# Eval("NombreCarrera") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlCarrera" runat="server" 
                        SelectedValue='<%# Bind("id_carrera") %>' 
                        DataSourceID="SqlDataSourceCarreras" 
                        DataTextField="nombre" 
                        DataValueField="id_carrera">
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="dia" HeaderText="Día" />
            <asp:BoundField DataField="modulo" HeaderText="Módulo" />
            <asp:BoundField DataField="observaciones" HeaderText="Observaciones" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>"
        SelectCommand="SELECT 
                           H.id_horario,
                            H.dni_profesor,
                           P.nombre AS NombreProfesor,
                           M.nombre AS NombreMateria,
                           H.dia,
                           H.modulo,
                           C.nombre AS NombreCarrera,
                           H.observaciones 
                        FROM 
                           HorariosMaterias H
                        LEFT JOIN 
                           Profesores P ON H.dni_profesor = P.dni
                        LEFT JOIN 
                           Materias M ON H.id_materia = M.id_materia
                        LEFT JOIN 
                           Carreras C ON M.id_carrera = C.id_carrera;"
        UpdateCommand="UPDATE HorariosMaterias 
                       SET dni_profesor=@dni_profesor, id_materia=@id_materia, dia=@dia, modulo=@modulo, 
                           id_carrera=@id_carrera, observaciones=@observaciones 
                       WHERE id_horario=@id_horario"
        DeleteCommand="DELETE FROM HorariosMaterias WHERE id_horario=@id_horario">
        <UpdateParameters>
            <asp:Parameter Name="dni_profesor" Type="Int32" />
            <asp:Parameter Name="id_materia" Type="Int32" />
            <asp:Parameter Name="dia" Type="String" />
            <asp:Parameter Name="modulo" Type="Int32" />
            <asp:Parameter Name="id_carrera" Type="Int32" />
            <asp:Parameter Name="observaciones" Type="String" />
            <asp:Parameter Name="id_horario" Type="Int32" />
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
