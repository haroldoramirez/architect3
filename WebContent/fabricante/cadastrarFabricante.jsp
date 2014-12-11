<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.Fabricante"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
<script type="text/javascript" src="./bootstrap/jquery/jquery-2.1.1.js"></script>
<script type="text/javascript" src="./bootstrap/jquery/jquery.mask.js"></script>

<title>Cadastrar Fabricante</title>

<script type="text/javascript">

	function save() {
		if (document.getElementById("descricao").value != "") {
			document.getElementById("newAction").value = "save";
			document.getElementById("frm").submit();
		}else {
				alert("Inserir a Descrição");
				frm.descricao.focus();
		}
	}
				
	
	function goFind() {
		document.getElementById("newAction").value = "goFind";
		document.getElementById("frm").submit();
	}
	
</script>

<%
	Fabricante fabricante = (Fabricante) request.getAttribute("object");
	if (fabricante == null) {
		fabricante = new Fabricante();
	}
%>

</head>
<body>
<div class="container">
<div class="well">
<fieldset>
	
	<form name="frm" id="frm" method="post" action="./dispatcher">
	<input type="hidden" name="newAction" id="newAction"/>
	<input type="hidden" name="entityName" id="entityName" value="Fabricante"/>
	<input type="hidden" name="id" id="id"/>
	
	<div id="legend">
			<legend><h2>Cadastrar <small>Fabricante</small></h2></legend>
	</div>	
	
	<br>
	<div class="col-lg-2">
		<label>Código</label>
		<div class="input-group">
  			<span class="input-group-addon"><b>ID</b></span>
  			<input class="form-control" readonly type="text" name="idfabricante" id="idfabricante" value="<%=(fabricante.getIdFabricante() == null) ? "" : fabricante.getIdFabricante()%>"/>
		</div>
	</div>
	
	<div class="col-lg-10">
		<label>Descrição *</label>
		<input class="form-control" type="text" placeholder="Insira o Fabricante" name="descricao" id="descricao" value="<%=(fabricante.getDescricao() == null) ? "" : fabricante.getDescricao()%>"/>
	</div>
	
	<div class="col-lg-12">
		<br>
		<label>Observações *</label>
		<textarea rows="1" cols="1" class="form-control" placeholder="Informações Adicionais" name="observacoes" id="observacoes" maxlength="400"><%=(fabricante.getObservacoes() == null) ? "" : fabricante.getObservacoes()%></textarea>
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