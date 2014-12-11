<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.Fabricante"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">

<title>Consultar Fabricante</title>

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
	Fabricante fabricanteFilter = (Fabricante) request.getSession().getAttribute("filterFabricante");
	if (fabricanteFilter == null) {
		fabricanteFilter = new Fabricante();
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
		<input type="hidden" name="entityName" id="entityName" value="Fabricante"/>
		<input type="hidden" name="id" id="id"/>
		
		<div id="legend">
			<legend><h2>Consultar <small>Fabricante</small></h2></legend>
		</div>
		
		<div class="col-6 col-sm-4 col-lg-3">
			<input autofocus="autofocus" type="text" class="form-control" placeholder="Digite o fabricante" name="descricao" id="fabricante" maxlength="150" value="<%=(fabricanteFilter.getDescricao() != null) ? fabricanteFilter.getDescricao() : ""%>">
		</div>
	
		<div class="col-6 col-sm-4 col-lg-12">
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
	
		<div class="col-6 col-sm-4 col-lg-12">
			<br>
			<table class="table table-striped table-bordered">
				<tr>
					<th>Código</th>
					<th>Descrição</th>
					<th>Observações</th>
					<th>Opções</th>
				</tr>
<%
	if (list != null) {			
		for(int i=0; i<list.length; i++) {
			Fabricante fabricanteAux = (Fabricante) list[i];
%>
				<tr>
					<td><%=fabricanteAux.getIdFabricante()%></td>
					<td><a href="javascript:detail(<%=fabricanteAux.getIdFabricante()%>);"><%=fabricanteAux.getDescricao()%></a></td>
					<td><%=fabricanteAux.getObservacoes()%></td>
					<td>
						<a class="glyphicon glyphicon-pencil" href="javascript:detail(<%=fabricanteAux.getIdFabricante()%>);"></a>&nbsp;
						<a class="glyphicon glyphicon-trash" href="javascript:remove(<%=fabricanteAux.getIdFabricante()%>);"></a>
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