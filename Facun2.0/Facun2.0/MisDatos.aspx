<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalAlumnos.Master" AutoEventWireup="true" CodeBehind="MisDatos.aspx.cs" Inherits="Facun2._0.MisDatos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <link rel="stylesheet" href="EstilosLogin/css/Titulos.css"> 
    <form id="form1" runat="server">
     <div align="center width: 100%; height: 100%;">
    <h3 class="Titulo" align="center">Mis Datos</h3>
    </div>
    <div align="center">
    <asp:DetailsView ID="DetailsView1" runat="server" Height="20%" Width="60%" 
        AutoGenerateRows="False" DataKeyNames="dni" DataSourceID="SqlDataSource1" 
            CellPadding="4" ForeColor="#333333" Font-Size="Medium" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="dni" HeaderText="DNI" ReadOnly="True" 
                SortExpression="dni" >
            <ControlStyle Width="300px" />
            </asp:BoundField>
            <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                SortExpression="nombre" >
            <ControlStyle Width="300px" />
            </asp:BoundField>
            <asp:BoundField DataField="apellido" HeaderText="Apellido" 
                SortExpression="apellido" >
            <ControlStyle Width="300px" />
            </asp:BoundField>
            <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" >
            <ControlStyle Width="300px" />
            </asp:BoundField>
            <asp:BoundField DataField="contraseña" HeaderText="Contraseña" 
                SortExpression="contraseña" >
            <ControlStyle Width="300px" />
            </asp:BoundField>
            <asp:BoundField DataField="fecha_nacimiento" HeaderText="Fecha de Nacimiento" 
                SortExpression="fecha_nacimiento" DataFormatString="{0:dd/MM/yyyy}" >
            <ControlStyle Width="300px" />
            </asp:BoundField>
            <asp:BoundField DataField="direccion" HeaderText="Direccion" 
                SortExpression="direccion" >
            <ControlStyle Width="300px" />
            </asp:BoundField>
            <asp:BoundField DataField="telefono" HeaderText="Telefono" 
                SortExpression="telefono" >
            <ControlStyle Width="300px" />
            </asp:BoundField>
            <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" 
                Visible="False" />
            <asp:BoundField DataField="id_carrera" HeaderText="id_carrera" 
                SortExpression="id_carrera" Visible="False" />
            <asp:CommandField ShowEditButton="True" ButtonType="Button">
            <ControlStyle CssClass="botton2" />
            </asp:CommandField>
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" Font-Size="Large"/>
    </asp:DetailsView>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>" 
        DeleteCommand="DELETE FROM [Alumnos] WHERE [dni] = @dni" 
        InsertCommand="INSERT INTO [Alumnos] ([dni], [nombre], [apellido], [email], [contraseña], [fecha_nacimiento], [direccion], [telefono], [tipo], [id_carrera]) VALUES (@dni, @nombre, @apellido, @email, @contraseña, @fecha_nacimiento, @direccion, @telefono, @tipo, @id_carrera)" 
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
    </div>
    </form>
</asp:Content>
