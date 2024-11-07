<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalAdmin.Master" AutoEventWireup="true" CodeBehind="MisDatosAdmin.aspx.cs" Inherits="Facun2._0.MisDatosAdmin" %>
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
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="dni" HeaderText="dni" ReadOnly="True" 
                SortExpression="dni" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" 
                SortExpression="nombre" />
            <asp:BoundField DataField="apellido" HeaderText="apellido" 
                SortExpression="apellido" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="contraseña" HeaderText="contraseña" 
                SortExpression="contraseña" />
            <asp:BoundField DataField="fecha_nacimiento" HeaderText="fecha_nacimiento" 
                SortExpression="fecha_nacimiento" />
            <asp:BoundField DataField="direccion" HeaderText="direccion" 
                SortExpression="direccion" />
            <asp:BoundField DataField="telefono" HeaderText="telefono" 
                SortExpression="telefono" />
            <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
            <asp:BoundField DataField="cargo" HeaderText="cargo" SortExpression="cargo" />
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
        DeleteCommand="DELETE FROM [Admin] WHERE [dni] = @dni" 
        InsertCommand="INSERT INTO [Admin] ([dni], [nombre], [apellido], [email], [contraseña], [fecha_nacimiento], [direccion], [telefono], [tipo], [cargo]) VALUES (@dni, @nombre, @apellido, @email, @contraseña, @fecha_nacimiento, @direccion, @telefono, @tipo, @cargo)" 
        ProviderName="<%$ ConnectionStrings:Facun2DBConnectionString1.ProviderName %>" 
        SelectCommand="SELECT [dni], [nombre], [apellido], [email], [contraseña], [fecha_nacimiento], [direccion], [telefono], [tipo], [cargo] FROM [Admin] WHERE [dni] = @dni" 
        UpdateCommand="UPDATE [Admin] SET [nombre] = @nombre, [apellido] = @apellido, [email] = @email, [contraseña] = @contraseña, [fecha_nacimiento] = @fecha_nacimiento, [direccion] = @direccion, [telefono] = @telefono, [tipo] = @tipo, [cargo] = @cargo WHERE [dni] = @dni">
        <DeleteParameters>
            <asp:Parameter Name="dni" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="dni" Type="Int32" />
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="apellido" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="contraseña" Type="String" />
            <asp:Parameter DbType="Date" Name="fecha_nacimiento" />
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="tipo" Type="String" />
            <asp:Parameter Name="cargo" Type="String" />
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
            <asp:Parameter Name="cargo" Type="String" />
            <asp:Parameter Name="dni" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
        <asp:SessionParameter Name="dni" SessionField="DNIAdmin" Type="Int32" />
    </SelectParameters>
    </asp:SqlDataSource>
    </form>
</asp:Content>
