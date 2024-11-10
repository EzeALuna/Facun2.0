<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroMateria.aspx.cs" Inherits="Facun2._0.RegistroMateria2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  	<title>Registro</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	

	<link rel="stylesheet" href="EstilosLogin/css/RegistroLogin.css">

      <!-- SweetAlert2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet" />
    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	</head>
	<body>
	<section class="ftco-section">
		<div class="container">
        		<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Registro de Materia</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-5">
					<div class="wrap">
                    <div align="center" style="padding: 10px">
                    <asp:Image ID="Image1" runat="server" Height="150px" 
                            ImageUrl="~/Estilos/images/inst.png" Width="150px" ></asp:Image>
						<%--<div class="img" style="background-image: url(Estilos/images/inst.png); "></div>--%>
					</div>
                        <div class="login-wrap p-4 p-md-5">
			      	<div class="d-flex">
			      		<div class="w-100">
			      			<h3 class="mb-4">Registro</h3>
			      		</div>
								<%--<div class="w-100">--%>
									<p class="social-media d-flex justify-content-end">
										<a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-facebook"></span></a>
										<a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-twitter"></span></a>
									</p>
								<%--</div>--%>
			      	</div>
							<form id="Form1" action="#" class="signin-form" runat="server">
			      		<asp:Label ID="lblAlerta" runat="server" Text=""></asp:Label>
                        <div class="form-group mt-3">
                         <asp:RequiredFieldValidator ID="rfvNombre" ControlToValidate="textNombre" runat="server" Display="Dynamic" 
                                 ErrorMessage="Debe ingresar nombre" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:Label ID="LabelNombre" runat="server" Text=" Nombre"></asp:Label>
			      			<%--<input type="text" class="form-control" required>--%>
                             <asp:TextBox ID="textNombre" CssClass="form-control" runat="server"></asp:TextBox>
			      			<%--<label class="form-control-placeholder" for="username">Username</label>--%>
                           
			      		<%--</div>

                      	<div class="form-group mt-3">--%>
                         <asp:RequiredFieldValidator ID="rfvDescripcion" ControlToValidate="textDescripcion" runat="server" Display="Dynamic" 
                                 ErrorMessage="Debe ingresar Descripcion" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:Label ID="LabelDescripcion" runat="server" Text="Descripcion"></asp:Label>
			      			<%--<input type="text" class="form-control" required>--%>
                             <asp:TextBox ID="textDescripcion" CssClass="form-control" runat="server"></asp:TextBox>
			      			<%--<label class="form-control-placeholder" for="username">Username</label>--%>
                           
			      	<%--	</div>--%>
                     
                    <%--<div class="form-group">--%>
                    <asp:RequiredFieldValidator ControlToValidate="DDLCarrera" ID="rfvCarrerra" runat="server" ErrorMessage="Debe ingresar una carrera"
                           InitialValue="" Display="Dynamic" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:Label ID="LabelCarrera" runat="server" Text="Carrera"></asp:Label>
                    <asp:DropDownList CssClass="form-control" ID="DDLCarrera" runat="server" DataSourceID="SqlDataSource1" 
                            DataTextField="nombre" DataValueField="id_carrera" AppendDataBoundItems="True">
                             <asp:ListItem Text="Seleccione una carrera" Value="" Selected="True"></asp:ListItem></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:CadenaConexionPP2024 %>" 
                            SelectCommand="SELECT [id_carrera], [nombre] FROM [Carreras]"></asp:SqlDataSource>
                    <%--</div>--%>

                    <asp:RequiredFieldValidator ControlToValidate="DDLAño" ID="rfvAño" runat="server" ErrorMessage="Debe ingresar un Año"
                           InitialValue="" Display="Dynamic" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblAño" runat="server" Text=" Año"></asp:Label>
                     <asp:DropDownList CssClass="form-control" ID="DDLAño" runat="server"  AppendDataBoundItems="True">
                        <asp:ListItem Value="1" Text="1°"></asp:ListItem>
                        <asp:ListItem Value="2" Text="2°"></asp:ListItem>
                         <asp:ListItem Value="3" Text="3°"></asp:ListItem>
                         <asp:ListItem Value="4" Text="4°"></asp:ListItem>
                         <asp:ListItem Text="Seleccione una carrera" Value="" Selected="True"></asp:ListItem></asp:DropDownList></asp:DropDownList>

                    <br />            
                   <%-- <div class="form-group">--%>
		            	<%--<button type="submit" class="form-control btn btn-primary rounded submit px-3">Sign In</button>--%>
                        <asp:Button ID="btnLogin" CssClass="form-control btn btn-primary rounded submit px-3" runat="server" 
                         Text="Registrar Materia" onclick="btnLogin_Click" />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                     <%--</div>--%>
                 
		         <br /><br />
		            <%--</div>--%>
                    <asp:Label ID="lblTexto" runat="server" Text=""></asp:Label>
		                    </form>
                            <br />
                            <p class="text-center"><a href="PerfilMateria.aspx">Ver/editar materias</a></p>
                            <br />
                            <p class="text-center"><a href="PerfilMateria.aspx">Volver</a></p>
		        </div>
		
				</div>
			</div>
		</div>
	</section>

	<script src="Estilos/js/jquery.min.js"></script>
  <script src="Estilos/js/popper.js"></script>
  <script src="Estilos/js/bootstrap.min.js"></script>
  <script src="Estilos/js/main.js"></script>

	</body>
</body>
</html>
