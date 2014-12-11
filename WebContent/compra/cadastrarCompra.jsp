<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.Fornecedor,
                 br.edu.udc.sistemas.architect3.entity.Produto,
                 br.edu.udc.sistemas.architect3.entity.ItemCompra,
                 br.edu.udc.sistemas.architect3.entity.CondicaoDePagamento,
                 br.edu.udc.sistemas.architect3.entity.FormaDePagamento,
                 br.edu.udc.sistemas.architect3.entity.Compra,
                 br.edu.udc.sistemas.architect3.entity.Usuario,
                 br.edu.udc.sistemas.architect3.entity.Caixa"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
<script type="text/javascript" src="./bootstrap/jquery/jquery-2.1.1.js"></script>
<script type="text/javascript" src="./bootstrap/jquery/jquery.mask.js"></script>

<title>Cadastrar Compra</title>

<script type="text/javascript">

	var produtosGrid = []
	function addCompra() {
		var produto = document.getElementById("produto").value;
		
		var posicao = -1;
		for( var i = 0, j = listProdutoJs.length; i < j; i++ ) {
			if( listProdutoJs[i].codigo == produto && produtosGrid.indexOf( parseInt(produto) ) == -1  ) {
				produtosGrid.push( parseInt(produto) );
				posicao = i;
				break;
			}
			
		}
		
		if( posicao > -1 ) {
			$( "#tabelaproduto" ).append( "<tr><th>" + listProdutoJs[posicao].codigo + "</th><th>" + listProdutoJs[posicao].descricao + "</th><th>" + listProdutoJs[posicao].quantidade + "</th><th>" + listProdutoJs[posicao].precoDeCusto + "</th><th>" + listProdutoJs[posicao].precoDeVenda + "</th><th>" + listProdutoJs[posicao].fabricante + "</th></tr>" );
		} else {
			alert("Produto ja adicionado");
		}
		
	}
	
	function goFind() {
		document.getElementById("newAction").value = "goFind";
		document.getElementById("frm").submit();
	}
	
	function save() {																																
		document.getElementById("newAction").value = "save";
		document.getElementById("frm").submit();		
	}
	
	
</script>

<%
	Compra compra = (Compra) request.getAttribute("object");
	ItemCompra itemCompra = (ItemCompra) request.getAttribute("object");
	if (compra == null) {
		compra = new Compra();
		itemCompra = new ItemCompra();
		itemCompra.setProduto(new Produto());
		compra.setFornecedor(new Fornecedor());
		compra.setCondicaoDePagamento(new CondicaoDePagamento());
		compra.setFormaDePagamento(new FormaDePagamento());
		compra.setUsuario(new Usuario());
		compra.setCaixa(new Caixa());
	}
	
	Object listFornecedor[] = (Object[]) request.getAttribute("listFornecedor");
	Object listProduto[] = (Object[]) request.getAttribute("listProduto");
	Object listCondicaoDePagamento[] = (Object[]) request.getAttribute("listCondicaoDePagamento");
	Object listFormaDePagamento[] = (Object[]) request.getAttribute("listFormaDePagamento");
	Object listUsuario[] = (Object[]) request.getAttribute("listUsuario");
	Object listItemCompra[] = (Object[]) request.getAttribute("listItemCompra");
%>

<script>
<%
	
	out.println("var listProdutoJs = [];");
	
	for(int i=0; i<listProduto.length; i++) {
		Produto produto = (Produto) listProduto[i];

		out.print("listProdutoJs.push({"); 
			out.print("codigo : '" + produto.getIdProduto() + "',"); 
			out.print("descricao : '"+ produto.getDescricao() + "',");  
			out.print("quantidade : '"+ produto.getQuantidadeEmEstoque() + "',"); 
			out.print("precoDeVenda : '"+ produto.getPrecoDeVenda() + "',"); 
			out.print("precoDeCusto :'"+ produto.getPrecoDeCusto() + "',"); 
			out.print("fabricante : '"+ produto.getFabricante().getDescricao() + "',"); 
			out.print("fornecedor : '"+ produto.getFornecedor().getNomeFantasia() + "',"); 
			out.print("unidadeDeMedida : '"+ produto.getUnidadeDeMedida() + "',"); 	
		out.println("})"); 
	}
		
%>
</script>
</head>
<body>
<div class="container">
<div class="well">
	<fieldset>
		
			<form name="frm" id="frm" method="post" action="./dispatcher">
				<input type="hidden" name="newAction" id="newAction"/>
				<input type="hidden" name="entityName" id="entityName" value="Compra"/>
				<input type="hidden" name="id" id="id"/>
				
				<div>
					<legend><h2>Cadastrar <small>Compra</small></h2></legend>
				</div>
					
				<br>
					<div class="col-lg-2">
		    				<label>Código</label> 
		    			<div class="input-group">
  							<span class="input-group-addon"><b>ID</b></span>
  							<input class="form-control" readonly type="text" name="idcompra" id="idcompra" value="<%=(compra.getIdCompra() == null) ? "" : compra.getIdCompra()%>"/>
						</div>
					</div>
					
					<div class="col-lg-3">
						<label>Data da Compra *</label>
							<div class="input-group date">
  								<span class="input-group-addon"><b><i class="glyphicon glyphicon-calendar"></i></b></span>
  								<input class="form-control" type="date" name="data" id="data" value="<%=(compra.getData() == null) ? "" : compra.getData()%>"/>
							</div>
					</div>
									
					<div class="col-lg-7">
			            <label>Fornecedor *</label>
						<select class="form-control" name="fornecedor" id="fornecedor">
							<option value="">Selecione</option>
