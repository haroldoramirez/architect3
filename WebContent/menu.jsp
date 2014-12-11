<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">    
<meta charset="UTF-8">
  <link href="./bootstrap/css/menu.css" rel="stylesheet"/>
  
<script type='text/javascript'>
	function execute(entityName, newAction) {
		document.getElementById('newAction').value = newAction;
		document.getElementById('entityName').value = entityName;
		document.getElementById('form').submit();
	}		
</script>

<form name="form" id="form" action="./dispatcher" method="post" target="main">
	<input type="hidden" name="newAction" id="newAction">
	<input type="hidden" name="entityName" id="entityName">

<nav class="navbar navbar-default navbar-fixed-top navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">
      	<span class="glyphicon glyphicon-shopping-cart"></span> Mercado Luana
      </a>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="" class="dropdown-toggle" data-toggle="dropdown">
          		<span class="glyphicon glyphicon-user"></span> Cadastro <b class="caret"></b>
          </a>
          <ul class="dropdown-menu">
          	<li><a href="javascript:execute('Cliente','find');">1 - Cliente</a></li>
          	<li><a href="javascript:execute('Fornecedor','find');">2 - Fornecedor</a></li>
          	<li><a href="javascript:execute('Usuario','find');">3 - Usuário</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav">
      		<li class="dropdown">
      			 <a href="" class="dropdown-toggle" data-toggle="dropdown">
          			<span class="glyphicon glyphicon-usd"></span> Financeiro <b class="caret"></b>
          		</a>
          		<ul class="dropdown-menu">
          			<li><a href="javascript:execute('Caixa','find');">1 - Caixa</a></li>
		            <li><a href="javascript:execute('Contas','find');">2 - Contas</a></li>
		            <li class="divider"></li>
		            <li><a href="javascript:execute('Compra','find');">3 - Compra</a></li>
		            <li><a href="javascript:execute('Venda','find');">4 - Venda</a></li>
		            <li class="divider"></li>
		            <li><a href="javascript:execute('CondicaoDePagamento','find');">5 - Condição de Pagamento</a></li>
           			<li><a href="javascript:execute('FormaDePagamento','find');">6 - Forma de Pagamento</a></li>
          		</ul>
      		</li>
      </ul>
       <ul class="nav navbar-nav">
      		<li class="dropdown">
      			 <a href="" class="dropdown-toggle" data-toggle="dropdown">
          			<span class="glyphicon glyphicon-map-marker"></span> Endereços <b class="caret"></b>
          		</a>
          		<ul class="dropdown-menu">
          			<li><a href="javascript:execute('Pais','find');">1 - País</a></li>
            		<li><a href="javascript:execute('Estado','find');">2 - Estado</a></li>
            		<li><a href="javascript:execute('Cidade','find');">3 - Cidade</a></li>
          		</ul>
      		</li>
      </ul>
        <ul class="nav navbar-nav">
      		<li class="dropdown">
      			 <a href="" class="dropdown-toggle" data-toggle="dropdown">
          			<span class="glyphicon glyphicon-barcode"></span> Estoque <b class="caret"></b>
          		</a>
          		<ul class="dropdown-menu">
          			 <li><a href="javascript:execute('Categoria','find');">1 - Categoria</a></li>
           			 <li><a href="javascript:execute('Fabricante','find');">2 - Fabricante</a></li>
            		 <li><a href="javascript:execute('UnidadeDeMedida','find');">3 - Unidade de Medida</a></li>
            		 <li><a href="javascript:execute('Produto','find');">4 - Produto</a></li>
          		</ul>
      		</li>
      </ul>
	  <ul class="nav navbar-nav navbar-right">
		  <li>
			 <a href=""></a>
		  </li>
		  <li class="dropdown">
				<a href="" class="dropdown-toggle" data-toggle="dropdown">
					<span class="glyphicon glyphicon-cog"></span> Opções <strong class="caret"></strong>
				</a>
				  <ul class="dropdown-menu">
				      <li>
					     <a href="javascript:execute('Usuario','goLogin');"><span class="glyphicon glyphicon-user"></span> Entrar</a>
					  </li>
				
					  <li>
						 <a href="javascript:execute('Usuario','goLogoff');"><span class="glyphicon glyphicon-off"></span> Sair</a>
					  </li>
				</ul>
			</li>
	      </ul>
	  </div>					
  </nav>
</form>
</html>