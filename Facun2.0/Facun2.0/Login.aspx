<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="~/Login.aspx.cs" Inherits="Facun2._0.Login1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!doctype html>
<html lang="en">
  <head>
  	<title>Iniciar Sesión</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="EstilosLogin/css/Login.css">

	</head>
	<body style="paddin=0px">
	<section class="ftco-section">
		<div class="container">
        		<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Facundo</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-5">
					<div class="wrap">
                    <div align="center" style="padding-top: 10px">
                    <asp:Image ID="Image1" runat="server" Height="135px" 
                            ImageUrl="~/Estilos/images/inst.png" Width="135px" ></asp:Image>
                    </div>
                        
						<%--<div class="img" style="background-image: url('Estilos/images/inst.png'); width: 458px; height:500px;"></div>--%>
						<div class="login-wrap p-4 p-md-5">
			      	<div class="d-flex">
			      		<div class="w-100">
			      			<h3 class="mb-4">Usuario</h3>
			      		</div>
								<div class="w-100">
									<p class="social-media d-flex justify-content-end">
										<a href="https://isfdyt46-bue.infd.edu.ar/sitio/" target="_blank" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-university"></span></a>
										<a href="https://www.instagram.com/instituto.46/?hl=es" target="_blank" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-instagram"></span></a>
									</p>
								</div>
			      	</div>
							<form id="Form1" action="#" class="signin-form" runat="server">
			      		<div class="form-group mt-3">
                            <asp:Label ID="LabelDNI" runat="server" Text="DNI"></asp:Label>
			      			<%--<input type="text" class="form-control" required>--%>
                             <asp:TextBox ID="txtDNI" CssClass="form-control" runat="server"></asp:TextBox>
			      			<%--<label class="form-control-placeholder" for="username">Username</label>--%>
                            <asp:RequiredFieldValidator ID="rfvusuario" ControlToValidate="txtDNI" runat="server"
                                 ErrorMessage="Debe ingresar DNI" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
			      		</div>

		            <div class="form-group">
                     <asp:Label ID="LabelContraseña" runat="server" Text="Contraseña"></asp:Label>
		             <%-- <input id="password-field" type="password" class="form-control" required>--%>
		              <asp:TextBox ID="txtContraseña" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                      <%--<asp:TextBox ID="txtContraseña2" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>--%>
                      <%--<label class="form-control-placeholder" for="password">Contraseña</label>--%>
		              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                      <asp:RequiredFieldValidator ID="rfvContraseña" ErrorMessage="Debe ingresar Contraseña" 
                           ControlToValidate="txtContraseña" runat="server" Text="*" ForeColor="Red"/>
		            </div>

                    
                    <div class="form-group">
		            	<%--<button type="submit" class="form-control btn btn-primary rounded submit px-3">Sign In</button>--%>
                        <asp:Button ID="btnLogin" CssClass="form-control btn btn-primary rounded submit px-3" runat="server" 
                            Text="Iniciar Sesión" onclick="btnLogin_Click"></asp:Button>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
		            </div>
		            <div class="form-group d-md-flex">
		            	<div class="w-50 text-left">
			          <%--  	<label class="checkbox-wrap checkbox-primary mb-0">Recordar Usuario
									  <input type="checkbox" checked>
									  <span class="checkmark"></span>
										</label>--%>
									</div>
									<div class="w-50 text-md-right">
										<a href="#">Has olvidado tu contraseña</a>
									</div>
		            </div>
                    <asp:Label ID="lblTexto" runat="server" Text=""></asp:Label>
		                             
                  </form>
                  
		          <p class="text-center"><a href="SeleccionRegistro.aspx">Registrase</a></p>
		        </div>
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
