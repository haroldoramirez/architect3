<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="br.edu.udc.sistemas.architect3.entity.Contas,
    				 br.edu.udc.sistemas.architect3.entity.ItemConta,
                 	 br.edu.udc.sistemas.architect3.entity.CondicaoDePagamento,
                 	 br.edu.udc.sistemas.architect3.entity.FormaDePagamento"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
<script type="text/javascript" src="./bootstrap/jquery/jquery-2.1.1.js"></script>
<script type="text/javascript" src="./bootstrap/jquery/jquery.mask.js"></script>

<title>Cadastrar Contas</title>

<script type="text/javascript">

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
	Contas contas = (Contas) request.getAttribute("object");
	ItemConta itemConta = (ItemConta) request.getAttribute("object");
	if (contas == null) {
		contas = new Contas();
		itemConta = new ItemConta();
		contas.setCondicaoDePagamento(new CondicaoDePagamento());
		contas.setFormaDePagamento(new FormaDePagamento());
	}
	
	Object listCondicaoDePagamento[] = (Object[]) request.getAttribute("listCondicaoDePagamento");
	Object listFormaDePagamento[] = (Object[]) request.getAttribute("listFormaDePagamento");
	Object listItemConta[] = (Object[]) request.getAttribute("listItemConta");
%>
</head>
<body>
	<div class="container">
		<div class="well">
			<fieldset>
				<form name="frm" id="frm" method="post" action="./dispatcher">
					<input type="hidden" name="newAction" id="newAction"/>
					<input type="hidden" name="entityName" id="entityName" value="Contas"/>
					<input type="hidden" name="id" id="id"/>
					
					<div id="legend">
						<legend><h2>Cadastrar <small>Contas</small></h2></legend>
					</div>
					
					<div class="col-lg-2">
		    				<label>Código</label> 
		    			<div class="input-group">
  							<span class="input-group-addon"><b>ID</b></span>
  							<input class="form-control" readonly type="text" name="idconta" id="idconta" value="<%=(contas.getIdConta() == null) ? "" : contas.getIdConta()%>"/>
						</div>
					</div>
					
					<div class="col-lg-3">
						<label>Tipo de Conta *</label>
							<select class="form-control" name="tipo" id="tipo">
<%
	if (contas.getTipoDeConta() != null) {			
		if (contas.getTipoDeConta().equals("P")) {		
%>		
		<option value="P" selected >A Pagar</option>
		<option value="R" >A Receber</option>
<%
		} else {
%>
			<option value="R" selected >A Receber</option>
			<option value="P" >A Pagar</option>
<%
		}		
	} else {
		%>
			<option value="">Selecione</option>
			<option value="R">A Receber</option>
			<option value="T">A Pagar</option>
		<%
		
	}
%>
							</select>
					</div>
					
					<div class="col-lg-7">
		    				<label>Número da Fatura *</label> 
		    			<div class="input-group">
  							<span class="input-group-addon"><b>Nº</b></span>
  							<input class="form-control" type="text" name="numerofatura" id="numerofatura" value="<%=(contas.getNumeroFatura() == null) ? "" : contas.getNumeroFatura()%>"/>
						</div>
					</div>
					
					<div class="col-lg-3">
					<br>
						<label>Data de Vencimento *</label>
							<div class="input-group date">
  								<span class="input-group-addon"><b><i class="glyphicon glyphicon-calendar"></i></b></span>
  								<input class="form-control" type="date" name="datavencimento" id="datavencimento" value="<%=(contas.getDataVencimento() == null) ? "" : contas.getDataVencimento()%>"/>
							</div>
					</div>
					
					<div class="col-lg-3">
					<br>
						<label>Data de Pagamento *</label>
							<div class="input-group date">
  								<span class="input-group-addon"><b><i class="glyphicon glyphicon-calendar"></i></b></span>
  								<input class="form-control" type="date" name="datapagamento" id="datapagamento" value="<%=(contas.getDataPagamento() == null) ? "" : contas.getDataPagamento()%>"/>
							</div>
							<br>
					</div>
					<div class="col-lg-3">
					<br>
						<label>Parcelas *</label>
							<select class="form-control" name="parcelas" id="parcelas">	
