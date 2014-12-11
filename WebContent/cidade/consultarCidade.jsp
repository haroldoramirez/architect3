<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.Cidade,br.edu.udc.sistemas.architect3.entity.Estado"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">

<title>Consultar Cidade</title>

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
	Cidade cidadeFilter = (Cidade) request.getSession().getAttribute("filterCidade");
	if (cidadeFilter == null) {
		cidadeFilter = new Cidade();
		cidadeFilter.setEstado(new Estado());
	} else if (cidadeFilter.getEstado() == null) {
		cidadeFilter.setEstado(new Estado());
	}
	Object list[] = (Object[]) request.getAttribute("list");
	Object listEstado[] = (Object[]) request.getAttribute("listEstado");
%>

</head>
<body>
<div class="container-fluid">
<div class="well">
<fieldset>
	
	<Form name="frm" id="frm" method="post" action="./dispatcher">
		<input type="hidden" name="newAction" id="newAction"/>
		<input type="hidden" name="entityName" id="entityName" value="Cidade"/>
		<input type="hidden" name="id" id="id"/>
		
		<div id="legend">
				<legend><h2>Consultar <small>Cidade</small></h2></legend>
		</div>	
		
		<div class="col-lg-3">
			<input autofocus="autofocus" class="form-control" type="text" placeholder="Digite a cidade" name="cidade" id="cidade" maxlength="30" value="<%=(cidadeFilter.getCidade() != null) ? cidadeFilter.getCidade() : ""%>"/>
		</div>
		
		<div class="col-lg-3">
				<select class="form-control" name="estado" id="estado">
				<option value="">Selecione o Estado</option>
<%
	if (listEstado != null) {			
		for(int i=0; i<listEstado.length; i++) {
			Estado estado = (Estado) listEstado[i];
			boolean bSelected = cidadeFilter.getEstado().getIdEstado() == estado.getIdEstado(); 
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=estado.getIdEstado()%>"><%=estado.getEstado()%></option>
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
					<th>Cidade</th>
					<th>DDD</th>
					<th>Estado</th>
					<th>Opções</th>
				</tr>			
<%
	if (list != null) {			
		for(int i=0; i<list.length; i++) {
			Cidade cidadeAux = (Cidade) list[i];
%>	
				<tr>
					<td><%=cidadeAux.getIdCidade()%></td>
					<td><a href="javascript:detail(<%=cidadeAux.getIdCidade()%>);"><%=cidadeAux.getCidade()%></a></td>
					<td><%=cidadeAux.getDdd()%></td>
					<td><%=cidadeAux.getEstado().getEstado()%></td>
					<td>
						<a class="glyphicon glyphicon-pencil" href="javascript:detail(<%=cidadeAux.getIdCidade()%>);"></a>&nbsp;
						<a class="glyphicon glyphicon-trash" href="javascript:remove(<%=cidadeAux.getIdCidade()%>);"></a>
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