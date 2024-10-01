<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalAdmin.Master" AutoEventWireup="true" CodeBehind="PerfilMateria.aspx.cs" Inherits="Facun2._0.RegistroMateria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" 
        AutoGenerateColumns="False" DataKeyNames="id_materia" 
        DataSourceID="SqlDataSource1" 
        EmptyDataText="No hay registros de datos para mostrar." 
        CellPadding="4" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                SortExpression="nombre" />
            <asp:BoundField DataField="descripcion" HeaderText="Descripcion" 
                SortExpression="descripcion" />
                <asp:BoundField DataField="estado" HeaderText="Estado" 
                SortExpression="estado" />
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
            </asp:TemplateField>

            <%--<asp:BoundField DataField="estado" HeaderText="estado" SortExpression="estado" />--%>
     <%--         <asp:TemplateField HeaderText="Estado">
             <ItemTemplate>
             <%# Eval("estado") %> <!-- Muestra el estado cuando no está en  edición -->
              </ItemTemplate>
              <EditItemTemplate>
              <asp:DropDownList ID="ddlEstado" runat="server" SelectedValue='<%# Bind("estado") %>'>
             <asp:ListItem Value="" Text="Seleccione un estado"></asp:ListItem>  
              <asp:ListItem Value="Activo" Text="Activo"></asp:ListItem>
             <asp:ListItem Value="Inactivo" Text="Inactivo"></asp:ListItem>
              </asp:DropDownList>
              </EditItemTemplate>
             </asp:TemplateField>--%>

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
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <!-- Botón Editar -->
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar"></asp:Button>
                    <p></p>
                    <!-- Botón Eliminar con confirmación -->
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Eliminar" 
                        OnClientClick="return confirm('¿Está seguro que desea eliminar este registro?');"></asp:Button>
                </ItemTemplate>
                <EditItemTemplate>
                    <!-- Botón Actualizar -->
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar"></asp:Button>
                    <p></p>
                    <!-- Botón Cancelar -->
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar"></asp:Button>
                </EditItemTemplate>
            </asp:TemplateField>

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
    DeleteCommand="DELETE FROM [Materias] WHERE [id_materia] = @id_materia" 
    InsertCommand="INSERT INTO [Materias] ([nombre], [descripcion], [id_carrera], [estado], [año]) VALUES (@nombre, @descripcion, @id_carrera, @estado, @año)" 
    ProviderName="<%$ ConnectionStrings:Facun2DBConnectionString1.ProviderName %>" 
    SelectCommand="SELECT M.[id_materia], M.[nombre], M.[descripcion], M.[id_carrera], C.[nombre] AS NombreCarrera, M.[estado], M.[año] FROM [Materias] M INNER JOIN [Carreras] C ON M.id_carrera = C.id_carrera" 
    UpdateCommand="UPDATE [Materias] SET [nombre] = @nombre, [descripcion] = @descripcion, [id_carrera] = @id_carrera, [estado] = @estado, [año] = @año WHERE [id_materia] = @id_materia">
        
        <DeleteParameters>
            <asp:Parameter Name="id_materia" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="id_carrera" Type="Int32" />
            <asp:Parameter Name="estado" Type="String" />
            <asp:Parameter Name="año" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="id_carrera" Type="Int32" />
            <asp:Parameter Name="estado" Type="String" />
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
            <asp:Button ID="btnMaterias" CssClass="btn btn-outline-primary" runat="server" 
                            Text="Cargar materias" onclick="btnLogin_Click"></asp:Button>
      </form>
</asp:Content>
