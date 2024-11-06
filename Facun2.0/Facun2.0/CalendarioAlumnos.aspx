<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalAlumnos.Master" AutoEventWireup="true" CodeBehind="CalendarioAlumnos.aspx.cs" Inherits="Facun2._0.CalendarioAlumnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <div>
    <link rel="stylesheet" href="EstilosLogin/css/Titulos.css">
    <h2 class="Titulo" align="center">Calendario de instancias</h2>
    <div style="float: left; " align="center">
    
    <asp:Calendar ID="Calendar1" runat="server" 
        onselectionchanged="Calendar1_SelectionChanged" BackColor="White" 
            BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" 
            Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" 
            Width="330px">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
            Height="8pt" />
        <DayStyle BackColor="#CCCCCC" />
        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" 
            Font-Size="12pt" ForeColor="White" Height="12pt" />
        <TodayDayStyle BackColor="#999999" ForeColor="White" />
        </asp:Calendar>
    <br />
    <div style="overflow: auto;">    
    <asp:Label CssClass="label" ID="Fechalabel" runat="server" Text="Fecha"></asp:Label>
    <br />
    <asp:TextBox CssClass="Celda" ID="lblMensaje1" runat="server" Width="300px"></asp:TextBox>
    <br /> 
    <asp:Label CssClass="label" ID="Label1" runat="server" Text="Descripcion"></asp:Label>
    <br /> 
    <asp:TextBox CssClass="Celda" ID="txtDescripcion" runat="server" Width="300px"></asp:TextBox>
    <br />
    <asp:Label CssClass="label" ID="Label2" runat="server" Text="Tipo"></asp:Label>
    <br /> 
    <asp:DropDownList CssClass="Celda" ID="ListTipo" runat="server" EnableTheming="True">
        <asp:ListItem>Parcial</asp:ListItem>
        <asp:ListItem>Final</asp:ListItem>
        <asp:ListItem>Trabajo Practico</asp:ListItem>
        <asp:ListItem>Otro</asp:ListItem>
        </asp:DropDownList>
    <br /><br />     
            <asp:Button class="botton1" ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
    </div>
    </div>
    <div align="center" style="float: right">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None" DataKeyNames="id_Calendario">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
<asp:BoundField DataField="id_Calendario" HeaderText="id_Calendario" 
                    SortExpression="id_Calendario" InsertVisible="False" ReadOnly="True" 
                    Visible="False"></asp:BoundField>
<asp:BoundField DataField="dni" HeaderText="dni" SortExpression="dni" Visible="False"></asp:BoundField>
                <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" />
                <asp:BoundField DataField="tipo" HeaderText="Tipo" SortExpression="tipo" />
                <asp:BoundField DataField="descripcion" HeaderText="Descripcion" 
                    SortExpression="descripcion" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ButtonType="Button" />
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
            
            SelectCommand="SELECT id_Calendario, dni, fecha, tipo, descripcion FROM Calendario WHERE (dni = @dni) ORDER BY fecha, tipo" 
            DeleteCommand="DELETE FROM Calendario WHERE (id_Calendario = @Id_Calendario)" 
            
            UpdateCommand="UPDATE Calendario SET fecha = @fecha, tipo = @tipo, descripcion = @descripcion WHERE (id_Calendario = @id_calendario)">
            <DeleteParameters>
                <asp:Parameter Name="Id_Calendario" Type="String"/>
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="dni" SessionField="dni" Type="Int32" />
            </SelectParameters>

            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="fecha" />
                <asp:Parameter Name="tipo" Type="String"/>
                <asp:Parameter Name="descripcion" Type="String"/>
                <asp:Parameter Name="id_calendario" />
            </UpdateParameters>

        </asp:SqlDataSource>
       </div>
    </div>
    </form>
</asp:Content>
