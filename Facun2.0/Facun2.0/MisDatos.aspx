<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalAlumnos.Master" AutoEventWireup="true" CodeBehind="MisDatos.aspx.cs" Inherits="Facun2._0.MisDatos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="dni" DataSourceID="SqlDataSource1" 
        EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="dni" HeaderText="dni" ReadOnly="True" 
                SortExpression="dni" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" 
                SortExpression="nombre" />
            <asp:BoundField DataField="apellido" HeaderText="apellido" 
                SortExpression="apellido" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="contraseña" HeaderText="contraseña" 
                SortExpression="contraseña" />
            <asp:BoundField DataField="fecha_nacimiento" HeaderText="nacimiento" 
                SortExpression="nacimiento" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="direccion" HeaderText="direccion" 
                SortExpression="direccion" />
            <asp:BoundField DataField="telefono" HeaderText="telefono" 
                SortExpression="telefono" />
            <asp:CommandField ShowEditButton="True" />
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
        DeleteCommand="DELETE FROM [Alumnos] WHERE [dni] = @dni" 
        InsertCommand="INSERT INTO [Alumnos] ([dni], [nombre], [apellido], [email], [contraseña], [fecha_nacimiento], [direccion], [telefono], [tipo], [id_carrera]) VALUES (@dni, @nombre, @apellido, @email, @contraseña, @fecha_nacimiento, @direccion, @telefono, @tipo, @id_carrera)" 
        ProviderName="<%$ ConnectionStrings:Facun2DBConnectionString1.ProviderName %>" 
        SelectCommand="SELECT [dni], [nombre], [apellido], [email], [contraseña], [fecha_nacimiento], [direccion], [telefono], [tipo], [id_carrera] FROM [Alumnos] WHERE dni = @dni" 
        UpdateCommand="UPDATE [Alumnos] SET [nombre] = @nombre, [apellido] = @apellido, [email] = @email, [contraseña] = @contraseña, [fecha_nacimiento] = @fecha_nacimiento, [direccion] = @direccion, [telefono] = @telefono, [tipo] = @tipo, [id_carrera] = @id_carrera WHERE [dni] = @dni">
        <DeleteParameters>
            <asp:Parameter Name="dni" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="dni" Type="Int32" />
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="apellido" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="contraseña" Type="String" />
            <asp:Parameter DbType="Date" Name="fecha_nacimiento"/>
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="tipo" Type="String" />
            <asp:Parameter Name="id_carrera" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="apellido" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="contraseña" Type="String" />
            <asp:Parameter DbType="Date" Name="fecha_nacimiento" />
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="tipo" Type="String" />
            <asp:Parameter Name="id_carrera" Type="Int32" />
            <asp:Parameter Name="dni" Type="Int32" />
        </UpdateParameters>
       <SelectParameters>
        <asp:SessionParameter Name="dni" SessionField="DNI" Type="Int32" />
    </SelectParameters>
    </asp:SqlDataSource>
    </form>
</asp:Content>
