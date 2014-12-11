<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.FormaDePagamento"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
<script type="text/javascript" src="./bootstrap/jquery/jquery-2.1.1.js"></script>
<script type="text/javascript" src="./bootstrap/jquery/jquery.mask.js"></script>

<title>Cadastrar Forma de Pagamento</title>

<script type="text/javascript">

	function save() {
		if (document.getElementById("descricao").value != "") {
			document.getElementById("newAction").value = "save";
			document.getElementById("frm").submit();
		}else {
			alert("Insira a Forma de Pagamento");
			frm.descricao.focus();
		}
				
	}
	
	function goFind() {
		document.getElementById("newAction").value = "goFind";
		document.getElementById("frm").submit();
	}
	
</script>

<%
	FormaDePagamento formadepagamento = (FormaDePagamento) request.getAttribute("object");
	if (formadepagamento == null) {
		formadepagamento = new FormaDePagamento();
	}
%>

</head>
<body>
<div class="container">
<div class="well">
<fieldset>	

	<form name="frm" id="frm" method="post" action="./dispatcher">
	<input type="hidden" name="newAction" id="newAction"/>
	<input type="hidden" name="entityName" id="entityName" value="FormaDePagamento"/>
	<input type="hidden" name="id" id="id"/>
	
	<div id="legend">
			<legend><h2>Cadastrar <small>Forma de Pagamento</small></h2></legend>
	</div>	
	
	<br>
	<div class="col-lg-2">
		<label>Código</label>
		<div class="input-group">
  			<span class="input-group-addon"><b>ID</b></span>
			<input class="form-control" readonly type="text" name="idformadepagamento" id="idformadepagamento" value="<%=(formadepagamento.getIdFormaDePagamento() == null) ? "" : formadepagamento.getIdFormaDePagamento()%>"/>
		</div>
	</div>
	
	<div class="col-lg-10">
		<label>Descrição *</label>
		<input class="form-control" type="text" placeholder="Insira a Forma de Pagamento" name="descricao" id="descricao" value="<%=(formadepagamento.getDescricao() == null) ? "" : formadepagamento.getDescricao()%>"/>
	</div>

	<div class="col-lg-9">
		<br>
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