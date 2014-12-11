<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.Caixa"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
<script type="text/javascript" src="./bootstrap/jquery/jquery-2.1.1.js"></script>
<script type="text/javascript" src="./bootstrap/jquery/jquery.mask.js"></script>

<title>Cadastrar Caixa</title>

<script type="text/javascript">

	function save() {
		if ((document.getElementById("situacao").value != "") 
				&& (document.getElementById("descricao").value != "") 
				  && (document.getElementById("dataabertura").value != "")
				   && (document.getElementById("datafechamento").value != "")
				    && (document.getElementById("valorabertura").value != "")
				     && (document.getElementById("valorfechamento").value != "")) {
			document.getElementById("newAction").value = "save";
			document.getElementById("frm").submit();
		}else{
			if (document.getElementById("situacao").value == "") {
				alert("Insira a Situação");
				frm.situacao.focus();
			}else
				if (document.getElementById("descricao").value == "") {
					alert("Insira a Descrição");
					frm.descricao.focus();
				}else
					if (document.getElementById("dataabertura").value == "") {
						alert("Insira a Data de Abertura");
						frm.dataabertura.focus();
					}else
						if (document.getElementById("datafechamento").value == "") {
							alert("Insira a Data de Fechamento");
							frm.datafechamento.focus();
						}else
							if (document.getElementById("valorabertura").value == "") {
								alert("Insira o Valor de Abertura");
								frm.valorabertura.focus();
							}else
								if (document.getElementById("valorfechamento").value == "") {
									alert("Insira o Valor de Fechamento");
									frm.valorfechamento.focus();
								}
		}
			
	}
		
	function goFind() {
		document.getElementById("newAction").value = "goFind";
		document.getElementById("frm").submit();
	}
	
	$(document).ready(function(){
		$('.data').mask("00/00/0000", {placeholder: "__/__/____"});
	});
    
    $(document).ready(function(){
		$('.money').mask('000.000,00', {reverse: true});
	});
	
</script>

<%
	Caixa caixa = (Caixa) request.getAttribute("object");
	if (caixa == null) {
		caixa = new Caixa();
	}
%>

</head>
<body>
<div class="container">
<div class="well">
<fieldset>

	<form name="frm" id="frm" method="post" action="./dispatcher">
	<input type="hidden" name="newAction" id="newAction"/>
	<input type="hidden" name="entityName" id="entityName" value="Caixa"/>
	<input type="hidden" name="id" id="id"/>
	
	<div id="legend">
			<legend><h2>Cadastrar<small> Caixa</small></h2></legend>
	</div>	
	 
	<br>
	<div class="col-lg-2">
		<label>Código</label>
			<div class="input-group">
  				<span class="input-group-addon"><b>ID</b></span>
  				<input class="form-control" readonly type="text" name="idcaixa" id="idcaixa" value="<%=(caixa.getIdCaixa() == null) ? "" : caixa.getIdCaixa()%>"/>
			</div>
	</div>
		
	<div class="col-lg-3">
			<label>Situação *</label>
			<select class="form-control" name="situacao" id="situacao">
<%
	if (caixa.getSituacao() != null) {			
		if (caixa.getSituacao().equals("A")) {		
%>		
		<option value="A" selected >Aberto</option>
		<option value="F" >Fechado</option>
<%
		} else {
%>
			<option value="F" selected >Fechado</option>
			<option value="A" >Aberto</option>
<%
		}		
	} else {
		%>
			<option value="">Selecione</option>
			<option value="A">Aberto</option>
			<option value="F">Fechado</option>
		<%
		
	}
%>
			</select>
	</div>
	
	<div class="col-lg-7">
		<label>Descrição *</label>
		<input class="form-control" type="text" placeholder="Insira o Nome do Caixa" name="descricao" id="descricao" value="<%=(caixa.getDescricao() == null) ? "" : caixa.getDescricao()%>"/>
	</div>
	
	<div class="col-lg-3">
	<br>
		<label>Data de Abertura *</label>
			<div class="input-group date">
  				<span class="input-group-addon"><b><i class="glyphicon glyphicon-calendar"></i></b></span>
  				<input class="form-control" type="date" name="dataabertura" id="dataabertura" value="<%=(caixa.getDataAbertura() == null) ? "" : caixa.getDataAbertura()%>"/>
			</div>
	</div>

	<div class="col-lg-3">
	<br>
		<label>Valor da Abertura $ *</label>
			<div class="input-group">
  				<span class="input-group-addon"><b>R$</b></span>
  				<input class="form-control money" type="text" placeholder="0,00" name="valorabertura" id="valorabertura" maxlength="10" value="<%=(caixa.getValorAbertura() == null) ? "" : caixa.getValorAbertura()%>"/>
			</div>
	</div>
	
	<div class="col-lg-3">
	<br>
		<label>Data de Fechamento *</label>
			<div class="input-group date">
  				<span class="input-group-addon"><b><i class="glyphicon glyphicon-calendar"></i></b></span>
  				<input class="form-control" type="date" name="datafechamento" id="datafechamento" value="<%=(caixa.getDataFechamento() == null) ? "" : caixa.getDataFechamento()%>"/>
			</div>
	</div>

	<div class="col-lg-3">
	<br>
		<label>Valor do Fechamento $ *</label>
			<div class="input-group">
  				<span class="input-group-addon"><b>R$</b></span>
  				<input class="form-control money" type="text" placeholder="0,00" name="valorfechamento" id="valorfechamento" maxlength="10" value="<%=(caixa.getValorFechamento() == null) ? "" : caixa.getValorFechamento()%>"/>
  				
			</div>
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