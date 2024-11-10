<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalAdmin.Master" AutoEventWireup="true" CodeBehind="AsignarMaterias.aspx.cs" Inherits="Facun2._0.AsignarMaterias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="EstilosLogin/css/Titulos.css"> 
    <form id="form1" runat="server">

    <div align="center width: 100%; height: 100%;">
    <h3 class="Titulo" align="center">Asignar Horarios y Materias    </h3>

    <div align="center" 
            style="margin: 10px; display: inline-block; width: 100%; height: 20%;">
    <asp:Label CssClass="label" ID="Profesoreslabel" runat="server" Text="Profesores"></asp:Label>
    <asp:DropDownList CssClass="Celda" ID="DropDownList2" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="apellido" DataValueField="dni">
    </asp:DropDownList>
        <asp:Label CssClass="label" ID="Materiaslabel" runat="server" Text="Materias"></asp:Label>
    <asp:DropDownList CssClass="Celda" ID="DropDownList3" runat="server" 
        DataSourceID="SqlDataSource3" DataTextField="nombre" DataValueField="Expr1">
    </asp:DropDownList>
        <br />
         <br />
    <asp:Label CssClass="label" ID="Dialabel" runat="server" Text="Dia"></asp:Label>
    <asp:DropDownList CssClass="Celda" ID="DropDownList1" runat="server" AutoPostBack="True">
        <asp:ListItem Value="Lunes"></asp:ListItem>
        <asp:ListItem Value="Martes"></asp:ListItem>
        <asp:ListItem Value="Miercoles"></asp:ListItem>
        <asp:ListItem Value="Jueves"></asp:ListItem>
        <asp:ListItem Value="Viernes"></asp:ListItem>
    </asp:DropDownList>
       <asp:Label CssClass="label" ID="Carreralabel" runat="server" Text="Carrera"></asp:Label>
    <asp:DropDownList CssClass="Celda" ID="DropDownList5" runat="server" 
        DataSourceID="SqlDataSource4" DataTextField="nombre" DataValueField="Expr1">
    </asp:DropDownList>
     <br /> <br />
    <asp:Label CssClass="label" ID="Observacioneslabel" runat="server" Text="Observaciones"></asp:Label>
    <asp:TextBox CssClass="Celda" ID="TextBox1" runat="server"></asp:TextBox>
     <br /> <br />
    <asp:Button class="botton1" ID="Button1" runat="server" Text="Guardar" onclick="Button1_Click" />
        </div>
    
    <div style="margin: 10px; display: inline-block; width: 100%; height: 80%;" 
            align="center">
    <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_horario" 
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id_horario" HeaderText="id_horario" 
                InsertVisible="False" ReadOnly="True" SortExpression="id_horario" 
                Visible="False" />
            <asp:BoundField DataField="id_materia" HeaderText="id_materia" 
                SortExpression="id_materia" Visible="False" />
            <asp:BoundField DataField="Materia" HeaderText="Materia" 
                SortExpression="Materia" />
            <asp:BoundField DataField="dni_profesor" HeaderText="dni_profesor" 
                SortExpression="dni_profesor" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" 
                SortExpression="nombre" />
            <asp:BoundField DataField="apellido" HeaderText="apellido" 
                SortExpression="apellido" />
            <asp:BoundField DataField="Id_carrera" HeaderText="Id_carrera" 
                SortExpression="Id_carrera" Visible="False" />
            <asp:BoundField DataField="Carrera" HeaderText="Carrera" 
                SortExpression="Carrera" />
            <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
            <asp:BoundField DataField="observaciones" HeaderText="observaciones" 
                SortExpression="observaciones" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ButtonType="Button" >
            <ControlStyle CssClass="botton2" />
            </asp:CommandField>
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
            ConnectionString="<%$ ConnectionStrings:CadenaConexionPP2024 %>" 
            
        SelectCommand="SELECT HM.id_horario, HM.id_materia, M.nombre AS Materia, HM.dni_profesor, P.nombre, P.apellido, HM.Id_carrera, CA.nombre AS Carrera, HM.dia, HM.observaciones FROM Carreras AS CA INNER JOIN HorariosMaterias AS HM ON CA.id_carrera = HM.Id_carrera INNER JOIN Materias AS M ON M.id_materia = HM.id_materia INNER JOIN Profesores AS P ON P.dni = HM.dni_profesor" 
        DeleteCommand="DELETE FROM HorariosMaterias WHERE (id_horario = @id_horario)" 
        UpdateCommand="UPDATE HorariosMaterias SET dni_profesor = @dni_profesor, Id_carrera = @id_carrera, id_materia = @id_materia, dia = @dia, modulo = @modulo, observaciones = @odservaciones">
            <DeleteParameters>
                <asp:Parameter Name="id_horario" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="dni_profesor" />
                <asp:Parameter Name="id_carrera" />
                <asp:Parameter Name="id_materia" />
                <asp:Parameter Name="dia" />
                <asp:Parameter Name="modulo" />
                <asp:Parameter Name="odservaciones" />
            </UpdateParameters>
        </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>" 
        SelectCommand="SELECT HorariosMaterias.id_horario, HorariosMaterias.dni_profesor, Profesores.dni, Profesores.nombre, Profesores.apellido FROM HorariosMaterias RIGHT OUTER JOIN Profesores ON HorariosMaterias.dni_profesor = Profesores.dni">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CadenaConexionPP2024 %>" 
        SelectCommand="SELECT HorariosMaterias.id_materia, Materias.id_materia AS Expr1, Materias.nombre FROM HorariosMaterias RIGHT OUTER JOIN Materias ON HorariosMaterias.id_materia = Materias.id_materia">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CadenaConexionPP2024 %>" 
        SelectCommand="SELECT HorariosMaterias.Id_carrera, HorariosMaterias.id_horario, Carreras.id_carrera AS Expr1, Carreras.nombre FROM Carreras LEFT OUTER JOIN HorariosMaterias ON Carreras.id_carrera = HorariosMaterias.Id_carrera">
    </asp:SqlDataSource>
    
    </div>

    </div>
    </form>
</asp:Content>
