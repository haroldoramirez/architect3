<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.Estado,br.edu.udc.sistemas.architect3.entity.Pais"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
<script type="text/javascript" src="./bootstrap/jquery/jquery-2.1.1.js"></script>
<script type="text/javascript" src="./bootstrap/jquery/jquery.mask.js"></script>

<title>Cadastrar Estado</title>

<script type="text/javascript">

	function save() {
		if ((document.getElementById("estado").value != "") && (document.getElementById("uf").value != "") 
				&& (document.getElementById("pais").value != "")) {
			document.getElementById("newAction").value = "save";
			document.getElementById("frm").submit();
		}else {
			if (document.getElementById("estado").value == "")  {
				alert("Insira o Estado");
				frm.estado.focus();
			}else 
				if (document.getElementById("uf").value == "") {
					alert("Insira o UF");
					frm.uf.focus();
				}
				else{
					alert("Selecione o País");
					frm.pais.focus();
			}
		}
	}
	
	function goFind() {
		document.getElementById("newAction").value = "goFind";
		document.getElementById("frm").submit();
	}
		
	$(document).ready(function(){
  		$('.letra').mask("SS");
	});
	
</script>

<%
	Estado estado = (Estado) request.getAttribute("object");
	if (estado == null) {
		estado = new Estado();
		estado.setPais(new Pais());
	}
	Object listPais[] = (Object[]) request.getAttribute("listPais");
%>

</head>
<body>
<div class="container">
<div class="well">
<fieldset>
	
	<form name="frm" id="frm" method="post" action="./dispatcher">
		<input type="hidden" name="newAction" id="newAction"/>
		<input type="hidden" name="entityName" id="entityName" value="Estado"/>
		<input type="hidden" name="id" id="id"/>
		
		<div id="legend">
			<legend><h2>Cadastrar <small>Estado</small></h2></legend>
		</div>	
		
		<br>
		<div class="col-lg-2">
			<label>Código</label>
			<div class="input-group">
  				<span class="input-group-addon"><b>ID</b></span>
  				<input class="form-control" readonly type="text" name="idestado" id="idestado" value="<%=(estado.getIdEstado() == null) ? "" : estado.getIdEstado()%>"/>
			</div>
		</div>
		
		<div class="col-lg-6">
			<label>Estado *</label>
			<input class="form-control" type="text" placeholder="Insira o Estado" name="estado" id="estado" maxlength="79" value="<%=(estado.getEstado() == null) ? "" : estado.getEstado()%>"/>
		</div>
		
		<div class="col-lg-2">
			<label>Unidade de Federação</label>
				<div class="input-group">
  					<span class="input-group-addon"><b>UF</b></span>
  					<input onChange="javascript:this.value=this.value.toUpperCase();" class="form-control letra" placeholder="Insira a UF" type="text" name="uf" id="uf" maxlength="2" value="<%=(estado.getUf() == null) ? "" : estado.getUf()%>"/>
			</div>
		</div>
				
		<div class="col-lg-2">
			<label>País *</label>
			<select class="form-control" name="pais" id="pais">
				<option value="">Selecione</option>
<%
	if (listPais != null) {			
		for(int i=0; i<listPais.length; i++) {
			Pais pais = (Pais) listPais[i];
			boolean bSelected = estado.getPais().getIdPais() == pais.getIdPais(); 
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=pais.getIdPais()%>"><%=pais.getPais()%></option>
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