<%
	if (listFornecedor != null) {			
		for(int i=0; i<listFornecedor.length; i++) {
			Fornecedor fornecedor = (Fornecedor) listFornecedor[i];
			boolean bSelected = compra.getFornecedor().getIdFornecedor() == fornecedor.getIdFornecedor();
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=fornecedor.getIdFornecedor()%>"><%=fornecedor.getNomeFantasia()%></option>
<%
		}
	}
%>
						</select>
					</div>
					
					<div class="col-lg-2">
					<br>
		    			<label>Quantidade *</label> 
		    			<div class="input-group">
  							<span class="input-group-addon"><b>#</b></span>
  							<input class="form-control" type="text" name="quantidade" id="quantidade" value="<%=(itemCompra.getQuantidade() == null) ? "" : itemCompra.getQuantidade()%>"/>
						</div>
					</div>
				 			            
			         <div class="col-lg-10">
			  		 <br>
			         	  <label>Produto *</label>
    							<div class="input-group">
      								<select class="form-control" name="produto" id="produto">
										<option value="">Selecione</option>
<%
	if (listProduto != null) {			
		for(int i=0; i<listProduto.length; i++) {
			Produto produto = (Produto) listProduto[i];
			boolean bSelected = itemCompra.getProduto().getIdProduto() == produto.getIdProduto();
%>
										<option <%=bSelected ? "selected" : "" %> value="<%=produto.getIdProduto()%>"><%=produto.getDescricao()%></option>
<%
		}
	}
%>
									</select>
      									<span class="input-group-btn">
        									<button class="btn btn-success" type="button" value="Adicionar" onclick="addCompra();">
        										<span class="glyphicon glyphicon-list-alt"></span> Adicionar
        									</button>
      								</span>
   								 </div>
 					 </div>

					
					<div class="col-lg-12">
					<br>
					<table  class="table table-striped table-bordered">
							<tr>
								<th>Código</th>
								<th>Descrição</th>
								<th>Quantidade</th>
								<th>Preço de Custo</th>
								<th>Preço de Venda</th>
								<th>Fabricante</th>
							</tr>
						</table>
						</div>
					<div class="col-lg-12" style="height:260px; overflow-y:scroll">
						<table id="tabelaproduto" class="table table-striped table-bordered">
						</table>
					</div>
					
					<div class="col-lg-4">
					<br>
			            <label>Condição de Pagamento *</label>
						<select class="form-control" name="condicaodepagamento" id="condicaodepagamento">
							<option value="">Selecione</option>
<%
	if (listCondicaoDePagamento != null) {			
		for(int i=0; i<listCondicaoDePagamento.length; i++) {
			CondicaoDePagamento condicaoDePagamento = (CondicaoDePagamento) listCondicaoDePagamento[i];
			boolean bSelected = compra.getCondicaoDePagamento().getIdCondicaoDePagamento() == condicaoDePagamento.getIdCondicaoDePagamento();
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=condicaoDePagamento.getIdCondicaoDePagamento()%>"><%=condicaoDePagamento.getDescricao()%></option>
<%
		}
	}
%>
						</select>
					</div>
					
					<div class="col-lg-4">
					<br>
			            <label>Forma de Pagamento *</label>
						<select class="form-control" name="formadepagamento" id="formadepagamento">
							<option value="">Selecione</option>
<%
	if (listFormaDePagamento != null) {			
		for(int i=0; i<listFormaDePagamento.length; i++) {
			FormaDePagamento formaDePagamento = (FormaDePagamento) listFormaDePagamento[i];
			boolean bSelected = compra.getFormaDePagamento().getIdFormaDePagamento() == formaDePagamento.getIdFormaDePagamento();
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=formaDePagamento.getIdFormaDePagamento()%>"><%=formaDePagamento.getDescricao()%></option>
<%
		}
	}
%>
						</select>
					</div>
					
					<div class="col-lg-2">
					<br>
						<label>Desconto $ *</label>
							<div class="input-group">
  								<span class="input-group-addon"><b>R$</b></span>
  							<input class="form-control money" type="text" placeholder="0,00" name="desconto" id="desconto" maxlength="10" value=""/>
						</div>
					</div>
					
					<div class="col-lg-2">
					<br>
						<label>Valor da Compra $ *</label>
							<div class="input-group">
  								<span class="input-group-addon"><b>R$</b></span>
  							<input class="form-control money" type="text" placeholder="0,00" name="valordecompra" id="valordecompra" maxlength="10" value=""/>
						</div>
					</div>
										
					<div class="col-lg-2">
					<br>
						<label>Valor Total $ *</label>
							<div class="input-group">
  								<span class="input-group-addon"><b>R$</b></span>
  							<input class="form-control money" type="text" placeholder="0,00" name="precototal" id="precototal" maxlength="10" value=""/>
						</div>
						<br>
					</div>
				<div>	
					<legend></legend>
				</div>
					<div class="col-lg-12">
						<br>
							<strong>Campos obrigatórios são marcados (*)</strong>
					</div>
					
						<div class="col-lg-12">
							<br>
							<button type="button" class="btn btn-success" value="Salvar" onclick="save();">
								<span class="glyphicon glyphicon-ok"></span> Salvar
							</button>
							<button type="button" class="btn btn-primary" value="Voltar" onclick="goFind();">
								<span class="glyphicon glyphicon-arrow-left"></span> Voltar
							</button>
						</div>
			</form>
	</fieldset>
	</div>
</div>
</body>
</html>