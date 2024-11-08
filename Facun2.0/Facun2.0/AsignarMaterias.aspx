<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalAdmin.Master" AutoEventWireup="true" CodeBehind="AsignarMaterias.aspx.cs" Inherits="Facun2._0.AsignarMaterias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="id_horario" DataSourceID="SqlDataSource1" 
        EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="dni_profesor" HeaderText="dni_profesor" 
                SortExpression="dni_profesor" />
            <asp:BoundField DataField="id_materia" HeaderText="id_materia" 
                SortExpression="id_materia" />
            <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
            <asp:BoundField DataField="modulo" HeaderText="modulo" 
                SortExpression="modulo" />
            <asp:BoundField DataField="carrera" HeaderText="carrera" 
                SortExpression="carrera" />
            <asp:BoundField DataField="observaciones" HeaderText="observaciones" 
                SortExpression="observaciones" />
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
    </asp:GridView>

    <h3>Asignar Horarios y Materias</h3>
    <label for="ddlProfesor">Profe:</label>
    <asp:DropDownList ID="ddlPRofesor" runat="server" DataSourceID="SqlDataSourceProfesor"
        DataTextField="nombre_completo" DataValueField="dni_profesor" OnClick="btnInsertarHorario_Click">
    </asp:DropDownList>

        <label for="ddlMateria">Materia:</label>
    <asp:DropDownList ID="ddlMateria" runat="server" DataSourceID="SqlDataSourceMateria"
        DataTextField="nombre_completo" DataValueField="id_materia" >
    </asp:DropDownList>

    <label for="ddlDia">Dia:</label>
    <asp:DropDownList ID="ddlDia" runat="server">
        <asp:ListItem>Luenes</asp:ListItem>
        <asp:ListItem>Martes</asp:ListItem>
        <asp:ListItem>Miercoles</asp:ListItem>
        <asp:ListItem>Jueves</asp:ListItem>
        <asp:ListItem>Viernes</asp:ListItem>
    </asp:DropDownList>

       <label for="ddlModulo">Dia:</label>
    <asp:DropDownList ID="ddlModulo" runat="server">
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>5</asp:ListItem>
    </asp:DropDownList>

    <label for="ddlCarrera">Carrera:</label>
    <asp:DropDownList ID="ddlCarrera" runat="server" DataSourceID="SqlDataSourceCarrera"
        DataTextField="Carrera" DataValueField="carrera" >
    </asp:DropDownList>

    <label for="txtObservaciones">Observaciones:</label>
    <asp:TextBox ID="txtObservaciones" runat="server"></asp:TextBox>

    <asp:Button ID="btnAgregarNota" runat="server" Text="Agregar Nota" OnClick="btnAgregarNota_Click" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>" 
        DeleteCommand="DELETE FROM [HorariosMaterias] WHERE [id_horario] = @id_horario" 
        InsertCommand="INSERT INTO [HorariosMaterias] ([dni_profesor], [id_materia], [dia], [modulo], [carrera], [observaciones]) VALUES (@dni_profesor, @id_materia, @dia, @modulo, @carrera, @observaciones)" 
        ProviderName="<%$ ConnectionStrings:Facun2DBConnectionString1.ProviderName %>" 
        SelectCommand="SELECT [id_horario], [dni_profesor], [id_materia], [dia], [modulo], [carrera], [observaciones] FROM [HorariosMaterias]" 
        UpdateCommand="UPDATE [HorariosMaterias] SET [dni_profesor] = @dni_profesor, [id_materia] = @id_materia, [dia] = @dia, [modulo] = @modulo, [carrera] = @carrera, [observaciones] = @observaciones WHERE [id_horario] = @id_horario">
        <DeleteParameters>
            <asp:Parameter Name="id_horario" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="dni_profesor" Type="Int32" />
            <asp:Parameter Name="id_materia" Type="Int32" />
            <asp:Parameter Name="dia" Type="String" />
            <asp:Parameter Name="modulo" Type="Int32" />
            <asp:Parameter Name="carrera" Type="String" />
            <asp:Parameter Name="observaciones" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="dni_profesor" Type="Int32" />
            <asp:Parameter Name="id_materia" Type="Int32" />
            <asp:Parameter Name="dia" Type="String" />
            <asp:Parameter Name="modulo" Type="Int32" />
            <asp:Parameter Name="carrera" Type="String" />
            <asp:Parameter Name="observaciones" Type="String" />
            <asp:Parameter Name="id_horario" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceProfesor" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>"
        SelectCommand="SELECT A.dni, (A.nombre + ' ' + A.apellido) AS nombre
                       FROM Profesores A WHERE A.dni = @dni">
        <SelectParameters>
            <asp:ControlParameter Name="dni" ControlID="ddlProfesor" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSourceMateria" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>"
        SelectCommand="SELECT id_materia AS materia
                       FROM Materias WHERE id_materia = @id_materia">
        <SelectParameters>
            <asp:ControlParameter Name="id_materia" ControlID="ddlMateria" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

      <asp:SqlDataSource ID="SqlDataCarrera" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>"
        SelectCommand="SELECT id_carrera AS Carrera
                       FROM Carreras WHERE id_carrera = @id_carrera">
        <SelectParameters>
            <asp:ControlParameter Name="id_carrera" ControlID="ddlCarrera" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</asp:Content>
