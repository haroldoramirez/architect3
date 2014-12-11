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
<script type="text/javascript" src="./bootstrap/jquery/jquery-2.1.1.js"></script>
<script type="text/javascript" src="./bootstrap/jquery/jquery.mask.js"></script>

<title>Cadastrar Produto</title>

<script type="text/javascript">

	function save() {
		if ((document.getElementById("descricao").value != "") 
			&& (document.getElementById("quantidademinima").value != "")
			 && (document.getElementById("quantidadeemestoque").value != "")
			  && (document.getElementById("precodecusto").value != "")
			   && (document.getElementById("precodevenda").value != "")
				&& (document.getElementById("codigodebarras").value != "")
				 && (document.getElementById("categoria").value != "")
				  && (document.getElementById("unidadedemedida").value != "")
				   && (document.getElementById("fabricante").value != "")
				    && (document.getElementById("fornecedor").value != "")) {
			document.getElementById("newAction").value = "save";
			document.getElementById("frm").submit();	
		}else {
			if (document.getElementById("descricao").value == "") {
				alert("Insira a Descrição");
				frm.descricao.focus();
			}else
				if (document.getElementById("quantidademinima").value == "") {
					alert("Insira a Quantidade Mínima");
					frm.quantidademinima.focus();
				}else
					if (document.getElementById("quantidadeemestoque").value == "") {
						alert("Insira a Quantidade em Estoque");
						frm.quantidadeemestoque.focus();
					}else
						if (document.getElementById("precodecusto").value == "") {
							alert("Insira o Preço de Custo");
							frm.precodecusto.focus();
						}else
							if (document.getElementById("precodevenda").value == "") {
								alert("Insira o Preço de Venda");
								frm.precodevenda.focus();
							}else
								if (document.getElementById("codigodebarras").value == "") {
									alert("Insira o Código de Barras");
									frm.codigodebarras.focus();
								}else
									if (document.getElementById("categoria").value == "") {
										alert("Insira a Categoria");
										frm.categoria.focus();
									}else
										if (document.getElementById("unidadedemedida").value == "") {
											alert("Insira a Unidade de Medida");
											frm.unidadedemedida.focus();
										}else
											if (document.getElementById("fabricante").value == "") {
												alert("Insira o Fabricante");
												frm.fabricante.focus();
											}else
												if (document.getElementById("fornecedor").value == "") {
													alert("Insira o Fornecedor");
													frm.fornecedor.focus();
												}
		}

	}
	
	function goFind() {
		document.getElementById("newAction").value = "goFind";
		document.getElementById("frm").submit();
	}
		
	$(document).ready(function(){
		  $('.number').mask('000000000');
	});
	
	$(document).ready(function(){
		$('.money').mask('000.000,00', {reverse: true});
	});
	
</script>

<%
	Produto produto = (Produto) request.getAttribute("object");
	if (produto == null) {
		produto = new Produto();
		produto.setUnidadeDeMedida(new UnidadeDeMedida());
		produto.setFabricante(new Fabricante());
		produto.setFornecedor(new Fornecedor());
		produto.setCategoria(new Categoria());
	}
	Object listCategoria[] = (Object[]) request.getAttribute("listCategoria");
	Object listUnidadeDeMedida[] = (Object[]) request.getAttribute("listUnidadeDeMedida");
	Object listFabricante[] = (Object[]) request.getAttribute("listFabricante");
	Object listFornecedor[] = (Object[]) request.getAttribute("listFornecedor");
%>


</head>
<body>
<div class="container">
<div class="well">
<fieldset>
	
	<form name="frm" id="frm" method="post" action="./dispatcher">
		<input type="hidden" name="newAction" id="newAction"/>
		<input type="hidden" name="entityName" id="entityName" value="Produto"/>
		<input type="hidden" name="id" id="id"/>
		
		<div id="legend">
			<legend><h2>Cadastrar <small>Produto</small></h2></legend>
		</div>	
		
		<br>
		<div class="col-lg-2">
			<label>Código</label>
			<div class="input-group">
  				<span class="input-group-addon"><b>ID</b></span>
  				<input class="form-control" readonly type="text" name="idproduto" id="idproduto" value="<%=(produto.getIdProduto() == null) ? "" : produto.getIdProduto()%>"/>
			</div>
		</div>
		
		<div class="col-lg-7">
			<label>Descrição *</label>
			<input class="form-control" type="text" placeholder="Insira a Descrição do Produto" name="descricao" id="descricao" maxlength="150" value="<%=(produto.getDescricao() == null) ? "" : produto.getDescricao()%>"/>
		</div>
		
		<div class="col-lg-3">
			<label>Código de Barras *</label>
			<div class="input-group">
  				<span class="input-group-addon"><b><i class="glyphicon glyphicon-barcode"></i></b></span>
  				<input class="form-control" type="text" placeholder="000" name="codigodebarras" id="codigodebarras" maxlength="50" value="<%=(produto.getCodigodebarras() == null) ? "" : produto.getCodigodebarras()%>"/>
			</div>
		</div>
		
		<div class="col-lg-3">
		<br>
			<label>Categoria *</label>
			<select class="form-control" name="categoria" id="categoria">
				<option value="">Selecione</option>
