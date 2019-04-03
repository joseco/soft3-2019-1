<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body class="signin text-center">
    <form id="form1" runat="server" class="form-signin">
        <img class="mb-4" src="http://www.nur.edu/wp-content/uploads/2014/05/logo-nur2.png" alt="NUR" >
        <h1 class="h3 mb-3 font-weight-normal">Ingresar</h1>

        <label for="inputEmail" class="sr-only">Nombre de Usuario</label>
        <asp:TextBox ID="UsernameTextBox" runat="server" class="form-control"
            placeholder="Ingrese su nombre de usuario"/>
        
        <label for="inputPassword" class="sr-only">Contraseña</label>
        <asp:TextBox ID="PasswordTextBox" runat="server" class="form-control" TextMode="Password"
            placeholder="Ingrese su contraseña"/>

        <div class="text-danger">
            <asp:Label ID="MsgError" runat="server"></asp:Label>
        </div>

        <asp:Button runat="server" CssClass="btn btn-lg btn-primary btn-block" Text="Entrar"
            ID="BtnIngresar" OnClick="BtnIngresar_Click"/>
        <p class="mt-5 mb-3 text-muted">&copy; 2018</p>
    </form>
</body>
</html>