<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalAlumnos.Master" AutoEventWireup="true" CodeBehind="CalendarioAlumno.aspx.cs" Inherits="Facun2._0.CalendarioAlumno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <div >
    <div align="center" style="float: left">
        <asp:Calendar ID="Calendar1" runat="server" 
            onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>
    <br />
    <asp:TextBox ID="TextFecha" runat="server" Width="250px"></asp:TextBox>
        <br /> <br />
        <asp:DropDownList ID="ListTipo" runat="server" Height="30px" Width="250px" 
            AppendDataBoundItems="True">
            <asp:ListItem>Parcial</asp:ListItem>
            <asp:ListItem>Final</asp:ListItem>
            <asp:ListItem>Trabajo Practico</asp:ListItem>
            <asp:ListItem>Otros</asp:ListItem>
        </asp:DropDownList>
    <br /><br />
    <asp:TextBox ID="TextBox1" runat="server" Width="250px"></asp:TextBox>
        <br /> <br />
    <asp:Button ID="ButtonGuardar" runat="server" Text="Guardar" 
            onclick="ButtonGuardar_Click" />
    </div >
    <div align="center" style="float: right">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" DataFormatString="{0:d}"/>
                <asp:BoundField DataField="descripcion" HeaderText="descripcion" 
                    SortExpression="descripcion" />
                <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
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
            SelectCommand="SELECT [fecha], [descripcion], [tipo] FROM [Calendario]">
        </asp:SqlDataSource>
    
    
    </div>
    </div>
    </form>
</asp:Content>
