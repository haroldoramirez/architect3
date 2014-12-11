<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.Pais"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
<script type="text/javascript" src="./bootstrap/jquery/jquery-2.1.1.js"></script>
<script type="text/javascript" src="./bootstrap/jquery/jquery.mask.js"></script>

<title>Cadastrar País</title>

<script type="text/javascript">

	function save() {
		if ((document.getElementById("pais").value != "") 
				&& (document.getElementById("ddi").value != "")) {
			document.getElementById("newAction").value = "save";
			document.getElementById("frm").submit();
		}else {
			if (document.getElementById("pais").value == "")  {
				alert("Insira o País");
				frm.pais.focus();
			}else{
				alert("Insira o DDI");
				frm.ddi.focus();
			}
		}
	}
		
	function goFind() {
		document.getElementById("newAction").value = "goFind";
		document.getElementById("frm").submit();
	}
		
	$(document).ready(function() {
		$('.number').mask('0000');
	});
	
	alert(mensagem);
	
</script>

<%
	String mensagem = (String) request.getAttribute("mensagem");
	Pais pais = (Pais) request.getAttribute("object");
	if (pais == null) {
		pais = new Pais();
	}
%>

</head>

<body>
<div class="container">
<div class="well">
<fieldset>

	<form name="frm" id="frm" method="post" action="./dispatcher">
		<input type="hidden" name="newAction" id="newAction"/>
		<input type="hidden" name="entityName" id="entityName" value="Pais"/>
		<input type="hidden" name="id" id="id"/>
	
	<div id="legend">
			<legend><h2>Cadastrar<small> País</small></h2></legend>
	</div>	

	<br>
	<div class="col-lg-2">
		<label>Código</label>	
		<div class="input-group">
  			<span class="input-group-addon"><b>ID</b></span>
  			<input class="form-control" readonly type="text" name="idpais" id="idpais" value="<%=(pais.getIdPais() == null) ? "" : pais.getIdPais()%>"/>
		</div>
	</div>


	<div class="col-lg-8">		
		<label>País *</label>
  		<input class="form-control" type="text" placeholder="Insira o País" name="pais" id="pais" maxlength="99" value="<%=(pais.getPais() == null) ? "" : pais.getPais()%>"/>
	</div>


	<div class="col-lg-2">
	    <label>Código de Discagem *</label>
	    <div class="input-group">
  			<span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span>			
  			<input class="form-control number" type="text" placeholder="Insira o DDI" name="ddi" id="ddi" maxlength="4" value="<%=(pais.getDdi() == null) ? "" : pais.getDdi()%>"/>			
		</div>
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