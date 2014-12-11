<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.Pais"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">

<title>Consultar País</title>

<script type="text/javascript">

	function find() {
		document.getElementById("newAction").value = "find";
		document.getElementById("frm").submit();
	}
	
	function clean() {
		document.getElementById("newAction").value = "clean";
		document.getElementById("frm").submit();
	}
	
	function remove(id) {
		if (confirm("Deseja apagar o registro?")) {
			document.getElementById("id").value = id;
			document.getElementById("newAction").value = "delete";
			document.getElementById("frm").submit();
		}		
	}
	
	function detail(id) {
		document.getElementById("id").value = id;
		document.getElementById("newAction").value = "detail";
		document.getElementById("frm").submit();
	}
	
	function goNew() {
		document.getElementById("newAction").value = "goNew";
		document.getElementById("frm").submit();
	}
	
</script>

<%
	Pais paisFilter = (Pais) request.getSession().getAttribute("filterPais");
	if (paisFilter == null) {
		paisFilter = new Pais();
	}
	Object list[] = (Object[]) request.getAttribute("list");
%>

</head>

<body>
<div class="container-fluid">
<div class="well">
<fieldset>
  
	<form name="frm" id="frm" method="post" action="./dispatcher">
		<input type="hidden" name="newAction" id="newAction"/>
		<input type="hidden" name="entityName" id="entityName" value="Pais"/>
		<input type="hidden" name="id" id="id"/>
		
		<div id="legend">
			<legend><h2>Consultar <small> País</small></h2></legend>
		</div>	

		<div class="col-lg-3">
			<input autofocus="autofocus" type="text" class="form-control" placeholder="Digite o país" name="pais" id="pais" maxlength="30" value="<%=(paisFilter.getPais() != null) ? paisFilter.getPais() : ""%>">
		</div>
		
		<div class="col-lg-12">
			<br>
			<button type="button" class="btn btn-primary" value="Consultar" onclick="find();">
				<span class="glyphicon glyphicon-search"></span> Consultar
			</button>
			<button type="button" class="btn btn-default" value="Limpar" onclick="clean();">
					<span class="glyphicon glyphicon-minus"></span> Limpar
			</button>
			<button type="button" class="btn btn-success" value="Novo" onclick="goNew();">
					<span class="glyphicon glyphicon-floppy-disk"></span> Novo
			</button>
		</div>
		
		<div class="col-lg-12">
		
		<br>
			<table class="table table-striped table-bordered">
				<tr>
					<th>Código</th>
					<th>País</th>
					<th>DDI</th>
					<th>Opções</th>
				</tr>
<%
	if (list != null) {			
		for(int i=0; i<list.length; i++) {
			Pais paisAux = (Pais) list[i];
%>
				<tr>
					<td><%=paisAux.getIdPais()%></td>
					<td><a href="javascript:detail(<%=paisAux.getIdPais()%>);"><%=paisAux.getPais()%></a></td>
					<td><%=paisAux.getDdi()%></td>
					<td>
						<a class="glyphicon glyphicon-pencil" href="javascript:detail(<%=paisAux.getIdPais()%>);"></a>&nbsp;
						<a class="glyphicon glyphicon-trash" href="javascript:remove(<%=paisAux.getIdPais()%>);"></a>
					</td>
				</tr>
<%
		}
	}
%>
			</table>
		</div>		
	</form>
</fieldset>
	<div>	
		<legend></legend>
	</div>
</div>
</div>
</body>
</html>