<%
	if (listCategoria != null) {			
		for(int i=0; i<listCategoria.length; i++) {
			Categoria categoria = (Categoria) listCategoria[i];
			boolean bSelected = produto.getCategoria().getIdCategoria() == categoria.getIdCategoria();
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=categoria.getIdCategoria()%>"><%=categoria.getCategoria()%></option>
<%
		}
	}
%>
			</select>
		</div>
		
					
		<div class="col-lg-3">
		<br>
			<label>Unidade de Medida *</label>
			<select class="form-control" name="unidadedemedida" id="unidadedemedida">
				<option value="">Selecione</option>
<%
	if (listUnidadeDeMedida != null) {			
		for(int i=0; i<listUnidadeDeMedida.length; i++) {
			UnidadeDeMedida unidadedemedida = (UnidadeDeMedida) listUnidadeDeMedida[i];
			boolean bSelected = produto.getUnidadeDeMedida().getIdUnidadeDeMedida() == unidadedemedida.getIdUnidadeDeMedida();
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=unidadedemedida.getIdUnidadeDeMedida()%>"><%=unidadedemedida.getMedida()%></option>
<%
		}
	}
%>
			</select>
		</div>
			
		<div class="col-lg-3">
		<br>
			<label>Fabricante *</label>
			<select class="form-control" name="fabricante" id="fabricante">
				<option value="">Selecione</option>
<%
	if (listFabricante != null) {			
		for(int i=0; i<listFabricante.length; i++) {
			Fabricante fabricante = (Fabricante) listFabricante[i];
			boolean bSelected = produto.getFabricante().getIdFabricante() == fabricante.getIdFabricante(); 
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=fabricante.getIdFabricante()%>"><%=fabricante.getDescricao()%></option>
<%
		}
	}
%>
			</select>
		</div>	
					
		<div class="col-lg-3">
		<br>
			<label>Fornecedor *</label>
			<select class="form-control" name="fornecedor" id="fornecedor">
				<option value="">Selecione</option>
<%
	if (listFornecedor != null) {			
		for(int i=0; i<listFornecedor.length; i++) {
			Fornecedor fornecedor = (Fornecedor) listFornecedor[i];
			boolean bSelected = produto.getFornecedor().getIdFornecedor() == fornecedor.getIdFornecedor();
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=fornecedor.getIdFornecedor()%>"><%=fornecedor.getNomeFantasia()%></option>
<%
		}
	}
%>
			</select>
		</div>
			
		<div class="col-lg-3">
		<br>
			<label>Quantidade Mínima *</label>
			<input class="form-control number" type="text" placeholder="Insira a Quantidade" name="quantidademinima" id="quantidademinima" maxlength="9" value="<%=(produto.getQuantidadeMinima() == null) ? "" : produto.getQuantidadeMinima()%>"/>
		</div>
		
		<div class="col-lg-3">
		<br>
			<label>Quantidade em Estoque *</label>
			<input class="form-control number" type="text" placeholder="Insira a Quantidade" name="quantidadeemestoque" id="quantidadeemestoque" maxlength="9" value="<%=(produto.getQuantidadeEmEstoque() == null) ? "" : produto.getQuantidadeEmEstoque()%>"/>
		</div>
			
		<div class="col-lg-2">
		<br>
			<label>Preço de Custo $ *</label>
			<div class="input-group">
  				<span class="input-group-addon"><b>R$</b></span>
  				<input class="form-control money" type="text" placeholder="0,00" name="precodecusto" id="precodecusto" maxlength="10" value="<%=(produto.getPrecoDeCusto() == null) ? "" : produto.getPrecoDeCusto()%>"/>
			</div>
		</div>

			
		<div class="col-lg-2">
		<br>
			<label>Preço de Venda $ *</label>
			<div class="input-group">
  				<span class="input-group-addon"><b>R$</b></span>
  				<input class="form-control money" type="text" placeholder="0,00" name="precodevenda" id="precodevenda" maxlength="10" value="<%=(produto.getPrecoDeVenda() == null) ? "" : produto.getPrecoDeVenda()%>"/>
			</div>
		</div>
						
		<div class="col-lg-12">
		<br>
			<label>Observações *</label>
			<textarea rows="3" cols="3" class="form-control" placeholder="Informações Adicionais" name="observacoes" id="observacoes" maxlength="400"><%=(produto.getObservacoes() == null) ? "" : produto.getObservacoes()%></textarea>
			<br>
		</div>
		
		<div>	
			<legend></legend>
		</div>
			
		<div class="col-lg-10">
		<br>
			<strong>Campos obrigatórios são marcados (*)</strong>
		</div>
		
		<div class="col-lg-9">
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