<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.UnidadeDeMedida"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
<script type="text/javascript" src="./bootstrap/jquery/jquery-2.1.1.js"></script>
<script type="text/javascript" src="./bootstrap/jquery/jquery.mask.js"></script>

<title>Cadastrar Unidade de Medida</title>

<script type="text/javascript">

	function save() {
		if (document.getElementById("medida").value != "") {
			document.getElementById("newAction").value = "save";
			document.getElementById("frm").submit();
		}else {
				alert("Inserir a Medida");
				frm.medida.focus();
		}
				
	}
	
	function goFind() {
		document.getElementById("newAction").value = "goFind";
		document.getElementById("frm").submit();
	}
	
</script>

<%
	UnidadeDeMedida unidadedemedida = (UnidadeDeMedida) request.getAttribute("object");
	if (unidadedemedida == null) {
		unidadedemedida = new UnidadeDeMedida();
	}
%>

</head>
<body>
<div class="container">
<div class="well">
<fieldset>
	
	<form name="frm" id="frm" method="post" action="./dispatcher">
	<input type="hidden" name="newAction" id="newAction"/>
	<input type="hidden" name="entityName" id="entityName" value="UnidadeDeMedida"/>
	<input type="hidden" name="id" id="id"/>
	
	<div id="legend">
			<legend><h2>Cadastrar <small>Unidades de Medida</small></h2></legend>
	</div>	
	
	<br>
	<div class="col-lg-2">
		<label>C�digo</label>
		<div class="input-group">
  			<span class="input-group-addon"><b>ID</b></span>
			<input class="form-control" readonly type="text" name="idunidadedemedida" id="idunidadedemedida" value="<%=(unidadedemedida.getIdUnidadeDeMedida() == null) ? "" : unidadedemedida.getIdUnidadeDeMedida()%>"/>
		</div>
	</div>
	
	<div class="col-lg-10">
		<label>Medida *</label>
		<input class="form-control" type="text" placeholder="Insira a Unidade de Medida" name="medida" id="medida" value="<%=(unidadedemedida.getMedida() == null) ? "" : unidadedemedida.getMedida()%>"/>
	</div>
	
	<div class="col-lg-12">
		<br>
		<label>Descri��o *</label>
		<textarea rows="1" cols="1" class="form-control" placeholder="Informa��es Adicionais" name="descricao" id="descricao" maxlength="400"><%=(unidadedemedida.getDescricao() == null) ? "" : unidadedemedida.getDescricao()%></textarea>
		<br>
	</div>
	
	<div>	
		<legend></legend>
	</div>
	
	<div class="col-lg-9">
		<br>
		<strong>Campos obrigat�rios s�o marcados (*)</strong>
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