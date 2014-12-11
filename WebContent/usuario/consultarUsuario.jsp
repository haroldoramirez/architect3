<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.Usuario"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">

<title>Consultar Usu�rio</title>

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
	Usuario usuarioFilter = (Usuario) request.getSession().getAttribute("filterUsuario");
	if (usuarioFilter == null) {
		usuarioFilter = new Usuario();
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
		<input type="hidden" name="entityName" id="entityName" value="Usuario"/>
		<input type="hidden" name="id" id="id"/>
		
		<div id="legend">
			<legend><h2>Consultar <small>Usu�rio</small></h2></legend>
		</div>	
			
		<div class="col-lg-3">
			<input autofocus="autofocus" type="text" class="form-control" placeholder="Digite o usu�rio" name="nome" id="usuario" maxlength="38" value="<%=(usuarioFilter.getNome() != null) ? usuarioFilter.getNome() : ""%>">
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
					<th>C�digo</th>
					<th>Nome</th>
					<th>Tipo de Conta</th>
					<th>Login</th>
					<th>Op��es</th>
				</tr>
<%
	if (list != null) {			
		for(int i=0; i<list.length; i++) {
			Usuario usuarioAux = (Usuario) list[i];
%>
				<tr>
					<td><%=usuarioAux.getIdUsuario()%></td>
					<td><a href="javascript:detail(<%=usuarioAux.getIdUsuario()%>);"><%=usuarioAux.getNome()%></a></td>
					<td><%=usuarioAux.getTipo()%></td>
					<td><%=usuarioAux.getLogin()%></td>
					<td>
						<a class="glyphicon glyphicon-pencil" href="javascript:detail(<%=usuarioAux.getIdUsuario()%>);"></a>&nbsp;
						<a class="glyphicon glyphicon-trash" href="javascript:remove(<%=usuarioAux.getIdUsuario()%>);"></a>
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