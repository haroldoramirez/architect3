<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.FormaDePagamento,
                 br.edu.udc.sistemas.architect3.entity.CondicaoDePagamento,
                 br.edu.udc.sistemas.architect3.entity.Cliente,
                 br.edu.udc.sistemas.architect3.entity.Usuario,
                 br.edu.udc.sistemas.architect3.entity.Venda"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">

<title>Consultar Venda</title>

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
	Venda vendaFilter = (Venda) request.getSession().getAttribute("filterVenda");
	if (vendaFilter == null) {
		vendaFilter = new Venda();
		vendaFilter.setCondicaoDePagamento(new CondicaoDePagamento());
		vendaFilter.setFormaDePagamento(new FormaDePagamento());
		vendaFilter.setCliente(new Cliente());
		vendaFilter.setUsuario(new Usuario());

	} else if (vendaFilter.getCondicaoDePagamento() == null 
			&& vendaFilter.getFormaDePagamento() == null 
			 && vendaFilter.getCliente() == null 
			  && vendaFilter.getUsuario() == null) {
		vendaFilter.setCondicaoDePagamento(new CondicaoDePagamento());
		vendaFilter.setFormaDePagamento(new FormaDePagamento());
		vendaFilter.setCliente(new Cliente());
		vendaFilter.setUsuario(new Usuario());
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
		<input type="hidden" name="entityName" id="entityName" value="Venda"/>
		<input type="hidden" name="id" id="id"/>
		
		<div id="legend">
			<legend><h2>Consultar <small>Vendas</small></h2></legend>
		</div>	
		
		<div class="col-lg-3">
			<input autofocus="autofocus" class="form-control" type="text" placeholder="Digite a data da venda" name="data" id="compra" maxlength="30" value="<%=(vendaFilter.getData() != null) ? vendaFilter.getData() : ""%>"/>
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
					<th>Data</th>
					<th>Vendedor</th>
					<th>Cliente</th>
					<th>Forma de Pagamento</th>
					<th>Condição de Pagamento</th>
					<th>Desconto $</th>
					<th>Valor Total $</th>
					<th>Opções</th>
				</tr>			
<%
	if (list != null) {			
		for(int i=0; i<list.length; i++) {
			Venda vendaAux = (Venda) list[i];
%>	
				<tr>
					<td><%=vendaAux.getIdVenda()%></td>
					<td><a href="javascript:detail(<%=vendaAux.getIdVenda()%>);"><%=vendaAux.getData()%></a></td>
					<td><%=vendaAux.getCliente()%></td>
					<td><%=vendaAux.getFormaDePagamento().getDescricao()%></td>
					<td><%=vendaAux.getCondicaoDePagamento().getDescricao()%></td>
					<td><%=vendaAux.getDesconto()%></td>
					<td><%=vendaAux.getValorTotal()%></td>
					<td>
						<a class="glyphicon glyphicon-pencil" href="javascript:detail(<%=vendaAux.getIdVenda()%>);"></a>&nbsp;
						<a class="glyphicon glyphicon-trash" href="javascript:remove(<%=vendaAux.getIdVenda()%>);"></a>
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