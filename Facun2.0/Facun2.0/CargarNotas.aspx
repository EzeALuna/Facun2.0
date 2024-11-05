<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalProfesor.Master" AutoEventWireup="true" CodeBehind="CargarNotas.aspx.cs" Inherits="Facun2._0.CargarNotas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<form id="form1" runat="server">

    <asp:DropDownList ID="ddlMaterias" runat="server" AutoPostBack="true" 
        DataSourceID="SqlDataSourceMaterias" DataTextField="nombre" DataValueField="id_materia">
    </asp:DropDownList>

    <asp:GridView ID="GridViewAlumnosMaterias" runat="server" AutoGenerateColumns="False"
        DataSourceID="SqlDataSourceAlumnosMaterias" DataKeyNames="id_nota"
        EmptyDataText="No hay alumnos inscritos en esta materia." GridLines="None" ShowFooter="True">

        <Columns>
            <asp:BoundField DataField="DNI" HeaderText="DNI" ReadOnly="True" />
            <asp:BoundField DataField="Alumno" HeaderText="Alumno" ReadOnly="True" />
            <asp:BoundField DataField="Materia" HeaderText="Materia" ReadOnly="True" />

            <asp:TemplateField HeaderText="Trimestre">
                <ItemTemplate>
                    <%# Eval("Trimestre") %>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="ddlTrimestreFooter" runat="server">
                        <asp:ListItem Text="1er Trimestre" Value="1er Trimestre"></asp:ListItem>
                        <asp:ListItem Text="2do Trimestre" Value="2do Trimestre"></asp:ListItem>
                        <asp:ListItem Text="Final" Value="Final"></asp:ListItem>
                    </asp:DropDownList>
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Nota">
                <ItemTemplate>
                    <%# Eval("Nota") %>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="ddlNotaFooter" runat="server">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                        <asp:ListItem Text="7" Value="7"></asp:ListItem>
                        <asp:ListItem Text="8" Value="8"></asp:ListItem>
                        <asp:ListItem Text="9" Value="9"></asp:ListItem>
                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                    </asp:DropDownList>
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <FooterTemplate>
                    <asp:Button ID="btnAddNotaFooter" runat="server" Text="Añadir Nota" 
                        CommandName="Insert" />
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSourceAlumnosMaterias" runat="server"
        ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>"
        SelectCommand="
            SELECT 
                A.dni AS DNI,
                A.nombre + ' ' + A.apellido AS Alumno,
                M.nombre AS Materia,
                COALESCE(N.nota, 0) AS Nota,
                COALESCE(N.trimestre, 'Final') AS Trimestre,
                N.id_nota
            FROM Alumnos A
            JOIN Inscripciones I ON A.dni = I.dni_alumno
            JOIN Materias M ON I.id_materia = M.id_materia
            LEFT JOIN Notas_Alumnos N ON A.dni = N.dni_alumno AND M.id_materia = N.id_materia
            WHERE M.id_materia = @idMateria AND N.id_nota IS NULL"  <!-- Solo los que están cursando -->
        InsertCommand="
            INSERT INTO Notas_Alumnos (dni_alumno, id_materia, trimestre, nota, fecha) 
            VALUES (@dni_alumno, @id_materia, @trimestre, @nota, GETDATE())">

        <SelectParameters>
            <asp:ControlParameter Name="idMateria" ControlID="ddlMaterias" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>

        <InsertParameters>
            <asp:Parameter Name="dni_alumno" Type="Int32" />
            <asp:Parameter Name="id_materia" Type="Int32" />
            <asp:ControlParameter Name="trimestre" ControlID="ddlTrimestreFooter" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter Name="nota" ControlID="ddlNotaFooter" PropertyName="SelectedValue" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceMaterias" runat="server"
        ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>"
        SelectCommand="
            SELECT M.id_materia, M.nombre
            FROM Materias M
            INNER JOIN HorariosMaterias H ON M.id_materia = H.id_materia
            WHERE H.dni_profesor = @DNIProfesor">
        <SelectParameters>
            <asp:SessionParameter Name="DNIProfesor" SessionField="DNIProfesor" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</form>


</asp:Content>
