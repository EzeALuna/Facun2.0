<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalAlumnos.Master" AutoEventWireup="true" CodeBehind="SituacionAcademica.aspx.cs" Inherits="Facun2._0.Alumno.SituacionAcademica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
        EmptyDataText="No hay registros de datos para mostrar." CellPadding="4" 
        ForeColor="#333333" GridLines="None" Width="80%" DataKeyNames="dni" 
        AllowSorting="True">
        <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="dni" HeaderText="dni" 
            SortExpression="dni" ReadOnly="True" />
        <asp:BoundField DataField="nombre" HeaderText="nombre" 
            SortExpression="nombre" />
        <asp:BoundField DataField="estado" HeaderText="estado" 
            SortExpression="estado" />

        <asp:BoundField DataField="año" HeaderText="año" SortExpression="año" />

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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>" 
        SelectCommand="SELECT DISTINCT A.dni, C.nombre, C.estado, C.año FROM Alumnos AS A 
        INNER JOIN Carreras AS B ON A.id_carrera = B.id_carrera INNER JOIN Materias AS C 
        ON B.id_carrera = C.id_carrera 
        WHERE (A.dni = @DNI) ORDER BY C.año">
    <SelectParameters>
        <asp:CookieParameter CookieName="dni" Name="DNI" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
</form>
</asp:Content>
