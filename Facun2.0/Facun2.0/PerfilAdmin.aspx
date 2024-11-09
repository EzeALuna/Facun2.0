<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalAdmin.Master" AutoEventWireup="true" CodeBehind="PerfilAdmin.aspx.cs" Inherits="Facun2._0.PerfilAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="EstilosLogin/css/Titulos.css">
    <form id="form1" runat="server">
    <div class="w-100" align="center" style="margin: 5px; width: 90%">
    <h3 class="Titulo" align="center">Administradores</h3>
    </div>
    <div class="w-100" align="center" style="margin: 5px; width: 90%">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="dni" DataSourceID="SqlDataSource1" 
        EmptyDataText="No hay registros de datos para mostrar." CellPadding="10" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <%--<asp:BoundField DataField="contraseña" HeaderText="contraseña" 
                SortExpression="contraseña" />--%>
            <%--<asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />--%>
           <%-- <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ButtonType="Button" >
            <ControlStyle BorderStyle="Solid" Font-Bold="True" ForeColor="Red" />
            </asp:CommandField>--%>
            <asp:BoundField DataField="dni" HeaderText="DNI" ReadOnly="True" 
                SortExpression="dni" >
            <ControlStyle Width="100px"/>
            </asp:BoundField>
            <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                SortExpression="nombre" >
            <ControlStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="apellido" HeaderText="Apellido" 
                SortExpression="apellido" >
            <ControlStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo" >
            <ControlStyle Width="200px" />
            <HeaderStyle Height="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="fecha_nacimiento" HeaderText="Fecha de Nacimiento" 
                SortExpression="fecha_nacimiento" DataFormatString="{0:d}" >
            <ControlStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="direccion" HeaderText="Direccion" 
                SortExpression="direccion" >
            <ControlStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" >
            <ControlStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="telefono" HeaderText="Telefono" 
                SortExpression="telefono" />
             <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <!-- Botón Editar -->
                    <asp:Button CssClass="botton2" ID="EditButton" runat="server" CommandName="Edit" Text="Editar"></asp:Button>
                    <p></p>
                    <!-- Botón Eliminar con confirmación -->
                    <asp:Button CssClass="botton2" ID="DeleteButton" runat="server" CommandName="Delete" Text="Eliminar" 
                        OnClientClick="return confirm('¿Está seguro que desea eliminar este registro?');"></asp:Button>
                </ItemTemplate>
                <EditItemTemplate>
                    <!-- Botón Actualizar -->
                    <asp:Button CssClass="botton2" ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar"></asp:Button>
                    <p></p>
                    <!-- Botón Cancelar -->
                    <asp:Button CssClass="botton2" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar"></asp:Button>
                </EditItemTemplate>
                 <ControlStyle CssClass="botton2" />
            </asp:TemplateField>
        </Columns>

        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#4756CA" Font-Bold="True" ForeColor="White" />
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
        InsertCommand="INSERT INTO [Admin] ([nombre], [apellido], [dni], [fecha_nacimiento], [direccion], [email], [contraseña], [telefono], [tipo], [cargo]) VALUES (@nombre, @apellido, @dni, @fecha_nacimiento, @direccion, @email, @contraseña, @telefono, @tipo, @cargo)" 
        ProviderName="<%$ ConnectionStrings:Facun2DBConnectionString1.ProviderName %>" 
        SelectCommand="SELECT [nombre], [apellido], [dni], [fecha_nacimiento], [direccion], [email], [contraseña], [telefono], [tipo], [cargo] FROM [Admin]" 
        UpdateCommand="UPDATE [Admin] SET [nombre] = @nombre, [apellido] = @apellido, [fecha_nacimiento] = @fecha_nacimiento, [direccion] = @direccion, [email] = @email, [telefono] = @telefono, [cargo] = @cargo WHERE [dni] = @dni">
        <DeleteParameters>
            <asp:Parameter Name="dni" Type="Int32"  />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="apellido" Type="String" />
            <asp:Parameter Name="dni" Type="Int32" />
            <asp:Parameter DbType="Date" Name="fecha_nacimiento" />
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="contraseña" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="tipo" Type="String" />
            <asp:Parameter Name="cargo" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="apellido" Type="String" />
            <asp:Parameter DbType="Date" Name="fecha_nacimiento" />
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="contraseña" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="tipo" Type="String" />
            <asp:Parameter Name="cargo" Type="String" />
            <asp:Parameter Name="dni" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <br> <br>
    <asp:Button ID="btnAdmin" CssClass="botton3" runat="server" 
                            Text="Cargar Administradores" onclick="btnLogin_Click"></asp:Button>
                             </div>
    </form>
</asp:Content>
