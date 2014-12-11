<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.FormaDePagamento"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">

<title>Consultar Forma de Pagamento</title>

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
	FormaDePagamento formaDePagamentoFilter = (FormaDePagamento) request.getSession().getAttribute("filterFormaDePagamento");
	if (formaDePagamentoFilter == null) {
		formaDePagamentoFilter = new FormaDePagamento();
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
		<input type="hidden" name="entityName" id="entityName" value="FormaDePagamento"/>
		<input type="hidden" name="id" id="id"/>
		
		<div id="legend">
			<legend><h2>Consultar <small>Forma de Pagamento</small></h2></legend>
		</div>	
		
		<div class="col-lg-3">
			<input autofocus="autofocus" type="text" class="form-control" placeholder="Digite a forma de pagamento" name="descricao" id="formadepagamento" maxlength="30" value="<%=(formaDePagamentoFilter.getDescricao() != null) ? formaDePagamentoFilter.getDescricao() : ""%>">
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
					<th>Descrição</th>
					<th>Opções</th>
				</tr>
<%
	if (list != null) {			
		for(int i=0; i<list.length; i++) {
			FormaDePagamento formaDePagamentoAux = (FormaDePagamento) list[i];
%>
				<tr>
					<td><%=formaDePagamentoAux.getIdFormaDePagamento()%></td>
					<td><a href="javascript:detail(<%=formaDePagamentoAux.getIdFormaDePagamento()%>);"><%=formaDePagamentoAux.getDescricao()%></a></td>
					<td>
						<a class="glyphicon glyphicon-pencil" href="javascript:detail(<%=formaDePagamentoAux.getIdFormaDePagamento()%>);"></a>&nbsp;
						<a class="glyphicon glyphicon-trash" href="javascript:remove(<%=formaDePagamentoAux.getIdFormaDePagamento()%>);"></a>
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
</div>
</div>
</body>
</html>