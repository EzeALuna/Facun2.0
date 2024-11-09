<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalAdmin.Master" AutoEventWireup="true" CodeBehind="MisDatosAdmin.aspx.cs" Inherits="Facun2._0.MisDatosAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="EstilosLogin/css/Titulos.css"> 
    <form id="form1" runat="server">
    <div align="center width: 100%; height: 100%;">
    <h3 class="Titulo" align="center">Mis Datos</h3>
    </div>
    <div align="center">
    <asp:DetailsView ID="DetailsView1" runat="server" Height="20%" Width="50%" 
        AutoGenerateRows="False" DataKeyNames="dni" DataSourceID="SqlDataSource1" 
        CellPadding="4" GridLines="None" Font-Size="Medium" ForeColor="#333333">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True"/>
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="dni" HeaderText="Dni" ReadOnly="True" 
                SortExpression="dni">
            <ControlStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre">
            <ControlStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="apellido" HeaderText="Apellido" 
                SortExpression="apellido">
            <ControlStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email">
            <ControlStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="contraseña" HeaderText="Contraseña" 
                SortExpression="contraseña">
            <ControlStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="fecha_nacimiento" HeaderText="Fecha de Nacimiento" 
                SortExpression="fecha_nacimiento" DataFormatString="{0:dd/MM/yyyy}">
            <ControlStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="direccion" HeaderText="Direccion" 
                SortExpression="direccion">
            <ControlStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="telefono" HeaderText="Telefono" 
                SortExpression="telefono" />
            <asp:BoundField DataField="tipo" HeaderText="Tipo" SortExpression="tipo" />
            <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo" />
            <asp:CommandField ButtonType="Button" ShowEditButton="True" >
            <ControlStyle CssClass="botton2" />
            </asp:CommandField>
        </Fields>
        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" Font-Size="Large" />
    </asp:DetailsView>




    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>" 
        DeleteCommand="DELETE FROM [Admin] WHERE [dni] = @dni" 
        InsertCommand="INSERT INTO [Admin] ([dni], [nombre], [apellido], [email], [contraseña], [fecha_nacimiento], [direccion], [telefono], [tipo], [cargo]) VALUES (@dni, @nombre, @apellido, @email, @contraseña, @fecha_nacimiento, @direccion, @telefono, @tipo, @cargo)" 
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
        <asp:SessionParameter Name="dni" SessionField="DNI" Type="Int32" />
    </SelectParameters>
    </asp:SqlDataSource>
    </div>
    </form>
</asp:Content>
