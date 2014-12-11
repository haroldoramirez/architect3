<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.FormaDePagamento,
                 br.edu.udc.sistemas.architect3.entity.CondicaoDePagamento,
                 br.edu.udc.sistemas.architect3.entity.Fornecedor,
                 br.edu.udc.sistemas.architect3.entity.Usuario,
                 br.edu.udc.sistemas.architect3.entity.Compra"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">

<title>Consultar Compra</title>

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
	Compra compraFilter = (Compra) request.getSession().getAttribute("filterCompra");
	if (compraFilter == null) {
		compraFilter = new Compra();
		compraFilter.setCondicaoDePagamento(new CondicaoDePagamento());
		compraFilter.setFormaDePagamento(new FormaDePagamento());
		compraFilter.setFornecedor(new Fornecedor());
		compraFilter.setUsuario(new Usuario());

	} else if (compraFilter.getCondicaoDePagamento() == null 
			 && compraFilter.getFormaDePagamento() == null 
			  && compraFilter.getFornecedor() == null 
			   && compraFilter.getUsuario() == null) {
		compraFilter.setCondicaoDePagamento(new CondicaoDePagamento());
		compraFilter.setFormaDePagamento(new FormaDePagamento());
		compraFilter.setFornecedor(new Fornecedor());
		compraFilter.setUsuario(new Usuario());
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
		<input type="hidden" name="entityName" id="entityName" value="Compra"/>
		<input type="hidden" name="id" id="id"/>
		
		<div id="legend">
			<legend><h2>Consultar <small>Compras</small></h2></legend>
		</div>	
		
		<div class="col-lg-3">
			<input autofocus="autofocus" class="form-control" type="text" placeholder="Digite a data da compra" name="data" id="compra" maxlength="30" value="<%=(compraFilter.getData() != null) ? compraFilter.getData() : ""%>"/>
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
					<th>Comprador</th>
					<th>Fornecedor</th>
					<th>Forma de Pagamento</th>
					<th>Condição de Pagamento</th>
					<th>Desconto $</th>
					<th>Valor Total $</th>
					<th>Opções</th>
				</tr>			
<%
	if (list != null) {			
		for(int i=0; i<list.length; i++) {
			Compra compraAux = (Compra) list[i];
%>	
				<tr>
					<td><%=compraAux.getIdCompra()%></td>
					<td><a href="javascript:detail(<%=compraAux.getIdCompra()%>);"><%=compraAux.getData()%></a></td>
					<td><%=compraAux.getFornecedor()%></td>
					<td><%=compraAux.getFormaDePagamento().getDescricao()%></td>
					<td><%=compraAux.getCondicaoDePagamento().getDescricao()%></td>
					<td><%=compraAux.getDesconto()%></td>
					<td><%=compraAux.getValorTotal()%></td>
					<td>
						<a class="glyphicon glyphicon-pencil" href="javascript:detail(<%=compraAux.getIdCompra()%>);"></a>&nbsp;
						<a class="glyphicon glyphicon-trash" href="javascript:remove(<%=compraAux.getIdCompra()%>);"></a>
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