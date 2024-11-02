<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipalAlumnos.Master" AutoEventWireup="true" CodeBehind="CalendarioAlumnos.aspx.cs" Inherits="Facun2._0.CalendarioAlumnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <div>
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
    <asp:Label ID="Fechalabel" runat="server" Text="Fecha"></asp:Label>
    <br />
    <asp:TextBox ID="lblMensaje1" runat="server" Width="300px"></asp:TextBox>
    <br /> 
    <asp:Label ID="Label1" runat="server" Text="Descripcion"></asp:Label>
    <br /> 
    <asp:TextBox ID="txtDescripcion" runat="server" Width="300px"></asp:TextBox>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Tipo"></asp:Label>
    <br /> 
    <asp:DropDownList ID="ListTipo" runat="server" Height="30px" Width="300px">
        <asp:ListItem>Parcial</asp:ListItem>
        <asp:ListItem>Final</asp:ListItem>
        <asp:ListItem>Trabajo Practico</asp:ListItem>
        <asp:ListItem>Otro</asp:ListItem>
        </asp:DropDownList>
    <br /><br />     
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
    </div>
    </div>
    <div style="float: right; " align="center">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
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
  <asp:TextBox ID="Textalumnos" runat="server" Visible="False"></asp:TextBox>
    </div>
       </div>
    </form>
</asp:Content>
