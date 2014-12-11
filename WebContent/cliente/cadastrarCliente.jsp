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
<link href="./bootstrap/datepicker/css/datepicker3.css" rel="stylesheet">

<script type="text/javascript" src="./bootstrap/jquery/jquery-2.1.1.js"></script>
<script type="text/javascript" src="./bootstrap/jquery/jquery.mask.js"></script>
<script type="text/javascript" src="./bootstrap/datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="./bootstrap/datepicker/js/locales/bootstrap-datepicker.pt-BR.js"></script>

<title>Cadastrar Cliente</title>

<script type="text/javascript">

	function save() {
		if ((document.getElementById("nome").value != "") && (document.getElementById("sexo").value != "") 
			&& (document.getElementById("rg").value != "") && (document.getElementById("cpf").value != "") && (document.getElementById("datanascimento").value != "")
			  && (document.getElementById("telefone").value != "") && (document.getElementById("celular").value != "") && (document.getElementById("email").value != "")
				&& (document.getElementById("endereco").value != "") && (document.getElementById("bairro").value != "") && (document.getElementById("numero").value != "")
				  && (document.getElementById("cep").valueOf() != "") && (document.getElementById("pais").value != "") && (document.getElementById("estado").value != "")
				    && (document.getElementById("cidade").value != "")) {
			document.getElementById("newAction").value = "save";
			document.getElementById("frm").submit();
		}else {
			if (document.getElementById("nome").value == "") {
				alert("Insira o Nome");
				frm.nome.focus();
			}else
				if (document.getElementById("sexo").value == "") {
					alert("Selecione o Sexo");
					frm.sexo.focus();
				}else
					if (document.getElementById("rg").value == "") {
						alert("Insira o RG");
						frm.rg.focus();
					}else
						if (document.getElementById("cpf").value == "") {
							alert("Insira o CPF");
							frm.cpf.focus();
						}else
							if (document.getElementById("datanascimento").value == "") {
								alert("Insira a Data de Nascimento");
								frm.datanascimento.focus();
							}else
								if (document.getElementById("telefone").value == "") {
									alert("Insira o Telefone");
									frm.telefone.focus();
								}else
									if (document.getElementById("celular").value == "") {
										alert("Insira o Celular");
										frm.celular.focus();
									}else
										if (document.getElementById("email").value == "") {
											alert("Insira o Email");
											frm.email.focus();
										}else
											if (document.getElementById("endereco").value == "") {
												alert("Insira o Endereço");
												frm.endereco.focus();
											}else
												if (document.getElementById("bairro").value == "") {
													alert("Insira o Bairro");
													frm.bairro.focus();
												}else
													if (document.getElementById("numero").value == "") {
														alert("Insira o Número");
														frm.numero.focus();
													}else
														if (document.getElementById("cep").value == "") {
															alert("Insira o CEP");
															frm.cep.focus();
														}else
															if (document.getElementById("pais").value == "") {
																alert("Selecione o País");
																frm.pais.focus();
															}else
																if (document.getElementById("estado").value == "") {
																	alert("Selecione o Estado");
																	frm.estado.focus();
																}else
																	if (document.getElementById("cidade").value == "") {
																		alert("Selecione o Cidade");
																		frm.cidade.focus();
																	}
		}
	}
		
	function goFind() {
		document.getElementById("newAction").value = "goFind";
		document.getElementById("frm").submit();
	}
	
	$(document).ready(function(){
  		$('.cpf').mask("000.000.000-00");
	});
	
	$(document).ready(function(){
  		$('.telefone').mask("(00) 0000-0000");
	});
	
	$(document).ready(function(){
  		$('.numero').mask("0000");
	});
	
	$(document).ready(function(){
  		$('.cep').mask("00000-000");
	});
	
    $(document).ready(function () {
        
        $('#datanascimento').datepicker({
        	  format: "dd/mm/yyyy",
        	  todayBtn: "linked",
        	  language: "pt-BR",
        	  autoclose: true,
        	  todayHighlight: true
        });  
    
    });
	
</script>

