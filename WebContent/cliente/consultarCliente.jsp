<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.Cliente,
                 br.edu.udc.sistemas.architect3.entity.Pais,
                 br.edu.udc.sistemas.architect3.entity.Estado,
                 br.edu.udc.sistemas.architect3.entity.Cidade"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">

<title>Consultar Cliente</title>

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
	Cliente clienteFilter = (Cliente) request.getSession().getAttribute("filterCliente");
	if (clienteFilter == null) {
		clienteFilter = new Cliente();
		clienteFilter.setPais(new Pais());
		clienteFilter.setEstado(new Estado());
		clienteFilter.setCidade(new Cidade());
	} else if (clienteFilter.getPais() == null 
			&& clienteFilter.getEstado() == null 
			 && clienteFilter.getCidade() == null) {
		clienteFilter.setPais(new Pais());
		clienteFilter.setEstado(new Estado());
		clienteFilter.setCidade(new Cidade());
	}
	Object list[] = (Object[]) request.getAttribute("list");
%>

</head>
<body>
<div class="container-fluid">
<div class="well">
<fieldset>
	
	<Form name="frm" id="frm" method="post" action="./dispatcher">
		<input type="hidden" name="newAction" id="newAction"/>
		<input type="hidden" name="entityName" id="entityName" value="Cliente"/>
		<input type="hidden" name="id" id="id"/>
		
		<div id="legend">
			<legend><h2>Consultar <small>Cliente</small></h2></legend>
		</div>	
		
		<div class="col-lg-3">
			<input autofocus="autofocus" class="form-control" type="text" placeholder="Digite o nome" name="nome" id="cliente" maxlength="38" value="<%=(clienteFilter.getNome() != null) ? clienteFilter.getNome() : ""%>"/>
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
					<th>Nome</th>
					<th>Telefone</th>
					<th>Celular</th>
					<th>Email</th>
					<th>RG</th>
					<th>CPF</th>
					<th>Cidade</th>
					<th>Opções</th>
				</tr>			
<%
	if (list != null) {			
		for(int i=0; i<list.length; i++) {
			Cliente clienteAux = (Cliente) list[i];
%>	
				<tr>
					<td><%=clienteAux.getIdCliente()%></td>
					<td><a href="javascript:detail(<%=clienteAux.getIdCliente()%>);"><%=clienteAux.getNome()%></a></td>
					<td><%=clienteAux.getTelefone()%></td>
					<td><%=clienteAux.getCelular()%></td>
					<td><%=clienteAux.getEmail()%></td>
					<td><%=clienteAux.getRg()%></td>
					<td><%=clienteAux.getCpf()%></td>
					<td><%=clienteAux.getCidade().getCidade()%></td>
					<td>
						<a class="glyphicon glyphicon-pencil" href="javascript:detail(<%=clienteAux.getIdCliente()%>);"></a>&nbsp;
						<a class="glyphicon glyphicon-trash" href="javascript:remove(<%=clienteAux.getIdCliente()%>);"></a>
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