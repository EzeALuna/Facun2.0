<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroAdmin.aspx.cs" Inherits="Facun2._0.RegistroAdmin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!doctype html>
<html lang="en">
  <head>
  	<title>Registro</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="EstilosLogin/css/Login.css">
      <!-- SweetAlert2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet" />
    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	</head>
	<body style="paddin=0px">
	<section class="ftco-section">
		<div class="container">
        		<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Registro Administrador</h2>
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

                         <%--</div>

                    <div class="form-group">--%>
                    <asp:RequiredFieldValidator ID="rfvDNI" ErrorMessage="Debe ingresar DNI" Display="Dynamic"
                           ControlToValidate="textDNI" runat="server" Text="*" ForeColor="Red"/>
                     <asp:RangeValidator ID="rvDNI" MinimumValue="11111111" MaximumValue="99999999" Type="Integer" 
                     ControlToValidate="textDNI" runat="server" ErrorMessage="Debe ingresar un DNI valido" Text="*" ForeColor="Red"></asp:RangeValidator>
                     <asp:Label ID="LblDNI" runat="server" Text="DNI"></asp:Label>
		             <asp:TextBox ID="textDNI" TextMode="Number" CssClass="form-control" runat="server"></asp:TextBox>



                        <asp:RequiredFieldValidator ID="rfvNombre" ControlToValidate="textNombre" runat="server" Display="Dynamic"
                                 ErrorMessage="Debe ingresar nombre" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:Label ID="LabelNombre" runat="server" Text="Nombre"></asp:Label>
			      			<%--<input type="text" class="form-control" required>--%>
                             <asp:TextBox ID="textNombre" CssClass="form-control" runat="server"></asp:TextBox>
			      			<%--<label class="form-control-placeholder" for="username">Username</label>--%>
                            
			      		<%--</div>

                        	<div class="form-group mt-3">--%>
                              <asp:RequiredFieldValidator ID="rfvApellido" ControlToValidate="textApellido" runat="server" Display="Dynamic"
                                 ErrorMessage="Debe ingresar Apellido" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:Label ID="LabelApellido" runat="server" Text="Apellido"></asp:Label>
			      			<%--<input type="text" class="form-control" required>--%>
                             <asp:TextBox ID="textApellido" CssClass="form-control" runat="server"></asp:TextBox>
			      			<%--<label class="form-control-placeholder" for="username">Username</label>--%>
                          
                          <%--/div>
                           <div class="form-group">--%>
                           <asp:RequiredFieldValidator ID="rvEmail" ErrorMessage="Debe ingresar Email"  Display="Dynamic"
                           ControlToValidate="textEmail" runat="server" Text="*" ForeColor="Red"/>
                     <asp:Label ID="LblEmail" runat="server" Text="Email"></asp:Label>
		             <asp:TextBox ID="textEmail" TextMode="Email" CssClass="form-control" runat="server"></asp:TextBox>


<%--                        <asp:RequiredFieldValidator ID="rfvDireccion" ControlToValidate="textDireccion" runat="server" Display="Dynamic"
                                 ErrorMessage="Debe ingresar Direccion" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:Label ID="LabelDireccion" runat="server" Text="Direccion"></asp:Label>

                             <asp:TextBox ID="textDireccion" CssClass="form-control" runat="server"></asp:TextBox>

                            
                           <asp:RequiredFieldValidator ID="rfvTelefono" ControlToValidate="textTelefono" runat="server" Display="Dynamic"
                                 ErrorMessage="Debe ingresar Telefono" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:Label ID="LabelTelefono" runat="server" Text="Telefono"></asp:Label>

                             <asp:TextBox ID="textTelefono" TextMode="Number" CssClass="form-control" runat="server"></asp:TextBox>--%>

                     <asp:RequiredFieldValidator ID="rvContraseña" ErrorMessage="Debe ingresar Contraseña" Display="Dynamic"
                           ControlToValidate="textContraseña" runat="server" Text="*" ForeColor="Red"/>
                     <asp:Label ID="LblContraseña" runat="server" Text="Contraseña"></asp:Label>
		             <%-- <input id="password-field" type="password" class="form-control" required>--%>
		              <asp:TextBox ID="textContraseña" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                   <%--   </div>
                      <div class="form-group">--%>
                         <asp:RequiredFieldValidator ID="rvContraseña2" ErrorMessage="Debe repetir Contraseña" Display="Dynamic" 
                           ControlToValidate="textContraseña2" runat="server" Text="*" ForeColor="Red"/>
                      <asp:CompareValidator ID="CompareContraseña" runat="server" ErrorMessage="Las contraseñas deben ser iguales" Display="Dynamic"
                           ControlToValidate="textContraseña" ControlToCompare="textContraseña2" Text="*" ForeColor="Red"></asp:CompareValidator>
                      <asp:Label ID="Label1" runat="server" Text="Repita la Contraseña"></asp:Label>
                      <asp:TextBox ID="textContraseña2" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                      <%--<label class="form-control-placeholder" for="password">Contraseña</label>--%>
		              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password" 
                            style="right: 15px; top: -400%"></span>


<%--                   <asp:RequiredFieldValidator ID="rfvNacimiento" ErrorMessage="Debe ingresar Nacimiento" Display="Dynamic"
                           ControlToValidate="textNacimiento" runat="server" Text="*" ForeColor="Red"/>
                     <asp:Label ID="LabelNacimiento" runat="server" Text="Nacimiento"></asp:Label>
		             <asp:TextBox ID="textNacimiento" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                     
                      <asp:RequiredFieldValidator ID="rfvCargo" ControlToValidate="textCargo" runat="server" Display="Dynamic"
                                 ErrorMessage="Debe ingresar Cargo" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:Label ID="LblCargo" runat="server" Text="Cargo"></asp:Label>

                             <asp:TextBox ID="textCargo" CssClass="form-control" runat="server"></asp:TextBox>
--%>

                       <%--<asp:RequiredFieldValidator ControlToValidate="DDLCarrera" ID="rfvCarrerra" runat="server" ErrorMessage="Debe ingresar una carrera valida"
                           InitialValue="" Display="Dynamic" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:Label ID="LabelCarrera" runat="server" Text="Carrera"></asp:Label>
                    <asp:DropDownList CssClass="form-control" ID="DDLCarrera" runat="server" DataSourceID="SqlDataSource1" 
                            DataTextField="nombre" DataValueField="id_carrera" AppendDataBoundItems="True">
                                    <asp:ListItem Text="Seleccione una carrera" Value="" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:CadenaConexionPP2024 %>" 
                            SelectCommand="SELECT [id_carrera], [nombre] FROM [Carreras]"></asp:SqlDataSource>--%>
                         
                    </div>
                    
                    <div class="form-group">
		            	<%--<button type="submit" class="form-control btn btn-primary rounded submit px-3">Sign In</button>--%>
                        <asp:Button ID="btnLogin" CssClass="form-control btn btn-primary rounded submit px-3" runat="server" 
                            Text="Crear Usuario" onclick="btnLogin_Click"></asp:Button>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                        
		            </div>
		           
                    <asp:Label ID="lblTexto" runat="server" Text=""></asp:Label>
		                    </form>
                            <p class="text-center"><a href="Login.aspx">Volver</a></p>
		         <%-- <p class="text-center">Not a member? <a data-toggle="tab" href="#signup">Sign Up</a></p>--%>
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
</html>