<%
	Cliente cliente = (Cliente) request.getAttribute("object");
	if (cliente == null) {
		cliente = new Cliente();
		cliente.setPais(new Pais());
		cliente.setEstado(new Estado());
		cliente.setCidade(new Cidade());
	}
	Object listPais[] = (Object[]) request.getAttribute("listPais");
	Object listEstado[] = (Object[]) request.getAttribute("listEstado");
	Object listCidade[] = (Object[]) request.getAttribute("listCidade");
%>

</head>
<body>
<div class="container">
<div class="well">
<fieldset>

	<form name="frm" id="frm" method="post" action="./dispatcher">
		<input type="hidden" name="newAction" id="newAction"/>
		<input type="hidden" name="entityName" id="entityName" value="Cliente"/>
		<input type="hidden" name="id" id="id"/>
		
		<div id="legend">
			<legend><h2>Cadastrar <small>Cliente</small></h2></legend>
		</div>	
		
		<br>
		<div class="col-lg-2">
		    <label>Código</label> 
		    <div class="input-group">
  				<span class="input-group-addon"><b>ID</b></span>
  				<input class="form-control" readonly type="text" name="idcliente" id="idcliente" value="<%=(cliente.getIdCliente() == null) ? "" : cliente.getIdCliente()%>"/>
			</div>
		</div>
		
		<div class="col-lg-8"> 
		    <label>Nome *</label>
		    <div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<input class="form-control" type="text" name="nome" placeholder="Insira o nome completo" id="nome" maxlength="99" value="<%=(cliente.getNome() == null) ? "" : cliente.getNome()%>"/>
			</div>
		</div>
		
		<div class="col-lg-2">
			<label>Sexo *</label>
			<select class="form-control" name="sexo" id="sexo">
<%
	if (cliente.getSexo() != null) {			
		if (cliente.getSexo().equals("M")) {		
%>		
		<option value="M" selected >Masculino</option>
		<option value="F" >Feminino</option>
<%
		} else {
%>
			<option value="F" selected >Feminino</option>
			<option value="M" >Masculino</option>
<%
		}		
	} else {
		%>
			<option value="">Selecione</option>
			<option value="F">Feminino</option>
			<option value="M">Masculino</option>
		<%
		
	}
