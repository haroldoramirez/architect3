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

<title>Cadastrar Usuário</title>

<script type="text/javascript">

	function save() {
		if ((document.getElementById("nome").value != "") && (document.getElementById("tipo").value != "") 
				&& (document.getElementById("login").value != "") && (document.getElementById("senha").value != "")) {
		document.getElementById("newAction").value = "save";
		document.getElementById("frm").submit();
		}else {
			if (document.getElementById("nome").value == "")  {
				alert("Insira o Nome");
				frm.nome.focus();
			}else 
				if (document.getElementById("tipo").value == "") {
					alert("Selecione o Tipo de Conta");
					frm.tipo.focus();
				}else{
					if (document.getElementById("login").value == ""){
						alert("Insira o Login");
						frm.login.focus();	
					}else{
						alert("Insira a Senha");
						frm.senha.focus();
					}
			}
		}		
	}
	
	function goFind() {
		document.getElementById("newAction").value = "goFind";
		document.getElementById("frm").submit();
	}
	
</script>

<%
	Usuario usuario = (Usuario) request.getAttribute("object");
	if (usuario == null) {
		usuario = new Usuario();
	}
%>

</head>
<body>
<div class="container">
<div class="well">
<fieldset>
	
	<form name="frm" id="frm" method="post" action="./dispatcher">
	<input type="hidden" name="newAction" id="newAction"/>
	<input type="hidden" name="entityName" id="entityName" value="Usuario"/>
	<input type="hidden" name="id" id="id"/>
	
	<div id="legend">
			<legend><h2>Cadastrar <small>Usuário</small></h2></legend>
	</div>	
	
	<br>
	<div class="col-lg-2">
		<label>Código</label>
		<div class="input-group">
  				<span class="input-group-addon"><b>ID</b></span>
  				<input class="form-control" readonly type="text" name="idusuario" id="idusuario" value="<%=(usuario.getIdUsuario() == null) ? "" : usuario.getIdUsuario()%>"/>
		</div>
	</div>
		
	<div class="col-lg-4">
		<label>Nome *</label>
		<input class="form-control" type="text" placeholder="Insira o Nome" name="nome" id="nome" maxlength="59" value="<%=(usuario.getNome() == null) ? "" : usuario.getNome()%>"/>
	</div>
	
		<div class="col-lg-2">
			<label>Tipo de Conta *</label>
			<select class="form-control" name="tipo" id="tipo">
<%
	if (usuario.getTipo() != null) {			
		if (usuario.getTipo().equals("A")) {		
%>		
		<option value="A" selected >Administrador</option>
		<option value="U" >Usuário</option>
<%
		} else {
%>
			<option value="U" selected >Usuário</option>
			<option value="A" >Administrador</option>
<%
		}		
	} else {
		%>
			<option value="">Selecione</option>
			<option value="A">Administrador</option>
			<option value="U">Usuário</option>
		<%
		
	}
%>
			</select>
		</div>
	
	<div class="col-lg-2">
		<label>Login *</label>
		  <div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<input class="form-control" type="text" placeholder="Insira o Login" name="login" id="login" maxlength="100" value="<%=(usuario.getLogin() == null) ? "" : usuario.getLogin()%>"/>
		 </div>
	</div>
	
	<div class="col-lg-2">
		<label>Senha *</label>
		<input class="form-control" type="password" placeholder="Insira a Senha" name="senha" id="senha" maxlength="16" value="<%=(usuario.getSenha() == null) ? "" : usuario.getSenha()%>"/>
		<br>
	</div>
	
	<div>	
		 <legend></legend>
	</div>
	
	<div class="col-lg-9">
		<br>
		<strong>Campos obrigatórios são marcados (*)</strong>
	</div>
	
		<div class="col-lg-9">
			<br>
			<button type="button" class="btn btn-success" value="Salvar" onclick="save();">
				<span class="glyphicon glyphicon-ok"></span> Salvar
			</button>
			<button type="button" class="btn btn-primary" value="Voltar" onclick="goFind();">
				<span class="glyphicon glyphicon-arrow-left"></span> Voltar
			</button>
		</div>
</form>
</fieldset>
</div>
</div>
</body>
</html>