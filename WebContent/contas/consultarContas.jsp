<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.architect3.entity.FormaDePagamento,
                 br.edu.udc.sistemas.architect3.entity.CondicaoDePagamento,
                 br.edu.udc.sistemas.architect3.entity.Contas"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">

<title>Consultar Contas</title>

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
	Contas contasFilter = (Contas) request.getSession().getAttribute("filterContas");
	if (contasFilter == null) {
		contasFilter = new Contas();
		contasFilter.setCondicaoDePagamento(new CondicaoDePagamento());
		contasFilter.setFormaDePagamento(new FormaDePagamento());

	} else if (contasFilter.getCondicaoDePagamento() == null && contasFilter.getFormaDePagamento() == null) {
		contasFilter.setCondicaoDePagamento(new CondicaoDePagamento());
		contasFilter.setFormaDePagamento(new FormaDePagamento());
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
		<input type="hidden" name="entityName" id="entityName" value="Contas"/>
		<input type="hidden" name="id" id="id"/>
		
		<div id="legend">
			<legend><h1>Consultar <small>Contas</small></h1></legend>
		</div>	
		
		<div class="col-6 col-sm-4 col-lg-3">
			<input autofocus="autofocus" class="form-control" type="text" placeholder="Digite a conta" name="descricao" id="contas" maxlength="30" value="<%=(contasFilter.getDescricao() != null) ? contasFilter.getDescricao() : ""%>"/>
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
					<th>Tipo da Conta</th>
					<th>Número da Fatura</th>
					<th>Descrição</th>
					<th>Data de Vencimento</th>
					<th>Forma de Pagamento</th>
					<th>Condição de Pagamento</th>
					<th>Valor de Fatura $</th>
					<th>Opções</th>
				</tr>			
<%
	if (list != null) {			
		for(int i=0; i<list.length; i++) {
			Contas contasAux = (Contas) list[i];
%>	
				<tr>
					<td><%=contasAux.getIdConta()%></td>
					<td><%=contasAux.getTipoDeConta()%></td>
					<td><a href="javascript:detail(<%=contasAux.getIdConta()%>);"><%=contasAux.getNumeroFatura()%></a></td>
					<td><%=contasAux.getDescricao()%></td>
					<td><%=contasAux.getDataVencimento()%></td>
					<td><%=contasAux.getFormaDePagamento().getDescricao()%></td>
					<td><%=contasAux.getCondicaoDePagamento().getDescricao()%></td>
					<td><%=contasAux.getValorFatura()%></td>
					<td>
						<a class="glyphicon glyphicon-pencil" href="javascript:detail(<%=contasAux.getIdConta()%>);"></a>&nbsp;
						<a class="glyphicon glyphicon-trash" href="javascript:remove(<%=contasAux.getIdConta()%>);"></a>
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