<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.Cliente,
                 br.edu.udc.sistemas.architect3.entity.Produto,
                 br.edu.udc.sistemas.architect3.entity.ItemVenda,
                 br.edu.udc.sistemas.architect3.entity.CondicaoDePagamento,
                 br.edu.udc.sistemas.architect3.entity.FormaDePagamento,
                 br.edu.udc.sistemas.architect3.entity.Venda,
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

	function addVenda() {
		alert("teste");
		document.getElementById("frm").submit();	
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
	Venda venda = (Venda) request.getAttribute("object");
	ItemVenda itemVenda = (ItemVenda) request.getAttribute("object");
	if (venda == null) {
		venda = new Venda();
		itemVenda = new ItemVenda();
		itemVenda.setProduto(new Produto());
		venda.setCliente(new Cliente());
		venda.setCondicaoDePagamento(new CondicaoDePagamento());
		venda.setFormaDePagamento(new FormaDePagamento());
		venda.setUsuario(new Usuario());
		venda.setCaixa(new Caixa());
	}
	
	Object listCliente[] = (Object[]) request.getAttribute("listCliente");
	Object listProduto[] = (Object[]) request.getAttribute("listProduto");
	Object listCondicaoDePagamento[] = (Object[]) request.getAttribute("listCondicaoDePagamento");
	Object listFormaDePagamento[] = (Object[]) request.getAttribute("listFormaDePagamento");
	Object listUsuario[] = (Object[]) request.getAttribute("listUsuario");
	Object listItemVenda[] = (Object[]) request.getAttribute("listItemVenda");
%>

</head>
<body>
<div class="container">
<div class="well">
	<fieldset>
		
			<form name="frm" id="frm" method="post" action="./dispatcher">
				<input type="hidden" name="newAction" id="newAction"/>
				<input type="hidden" name="entityName" id="entityName" value="Venda"/>
				<input type="hidden" name="id" id="id"/>
				
				<div id="legend">
					<legend><h2>Cadastrar <small>Venda</small></h2></legend>
				</div>
					
				<br>
					<div class="col-lg-2">
		    				<label>Código</label> 
		    			<div class="input-group">
  							<span class="input-group-addon"><b>ID</b></span>
  							<input class="form-control" readonly type="text" name="idcompra" id="idcompra" value="<%=(venda.getIdVenda() == null) ? "" : venda.getIdVenda()%>"/>
						</div>
					</div>
					
					<div class="col-lg-3">
						<label>Data da Venda *</label>
							<div class="input-group date">
  								<span class="input-group-addon"><b><i class="glyphicon glyphicon-calendar"></i></b></span>
  								<input class="form-control" type="date" name="data" id="data" value="<%=(venda.getData() == null) ? "" : venda.getData()%>"/>
							</div>
					</div>
									
					<div class="col-lg-7">
			            <label>Cliente *</label>
						<select class="form-control" name="cliente" id="cliente">
							<option>Selecione</option>
<%
	if (listCliente != null) {			
		for(int i=0; i<listCliente.length; i++) {
			Cliente cliente = (Cliente) listCliente[i];
			boolean bSelected = venda.getCliente().getIdCliente() == cliente.getIdCliente();
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=cliente.getIdCliente()%>"><%=cliente.getNome()%></option>
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
  							<input class="form-control" type="text" name="quantidade" id="quantidade" value="<%=(itemVenda.getQuantidade() == null) ? "" : itemVenda.getQuantidade()%>"/>
						</div>
					</div>
							            
			         <div class="col-lg-10">
			  		 <br>
			         	  <label>Produto *</label>
    							<div class="input-group">
      								<select class="form-control" name="produto" id="produto">
										<option>Selecione</option>
<%
	if (listProduto != null) {			
		for(int i=0; i<listProduto.length; i++) {
			Produto produto = (Produto) listProduto[i];
			boolean bSelected = itemVenda.getProduto().getIdProduto() == produto.getIdProduto();
%>
										<option <%=bSelected ? "selected" : "" %> value="<%=produto.getIdProduto()%>"><%=produto.getDescricao()%></option>
<%
		}
	}
%>
									</select>
      									<span class="input-group-btn">
        									<button class="btn btn-success" type="button" value="Adicionar" onclick="addCompra();"> + Adicionar</button>
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
							<option>Selecione</option>
<%
	if (listCondicaoDePagamento != null) {			
		for(int i=0; i<listCondicaoDePagamento.length; i++) {
			CondicaoDePagamento condicaoDePagamento = (CondicaoDePagamento) listCondicaoDePagamento[i];
			boolean bSelected = venda.getCondicaoDePagamento().getIdCondicaoDePagamento() == condicaoDePagamento.getIdCondicaoDePagamento();
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
							<option>Selecione</option>
<%
	if (listFormaDePagamento != null) {			
		for(int i=0; i<listFormaDePagamento.length; i++) {
			FormaDePagamento formaDePagamento = (FormaDePagamento) listFormaDePagamento[i];
			boolean bSelected = venda.getFormaDePagamento().getIdFormaDePagamento() == formaDePagamento.getIdFormaDePagamento();
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
  							<input class="form-control money" type="text" placeholder="0,00" name="precodecusto" id="precodecusto" maxlength="10" value=""/>
						</div>
					</div>
					
					<div class="col-lg-2">
					<br>
						<label>Valor da Venda $ *</label>
							<div class="input-group">
  								<span class="input-group-addon"><b>R$</b></span>
  							<input class="form-control money" type="text" placeholder="0,00" name="precodecusto" id="precodecusto" maxlength="10" value=""/>
						</div>
					</div>
							
					<div class="col-lg-2">
					<br>
						<label>Valor Total $ *</label>
							<div class="input-group">
  								<span class="input-group-addon"><b>R$</b></span>
  							<input class="form-control money" type="text" placeholder="0,00" name="precodecusto" id="precodecusto" maxlength="10" value=""/>
						</div>
						<br>
					</div>
					
					<div>	
						<legend></legend>
					</div>
					
					<div class="col-lg-9">
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