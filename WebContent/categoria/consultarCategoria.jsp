<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.Categoria"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">

<title>Consultar Categoria</title>

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
	Categoria categoriaFilter = (Categoria) request.getSession().getAttribute("filterCategoria");
	if (categoriaFilter == null) {
		categoriaFilter = new Categoria();
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
		<input type="hidden" name="entityName" id="entityName" value="Categoria"/>
		<input type="hidden" name="id" id="id"/>
		
		<div id="legend">
				<legend><h2>Consultar <small>Categoria</small></h2></legend>
		</div>	
		
		<div class="col-6 col-sm-4 col-lg-3">
			<input autofocus="autofocus" type="text" class="form-control" placeholder="Digite a categoria" name="categoria" id="categoria" maxlength="30" value="<%=(categoriaFilter.getCategoria() != null) ? categoriaFilter.getCategoria() : ""%>">
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
					<th>C�digo</th>
					<th>Categoria</th>
					<th>Op��es</th>
				</tr>
<%
	if (list != null) {			
		for(int i=0; i<list.length; i++) {
			Categoria categoriaAux = (Categoria) list[i];
%>
				<tr>
					<td><%=categoriaAux.getIdCategoria()%></td>
					<td><a href="javascript:detail(<%=categoriaAux.getIdCategoria()%>);"><%=categoriaAux.getCategoria()%></a></td>
					<td>
						<a class="glyphicon glyphicon-pencil" href="javascript:detail(<%=categoriaAux.getIdCategoria()%>);"></a>&nbsp;
						<a class="glyphicon glyphicon-trash" href="javascript:remove(<%=categoriaAux.getIdCategoria()%>);"></a>
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