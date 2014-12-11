<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">

<title>Error</title>
</head>
<body>
  <div class="container-fluid">
  	  <div class="well">
  	  <fieldset>
	    <div id="legend">
			<legend><h2>Ocorreu um Erro! <small></small></h2></legend>
		</div>
<%
	Exception e =  (Exception) request.getAttribute("exception");
	e.printStackTrace();
%>
	<div>
		<h4>
				Message: <span style="color:red"><%=e.getMessage()%></span>
		  		<br>
		  		Localized Message: <span style="color:red"><%=e.getLocalizedMessage()%></span>
		  		<br>
		  		Stack Trace: <span style="color:red"><%=e.getStackTrace()%></span>
		  		<br>
		  		Cause: <span style="color:red"><%=e.getCause()%></span>
		  		<br>
		  		Supressed: <span style="color:red"><%=e.getSuppressed()%></span>
		  		<br>
		  		Class: <span style="color:red"><%=e.getClass()%></span>
		</h4>
	</div>
  
  	   <div>
			<legend></legend>
		</div>
		
	    <div>
		  <br>
		  <button type="button" class="btn btn-primary" value="Voltar" onclick="history.back();">Voltar</button>
	   </div>
	   </fieldset>
     </div>
 </div>
</body>
</html>