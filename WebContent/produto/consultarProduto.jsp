<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.Produto,
                 br.edu.udc.sistemas.architect3.entity.Fabricante,
                 br.edu.udc.sistemas.architect3.entity.Fornecedor,
                 br.edu.udc.sistemas.architect3.entity.UnidadeDeMedida,
                 br.edu.udc.sistemas.architect3.entity.Categoria"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">

<title>Consultar Produto</title>

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
	Produto produtoFilter = (Produto) request.getSession().getAttribute("filterProduto");
	if (produtoFilter == null) {
		produtoFilter = new Produto();
		produtoFilter.setUnidadeDeMedida(new UnidadeDeMedida());
		produtoFilter.setFabricante(new Fabricante());
		produtoFilter.setFornecedor(new Fornecedor());
		produtoFilter.setCategoria(new Categoria());
	} else if (produtoFilter.getUnidadeDeMedida() == null && produtoFilter.getFabricante() == null && produtoFilter.getFornecedor() == null && produtoFilter.getCategoria() == null) {
		produtoFilter.setUnidadeDeMedida(new UnidadeDeMedida());
		produtoFilter.setFabricante(new Fabricante());
		produtoFilter.setFornecedor(new Fornecedor());
		produtoFilter.setCategoria(new Categoria());
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
		<input type="hidden" name="entityName" id="entityName" value="Produto"/>
		<input type="hidden" name="id" id="id"/>
		
		<div id="legend">
			<legend><h2>Consultar <small>Produto</small></h2></legend>
		</div>	
		
		<div class="col-6 col-sm-4 col-lg-3">
			<input autofocus="autofocus" class="form-control" type="text" placeholder="Digite o produto" name="descricao" id="produto" maxlength="30" value="<%=(produtoFilter.getDescricao() != null) ? produtoFilter.getDescricao() : ""%>"/>
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
					<th>Quantidade em Estoque</th>
					<th>Preço de Venda $</th>
					<th>Preço de Custo $</th>
					<th>Fabricante</th>
					<th>Fornecedor</th>
					<th>Unidade de Medida</th>
					<th>Opções</th>
				</tr>	
				
<%
	if (list != null) {			
		for(int i=0; i<list.length; i++) {
			Produto produtoAux = (Produto) list[i];
%>	
				<tr>
					<td><%=produtoAux.getIdProduto()%></td>
					<td><a href="javascript:detail(<%=produtoAux.getIdProduto()%>);"><%=produtoAux.getDescricao()%></a></td>
					<td><%=produtoAux.getQuantidadeEmEstoque()%></td>
					<td><%=produtoAux.getPrecoDeVenda()%></td>
					<td><%=produtoAux.getPrecoDeCusto()%></td>
					<td><%=produtoAux.getFabricante().getDescricao()%></td>
					<td><%=produtoAux.getFornecedor().getRazaoSocial()%></td>
					<td><%=produtoAux.getUnidadeDeMedida().getMedida()%></td>
					<td>
						<a class="glyphicon glyphicon-pencil" href="javascript:detail(<%=produtoAux.getIdProduto()%>);"></a>&nbsp;
						<a class="glyphicon glyphicon-trash" href="javascript:remove(<%=produtoAux.getIdProduto()%>);"></a>
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