<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.Cidade,br.edu.udc.sistemas.architect3.entity.Estado"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
<script type="text/javascript" src="./bootstrap/jquery/jquery-2.1.1.js"></script>
<script type="text/javascript" src="./bootstrap/jquery/jquery.mask.js"></script>

<title>Cadastrar Cidade</title>

<script type="text/javascript">

	function save() {
		if ((document.getElementById("cidade").value != "") && (document.getElementById("ddd").value != "") 
				&& (document.getElementById("estado").value != "")) {
		document.getElementById("newAction").value = "save";
		document.getElementById("frm").submit();
		}else {
			if (document.getElementById("cidade").value == "")  {
				alert("Insira a Cidade");
				frm.cidade.focus();
			}else 
				if (document.getElementById("ddd").value == "") {
					alert("Insira o DDD");
					frm.ddd.focus();
				}
				else{
					alert("Selecione o Estado");
					frm.estado.focus();
			}
		}
	}
		
	function goFind() {
		document.getElementById("newAction").value = "goFind";
		document.getElementById("frm").submit();
	}
	
	$(document).ready(function(){
		$('.number').mask('0000');
	});
	
</script>

<%
	Cidade cidade = (Cidade) request.getAttribute("object");
	if (cidade == null) {
		cidade = new Cidade();
		cidade.setEstado(new Estado());
	}
	Object listEstado[] = (Object[]) request.getAttribute("listEstado");
%>

</head>
<body>
<div class="container">
<div class="well">
<fieldset>
	
	<form name="frm" id="frm" method="post" action="./dispatcher">
		<input type="hidden" name="newAction" id="newAction"/>
		<input type="hidden" name="entityName" id="entityName" value="Cidade"/>
		<input type="hidden" name="id" id="id"/>
		
		<div id="legend">
			<legend><h2>Cadastrar <small>Cidade</small></h2></legend>
		</div>	
		
		<br>	
		<div class="col-lg-2">
			<label>Código</label>
			<div class="input-group">
  				<span class="input-group-addon"><b>ID</b></span>
  				<input class="form-control" readonly type="text" name="idcidade" id="idcidade" value="<%=(cidade.getIdCidade() == null) ? "" : cidade.getIdCidade()%>"/>
			</div>
		</div>
		
		<div class="col-lg-6">
			<label>Cidade *</label>
			<input class="form-control" type="text" placeholder="Insira a Cidade" name="cidade" id="cidade" maxlength="69" value="<%=(cidade.getCidade() == null) ? "" : cidade.getCidade()%>"/>
		</div>
			
		<div class="col-lg-2">
			<label>Discagem Direta *</label>
			   <div class="input-group">
  					<span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span>
  					<input class="form-control number" type="text" placeholder="Insira o DDD" name="ddd" id="ddd" maxlength="4" value="<%=(cidade.getDdd() == null) ? "" : cidade.getDdd()%>"/>
			   </div>
		</div>
		
		<div class="col-lg-2">
			<label>Estado *</label>
			<select class="form-control" name="estado" id="estado">
				<option value="">Selecione</option>
<%
	if (listEstado != null) {			
		for(int i=0; i<listEstado.length; i++) {
			Estado estado = (Estado) listEstado[i];
			boolean bSelected = cidade.getEstado().getIdEstado() == estado.getIdEstado(); 
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=estado.getIdEstado()%>"><%=estado.getEstado()%></option>
<%
		}
	}
%>
			</select>
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