<%
	if (contas.getParcelas() != null) {			
		if (contas.getParcelas().equals("1")) {		
%>		
		<option value="1" selected>1</option>
		<option value="2">2</option>
		<option value="3">3</option>
<%
		} else if (contas.getParcelas().equals("2")) {
%>
		<option value="1">1</option>
		<option value="2" selected>2</option>
		<option value="3">3</option>
<%
		} else if (contas.getParcelas().equals("3")) {
%>
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3" selected>3</option>
<%
		} 		
	} else {
		%>
			<option value="">Selecione</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
		<%
		
	}
%>
							</select>
					</div>
					<div class="col-lg-3">
					<br>
						<label>Valor da Fatura *</label>
							<div class="input-group date">
  								<span class="input-group-addon"><b>R$</b></span>
  								<input class="form-control" type="text" name="valorfatura" id="valorfatura" value="<%=(contas.getValorFatura() == null) ? "" : contas.getValorFatura()%>"/>
							</div>
					</div>
					<div class="col-lg-7">
			            <label>Ordem *</label>
						<select class="form-control" name="ordem" id="ordem">
							<option value="">Selecione</option>
<%
	if (listItemConta != null) {			

	}
%>
						</select>
					</div>
					<div class="col-lg-12">
					<br>
					<table  class="table table-striped table-bordered">
							<tr>
								<th>Código</th>
								<th>Cliente</th>
								<th>Produto</th>
								<th>Condição de Pagamento</th>
								<th>Valor Ordem</th>
							</tr>
						</table>
						</div>
					<div class="col-lg-12" style="height:260px; overflow-y:scroll">
						<table id="tabelaordem" class="table table-striped table-bordered">
						</table>
					</div>
					
					<div>	
					    <legend></legend>
					</div>
					
					<div class="col-lg-2">
						<label>Total $ *</label>
							<div class="input-group">
  								<span class="input-group-addon"><b>R$</b></span>
  							<input class="form-control money" type="text" placeholder="0,00" name="total" id="total" maxlength="10" value=""/>
						</div>
						<br>
					</div>
					
					<div>	
					    <legend></legend>
					</div>
					
					<div class="col-lg-2">
						<label>Total da Conta $ *</label>
							<div class="input-group">
  								<span class="input-group-addon"><b>R$</b></span>
  							<input class="form-control money" type="text" placeholder="0,00" name="precototal" id="precototal" maxlength="10" value=""/>
						</div>
						<br>
					</div>
					
					<div class="col-lg-2">
						<label>Juros $ *</label>
							<div class="input-group">
  								<span class="input-group-addon"><b>R$</b></span>
  							<input class="form-control money" type="text" placeholder="0,00" name="juros" id="juros" maxlength="10" value=""/>
						</div>
						<br>
					</div>
					
					<div class="col-lg-2">
						<label>Desconto % *</label>
							<div class="input-group">
  								<span class="input-group-addon"><b>R$</b></span>
  							<input class="form-control money" type="text" placeholder="0,00" name="desconto" id="desconto" maxlength="10" value=""/>
						</div>
						<br>
					</div>
					
					<div class="col-lg-2">
						<label>Multa $ *</label>
							<div class="input-group">
  								<span class="input-group-addon"><b>R$</b></span>
  							<input class="form-control money" type="text" placeholder="0,00" name="multa" id="multa" maxlength="10" value=""/>
						</div>
						<br>
					</div>
					
					<div class="col-lg-2">
						<label>Valor Pago $ *</label>
							<div class="input-group">
  								<span class="input-group-addon"><b>R$</b></span>
  							<input class="form-control money" type="text" placeholder="0,00" name="valorpago" id="valorpago" maxlength="10" value=""/>
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