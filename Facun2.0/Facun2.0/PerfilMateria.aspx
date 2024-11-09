<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalAdmin.Master" AutoEventWireup="true" CodeBehind="PerfilMateria.aspx.cs" Inherits="Facun2._0.RegistroMateria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="EstilosLogin/css/Titulos.css">
    <form id="form1" runat="server">
    <div class="w-100" align="center" style="margin: 5px; width: 90%">
    <h3 class="Titulo" align="center">Materias</h3>
    </div>
    <div class="w-100" align="center" style="margin: 5px; width: 90%">
    <asp:GridView ID="GridView1" runat="server" 
        AutoGenerateColumns="False" DataKeyNames="id_materia" 
        DataSourceID="SqlDataSource1" 
        EmptyDataText="No hay registros de datos para mostrar." 
        CellPadding="10" 
        ForeColor="#333333" GridLines="None" Width="80%">
        <AlternatingRowStyle BackColor="White" />

        <Columns>
            <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                SortExpression="nombre" >
            <ControlStyle Width="200px" />
            <HeaderStyle Height="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="descripcion" HeaderText="Descripcion" 
                SortExpression="descripcion" >
               <ControlStyle Width="200px" />
            </asp:BoundField>
               <%-- <asp:BoundField DataField="estado" HeaderText="Estado" 
                SortExpression="estado" />--%>
            <%--asp:BoundField DataField="id_carrera" HeaderText="id_carrera" 
                SortExpression="id_carrera" />--%>
                <asp:TemplateField HeaderText="Carrera">
            <ItemTemplate>
            <%# Eval("NombreCarrera") %> <!-- Muestra el nombre de la carrera -->
            </ItemTemplate>
            <EditItemTemplate>
            <asp:DropDownList ID="ddlCarrera" runat="server" 
            SelectedValue='<%# Bind("id_carrera") %>'
            DataSourceID="SqlDataSourceCarreras" 
            DataTextField="nombre" 
            DataValueField="id_carrera">
            </asp:DropDownList>
            </EditItemTemplate>
                    <ControlStyle Width="200px" />
            </asp:TemplateField>

            <%--<asp:BoundField DataField="año" HeaderText="año" SortExpression="año" />--%>
            <asp:TemplateField HeaderText="Año">
             <ItemTemplate>
            <%# Eval("año") %> <!-- Mostrar año cuando no está en  edición -->
           </ItemTemplate>
              <EditItemTemplate>
              <asp:DropDownList ID="ddlAño" runat="server" SelectedValue='<%# Bind("año") %>'>
            <asp:ListItem Value="1" Text="1°"></asp:ListItem>
            <asp:ListItem Value="2" Text="2°"></asp:ListItem>
            <asp:ListItem Value="3" Text="3°"></asp:ListItem>
            <asp:ListItem Value="4" Text="4°"></asp:ListItem>
           </asp:DropDownList>
          </EditItemTemplate>
                <ControlStyle Width="200px" />
            </asp:TemplateField>

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
    DeleteCommand="DELETE FROM [Materias] WHERE [id_materia] = @id_materia" 
    InsertCommand="INSERT INTO [Materias] ([nombre], [descripcion], [id_carrera], [año]) VALUES (@nombre, @descripcion, @id_carrera, @año)" 
    ProviderName="<%$ ConnectionStrings:Facun2DBConnectionString1.ProviderName %>" 
    SelectCommand="SELECT M.[id_materia], M.[nombre], M.[descripcion], M.[id_carrera], C.[nombre] AS NombreCarrera, M.[año] FROM [Materias] M INNER JOIN [Carreras] C ON M.id_carrera = C.id_carrera" 
    UpdateCommand="UPDATE [Materias] SET [nombre] = @nombre, [descripcion] = @descripcion, [id_carrera] = @id_carrera, [año] = @año WHERE [id_materia] = @id_materia">
        
        <DeleteParameters>
            <asp:Parameter Name="id_materia" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="id_carrera" Type="Int32" />
            <asp:Parameter Name="año" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="id_carrera" Type="Int32" />
            <asp:Parameter Name="año" Type="Int32" />
            <asp:Parameter Name="id_materia" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
       <%-- tablacarrera--%>
     <asp:SqlDataSource ID="SqlDataSourceCarreras" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Facun2DBConnectionString1 %>" 
            SelectCommand="SELECT id_carrera, nombre FROM Carreras"> 
        <%--onselecting="SqlDataSourceCarreras_Selecting">--%>
            </asp:SqlDataSource>

            <br> <br>
            <asp:Button ID="btnMaterias" CssClass="botton3" runat="server" 
                            Text="Cargar materias" onclick="btnLogin_Click"></asp:Button>
         </div>
      </form>
</asp:Content>