%>
			</select>
		</div>
		
		<div class="col-lg-2">
		<br>
			<label>Registro Geral *</label>
			<div class="input-group">
  				<span class="input-group-addon"><b>RG</b></span>
  				<input class="form-control" type="text" placeholder="Insira o RG" name="rg" id="rg" maxlength="12" value="<%=(cliente.getRg() == null) ? "" : cliente.getRg()%>"/>
			</div>
		</div>
		
		<div class="col-lg-3">
		<br>
			<label>Pessoa Física *</label>
			<div class="input-group">
  				<span class="input-group-addon"><b>CPF</b></span>
  				<input class="form-control cpf" type="text" placeholder="___.___.___-__" name="cpf" id="cpf" maxlength="16" value="<%=(cliente.getCpf() == null) ? "" : cliente.getCpf()%>"/>
			</div>
		</div>
						
		<div class="col-lg-3">
		<br>
			<label>Data de Nascimento *</label>
			<div class="input-group date">
  				<span class="input-group-addon"><b><i class="glyphicon glyphicon-calendar"></i></b></span>
  				<input class="form-control" type="text" type="text" name="datanascimento" id="datanascimento" value="<%=(cliente.getDataNascimento() == null) ? "" : cliente.getDataNascimento()%>"/>
			</div>
		</div>

		<div class="col-lg-2">
		<br>
			<label>Telefone Residencial *</label>
			<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
  				<input class="form-control telefone" type="text" placeholder="(__) ____-____" name="telefone" id="telefone" maxlength="15" value="<%=(cliente.getTelefone() == null) ? "" : cliente.getTelefone()%>"/>
			</div>
		</div>
		
			
		<div class="col-lg-2">
		<br>
			<label>Telefone Celular *</label>
			<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
  				<input class="form-control telefone" type="text" placeholder="(__) ____-____" name="celular" id="celular" maxlength="15" value="<%=(cliente.getCelular() == null) ? "" : cliente.getCelular()%>"/>
			</div>
		</div>

		
		<div class="col-lg-5">
		<br>
			<label>Email *</label>
				<div class="input-group">
  					<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  					<input class="form-control" type="email" placeholder="Insira o Email" name="email" id="email" maxlength="60" value="<%=(cliente.getEmail() == null) ? "" : cliente.getEmail()%>"/>
				</div>
		</div>
		
			
		<div class="col-lg-4">
		<br>
			<label>Endereço *</label>
				<div class="input-group">
  					<span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
  					<input class="form-control" type="text" placeholder="Rua, Avenida, Alameda" name="endereco" id="endereco" maxlength="45" value="<%=(cliente.getEndereco() == null) ? "" : cliente.getEndereco()%>"/>
				</div>
		</div>
		
		<div class="col-lg-3">
		<br>
			<label>Bairro *</label>
			<input class="form-control" type="text" placeholder="Insira o Bairro" name="bairro" id="bairro" maxlength="40" value="<%=(cliente.getBairro() == null) ? "" : cliente.getBairro()%>"/>
		</div>
		
		<div class="col-lg-2">
		<br>
			<label>Número *</label>
			<div class="input-group">
  				<span class="input-group-addon"><b>N°</b></span>
  				<input class="form-control numero" type="text" placeholder="Insira o Número" name="numero" id="numero" maxlength="10" value="<%=(cliente.getNumero() == null) ? "" : cliente.getNumero()%>"/>
			</div>
		</div>
		
			
		<div class="col-lg-3">
		<br>
			<label>Código de Endereçamento Postal *</label>
			<div class="input-group">
  				<span class="input-group-addon"><b>CEP</b></span>
  				<input class="form-control cep" type="text" placeholder="_____-___" name="cep" id="cep" maxlength="45" value="<%=(cliente.getCep() == null) ? "" : cliente.getCep()%>"/>
			</div>
		</div>
	
								
		<div class="col-lg-2">
		<br>
			<label>Pais *</label>
			<select class="form-control" name="pais" id="pais">
				<option value="">Selecione</option>
<%
	if (listPais != null) {			
		for(int i=0; i<listPais.length; i++) {
			Pais pais = (Pais) listPais[i];
			boolean bSelected = cliente.getPais().getIdPais() == pais.getIdPais(); 
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=pais.getIdPais()%>"><%=pais.getPais()%></option>
<%
		}
	}
%>
			</select>
		</div>
					
		<div class="col-lg-2">
		<br>
			<label>Estado *</label>
			<select class="form-control" name="estado" id="estado">
				<option value="">Selecione</option>
<%
	if (listEstado != null) {			
		for(int i=0; i<listEstado.length; i++) {
			Estado estado = (Estado) listEstado[i];
			boolean bSelected = cliente.getEstado().getIdEstado() == estado.getIdEstado(); 
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=estado.getIdEstado()%>"><%=estado.getEstado()%></option>
<%
		}
	}
%>
			</select>
		</div>	
		
					
		<div class="col-lg-3">
		<br>
			<label>Cidade *</label>
			<select class="form-control" name="cidade" id="cidade">
				<option value="">Selecione</option>
<%
	if (listCidade != null) {			
		for(int i=0; i<listCidade.length; i++) {
			Cidade cidade = (Cidade) listCidade[i];
			boolean bSelected = cliente.getCidade().getIdCidade() == cidade.getIdCidade(); 
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=cidade.getIdCidade()%>"><%=cidade.getCidade()%></option>
<%
		}
	}
%>
			</select>
		</div>		
			
		<div class="col-lg-12">
			<br>
			<label>Observações</label>							
			<textarea rows="3" cols="3" class="form-control" placeholder="Informações Adicionais" name="observacoes" id="observacoes" maxlength="400"><%=(cliente.getObservacoes() == null) ? "" : cliente.getObservacoes()%></textarea>
			<br>
		</div>
			
		<div>	
			<legend></legend>
		</div>
		
		<div class="col-lg-9">
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