<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.Estado,br.edu.udc.sistemas.architect3.entity.Pais"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">

<title>Consultar Estado</title>

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
	Estado estadoFilter = (Estado) request.getSession().getAttribute("filterEstado");
	if (estadoFilter == null) {
		estadoFilter = new Estado();
		estadoFilter.setPais(new Pais());
	} else if (estadoFilter.getPais() == null) {
		estadoFilter.setPais(new Pais());
	}
	Object list[] = (Object[]) request.getAttribute("list");
	Object listPais[] = (Object[]) request.getAttribute("listPais");
%>

</head>
<body>
<div class="container-fluid">
<div class="well">
<fieldset>
	
	<Form name="frm" id="frm" method="post" action="./dispatcher">
		<input type="hidden" name="newAction" id="newAction"/>
		<input type="hidden" name="entityName" id="entityName" value="Estado"/>
		<input type="hidden" name="id" id="id"/>
		
		<div id="legend">
			<legend><h2>Consultar <small>Estado</small></h2></legend>
		</div>	
		
		<div class="col-lg-3">
			<input autofocus="autofocus" class="form-control" type="text" placeholder="Digite o estado" name="estado" id="estado" maxlength="30" value="<%=(estadoFilter.getEstado() != null) ? estadoFilter.getEstado() : ""%>"/>
		</div>
		
		<div class="col-lg-3">
				<select class="form-control" name="pais" id="pais">
					<option value="">Selecione o País</option>
<%
	if (listPais != null) {			
		for(int i=0; i<listPais.length; i++) {
			Pais pais = (Pais) listPais[i];
			boolean bSelected = estadoFilter.getPais().getIdPais() == pais.getIdPais(); 
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=pais.getIdPais()%>"><%=pais.getPais()%></option>
<%
		}
	}
%>
			</select>
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
					<th>Estado</th>
					<th>UF</th>
					<th>País</th>
					<th>Opções</th>
				</tr>			
<%
	if (list != null) {			
		for(int i=0; i<list.length; i++) {
			Estado estadoAux = (Estado) list[i];
%>	
				<tr>
					<td><%=estadoAux.getIdEstado()%></td>
					<td><a href="javascript:detail(<%=estadoAux.getIdEstado()%>);"><%=estadoAux.getEstado()%></a></td>
					<td><%=estadoAux.getUf()%></td>
					<td><%=estadoAux.getPais().getPais()%></td>
					<td>
						<a class="glyphicon glyphicon-pencil" href="javascript:detail(<%=estadoAux.getIdEstado()%>);"></a>&nbsp;
						<a class="glyphicon glyphicon-trash" href="javascript:remove(<%=estadoAux.getIdEstado()%>);"></a>
					</td>
				</tr>
<%
		}
	}
%>		
			</table>
		</div>
	  </Form>
	</fieldset>
		<div>	
			<legend></legend>
		</div>
</div>
</div>
</body>
</html>