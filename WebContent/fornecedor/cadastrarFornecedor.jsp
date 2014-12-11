<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.Fornecedor,
                 br.edu.udc.sistemas.architect3.entity.Pais,
                 br.edu.udc.sistemas.architect3.entity.Estado,
                 br.edu.udc.sistemas.architect3.entity.Cidade"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
<script type="text/javascript" src="./bootstrap/jquery/jquery-2.1.1.js"></script>
<script type="text/javascript" src="./bootstrap/jquery/jquery.mask.js"></script>

<title>Cadastrar Fornecedor</title>

<script type="text/javascript">

	function save() {
		if ((document.getElementById("cnpj").value != "") && (document.getElementById("inscricaoestadual").value != "") 
				&& (document.getElementById("razaosocial").value != "") && (document.getElementById("nomefantasia").value != "")
				 && (document.getElementById("celular").value != "") && (document.getElementById("telefone").value != "")
				  && (document.getElementById("fax").value != "") && (document.getElementById("email").value != "")
				   && (document.getElementById("site").value != "") && (document.getElementById("endereco").value != "")
				    && (document.getElementById("numero").value != "") && (document.getElementById("bairro").value != "")
				     && (document.getElementById("cep").value != "") && (document.getElementById("pais").value != "")
				      && (document.getElementById("estado").value != "") && (document.getElementById("cidade").value != "")) {
			document.getElementById("newAction").value = "save";
			document.getElementById("frm").submit();
		}else {
			if (document.getElementById("cnpj").value == "") {
				alert("Insira o CNPJ");
				frm.cnpj.focus();
			}else 
				if (document.getElementById("inscricaoestadual").value == "") {
					alert("Insira a Inscrição Estadual");
					frm.inscricaoestadual.focus();
				}else 
					if (document.getElementById("razaosocial").value == "") {
						alert("Insira a Razão Social");
						frm.razaosocial.focus();
					}else 
						if (document.getElementById("nomefantasia").value == "") {
							alert("Insira o Nome Fantasia");
							frm.nomefantasia.focus();
						}else 
							if (document.getElementById("celular").value == "") {
								alert("Insira o Celular");
								frm.celular.focus();
							}else 
								if (document.getElementById("telefone").value == "") {
									alert("Insira o Telefone");
									frm.telefone.focus();
								}else 
									if (document.getElementById("fax").value == "") {
										alert("Insira o Fax");
										frm.fax.focus();
									}else 
										if (document.getElementById("email").value == "") {
											alert("Insira o Email");
											frm.email.focus();
										}else 
											if (document.getElementById("site").value == "") {
												alert("Insira o Site");
												frm.site.focus();
											}else 
												if (document.getElementById("endereco").value == "") {
													alert("Insira o Endereço");
													frm.endereco.focus();
												}else 
													if (document.getElementById("numero").value == "") {
														alert("Insira o Número");
														frm.numero.focus();
													}else 
														if (document.getElementById("bairro").value == "") {
															alert("Insira o Bairro");
															frm.bairro.focus();
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
																			alert("Selecione a Cidade");
																			frm.cidade.focus();
																		}
			}
	}
	
	function goFind() {
		document.getElementById("newAction").value = "goFind";
		document.getElementById("frm").submit();
	}
		
	$(document).ready(function(){
  		$('.cnpj').mask("00.000.000/0000-00");
	});
	
	$(document).ready(function(){
  		$('.inscri').mask("000.00000-00");
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
	
</script>

<%
	Fornecedor fornecedor = (Fornecedor) request.getAttribute("object");
	if (fornecedor == null) {
		fornecedor = new Fornecedor();
		fornecedor.setPais(new Pais());
		fornecedor.setEstado(new Estado());
		fornecedor.setCidade(new Cidade());
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
		<input type="hidden" name="entityName" id="entityName" value="Fornecedor"/>
		<input type="hidden" name="id" id="id"/>
		
		<div id="legend">
			<legend><h2>Cadastrar <small>Fornecedor</small></h2></legend>
		</div>	
			
		<br>	
		<div class="col-lg-2">
			<label>Código</label>
			<div class="input-group">
  				<span class="input-group-addon"><b>ID</b></span>
  				<input class="form-control" readonly type="text" name="idfornecedor" id="idfornecedor" value="<%=(fornecedor.getIdFornecedor() == null) ? "" : fornecedor.getIdFornecedor()%>"/>
			</div>
		</div>
		
		
		<div class="col-lg-2">
			<label>CNPJ *</label>
			<input class="form-control cnpj" type="text" placeholder="Insira o CNPJ" name="cnpj" id="cnpj" maxlength="22" value="<%=(fornecedor.getCnpj() == null) ? "" : fornecedor.getCnpj()%>"/>
		</div>

			
		<div class="col-lg-3">
			<label>Inscrição Estadual *</label>
				<div class="input-group">
  					<span class="input-group-addon"><b>IE</b></span>
  					<input class="form-control inscri" type="text" placeholder="Insira a Inscrição Estadual" name="inscricaoestadual" id="inscricaoestadual" maxlength="18" value="<%=(fornecedor.getInscricaoEstadual() == null) ? "" : fornecedor.getInscricaoEstadual()%>"/>
				</div>
		</div>

			
		<div class="col-lg-5">
			<label>Razão Social *</label>
			<input class="form-control" type="text" placeholder="Insira a Razão Social" name="razaosocial" id="razaosocial" maxlength="55" value="<%=(fornecedor.getRazaoSocial() == null) ? "" : fornecedor.getRazaoSocial()%>"/>
		</div>
		
			
		<div class="col-lg-3">
			<br>
			<label>Nome Fantasia *</label>
			<input class="form-control" type="text" placeholder="Insira o Nome Fantasia" name="nomefantasia" id="nomefantasia" maxlength="64" value="<%=(fornecedor.getNomeFantasia() == null) ? "" : fornecedor.getNomeFantasia()%>"/>
		</div>
		
					
		<div class="col-lg-3">
		<br>
			<label>Celular *</label>
				<div class="input-group">
  					<span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
  					<input class="form-control telefone" placeholder="(__) ____-____" type="text" name="celular" id="celular" maxlength="15" value="<%=(fornecedor.getCelular() == null) ? "" : fornecedor.getCelular()%>"/>
				</div>
		</div>
		
		<div class="col-lg-3">
			<br>
			<label>Telefone *</label>
			<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
  				<input class="form-control telefone" placeholder="(__) ____-____" type="text" name="telefone" id="telefone" maxlength="15" value="<%=(fornecedor.getTelefone() == null) ? "" : fornecedor.getTelefone()%>"/>
			</div>
		</div>
		
		<div class="col-lg-3">
			<br>
			<label>FAX *</label>
			<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
  				<input class="form-control telefone" placeholder="(__) ____-____" type="text" name="fax" id="fax" maxlength="15" value="<%=(fornecedor.getFax() == null) ? "" : fornecedor.getFax()%>"/>
			</div>
		</div>

			
		<div class="col-lg-3">
			<br>
			<label>Email *</label>
				<div class="input-group">
  					<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  					<input class="form-control" type="email" placeholder="Insira o Email" name="email" id="email" maxlength="50" value="<%=(fornecedor.getEmail() == null) ? "" : fornecedor.getEmail()%>"/>
				</div>
		</div>
		
			
		<div class="col-lg-3">
			<br>
			<label>Site *</label>
				<div class="input-group">
  					<span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span>
  					<input class="form-control" type="text" placeholder="www" name="site" id="site" maxlength="50" value="<%=(fornecedor.getSite() == null) ? "" : fornecedor.getSite()%>"/>
				</div>
		</div>
		
			
		<div class="col-lg-4">
			<br>
			<label>Endereço *</label>
				<div class="input-group">
  					<span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
  					<input class="form-control" type="text" placeholder="Rua, Avenida, Alameda" name="endereco" id="endereco" maxlength="60" value="<%=(fornecedor.getEndereco() == null) ? "" : fornecedor.getEndereco()%>"/>
				</div>
		</div>
		
			
		<div class="col-lg-2">
			<br>
			<label>Número *</label>
			<div class="input-group">
  				<span class="input-group-addon"><b>N°</b></span>
  				<input class="form-control numero" type="text" placeholder="Insira a Número" name="numero" id="numero" maxlength="10" value="<%=(fornecedor.getNumero() == null) ? "" : fornecedor.getNumero()%>"/>
			</div>
		</div>

	
		<div class="col-lg-3">
			<br>
			<label>Bairro *</label>
			<input class="form-control" type="text" placeholder="Insira o Bairro" name="bairro" id="bairro" maxlength="45" value="<%=(fornecedor.getBairro() == null) ? "" : fornecedor.getBairro()%>"/>
		</div>
		
			
		<div class="col-lg-3">
			<br>
			<label>Código de Endereçamento Postal *</label>
			<div class="input-group">
  				<span class="input-group-addon"><b>CEP</b></span>
  				<input class="form-control cep" type="text" placeholder="_____-___" name="cep" id="cep" maxlength="45" value="<%=(fornecedor.getCep() == null) ? "" : fornecedor.getCep()%>"/>
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
			boolean bSelected = fornecedor.getPais().getIdPais() == pais.getIdPais(); 
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
			boolean bSelected = fornecedor.getEstado().getIdEstado() == estado.getIdEstado(); 
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=estado.getIdEstado()%>"><%=estado.getEstado()%></option>
<%
		}
	}
%>
			</select>
		</div>	
		
					
		<div class="col-lg-2">
			<br>
			<label>Cidade *</label>
			<select class="form-control" name="cidade" id="cidade">
				<option value="">Selecione</option>
<%
	if (listCidade != null) {			
		for(int i=0; i<listCidade.length; i++) {
			Cidade cidade = (Cidade) listCidade[i];
			boolean bSelected = fornecedor.getCidade().getIdCidade() == cidade.getIdCidade(); 
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
			<textarea rows="3" cols="3" class="form-control" placeholder="Informações Adicionais" name="observacoes" id="observacoes" maxlength="400"><%=(fornecedor.getObservacoes() == null) ? "" : fornecedor.getObservacoes()%></textarea>
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