<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.Usuario"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
<script type="text/javascript" src="./bootstrap/jquery/jquery-2.1.1.js"></script>
<script type="text/javascript" src="./bootstrap/jquery/jquery.mask.js"></script>

<title>Login</title>
</head>
<body>
<div class="container-fluid">
<div class="jumbotron">
<h2>Entrar: <small>Administrador</small></h2>     
<form class="form-horizontal">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Login:</label>
    <div class="col-6 col-sm-4 col-lg-3">
      <input type="text" class="form-control" id="inputEmail3" placeholder="Digite o nome do Usu�rio">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Senha:</label>
    <div class="col-6 col-sm-4 col-lg-3">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Digita a Senha">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label>
          <input type="checkbox"> Lembrar me
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-success">Autenticar</button>
      <button type="button" class="btn btn-primary" value="Voltar" onclick="history.back();">Voltar</button>
    </div>
  </div>
</form>
</div>
</div>
</body>
</html>