<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="uiCommon.SortingValuesUsingjsp" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<title>SOILS</title>
<head>
<script type="text/javascript" src="jquery.js">
	// Wait for the page and all the DOM to be fully loaded
	$('body').ready(function() {

		// Add the 'hover' event listener to our drop down class
		$('.dropdown').hover(function() {
			// When the event is triggered, grab the current element 'this' and
			// find it's children '.sub_navigation' and display/hide them
			$(this).find('.sub_navigation').slideToggle();
		});
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
textarea {
	width: 1000 px;
	left: 200 px;
	top: 200 px;
	border-color: yellow;
}

select {
	margin: 0;
	padding: 0;
	color: red;
	list-style-type: none;
	min-width: 200px;
	min-height: 30px;
	background: #D6E7FF;
}

ul {
	margin: 0;
	padding: 0;
	color: yellow;
	list-style-type: none;
	min-width: 250px;
}

ul#navigation {
	float: left;
}

ul#navigation li {
	float: left;
	background-color: #B8DC70;
	border: 3px blue thick;
	min-width: 200px;
}

ul.sub_navigation {
	color: black; position : absolute;
	display: none;
	min-width: 198px;
	position: absolute;
}

#text2 {
	min-width: 200px;
	min-height: 28px;
}

input {
	position: relative;
	min-width: 198px;
	min-height: 300 px;
}

ul.sub_navigation li {
	clear: both;
}

a,a:active,a:visited {
	display: block;
	padding: 10px;
}
</style>
<script type="text/javascript">
	// Wait for the page and all the DOM to be fully loaded
	$('body').ready(function() {

		// Add the 'hover' event listener to our drop down class
		$('.dropdown').hover(function() {
			// When the event is triggered, grab the current element 'this' and
			// find it's children '.sub_navigation' and display/hide them
			$(this).find('.sub_navigation').slideToggle();
		});
	});
	
	
</script>

<title>Main Page</title>
</head>
<body bgcolor="#FCFAE8">
	<form  name="Mainpage" id="Mainpage" method="post" action="">
		<table cellpadding="10">
		<tr>
		  		<th>
		  		    MAIN PAGE
		  		</th>
		  </tr>
			<tr>
				<td>
				
				 <%          if(session.getAttribute("visited") != null) {
					out.print("in the main visit check" + session.getAttribute("visited")); 
				 }
				 else
					 {      SortingValuesUsingjsp svuj = new SortingValuesUsingjsp();
						     svuj.mainMethod();
						     session.setAttribute("objectMain", svuj);
					 }
					     %>
					<ul id="navigation">
						<li class="dropdown"><a href="Metadata.jsp">Metadata</a>
							<!-- <ul class="sub_navigation">
								<li><a href="#">Sub Navigation 1</a></li>
								<li><a href="#">Sub Navigation 2</a></li>
								<li><a href="#">Sub Navigation 3</a></li>
							</ul> --></li>
							<li class="dropdown"><a href="Soils.jsp">Soils</a>
							<!-- <ul class="sub_navigation">
								<li><a href="#">Sub Navigation 1</a></li>
								<li><a href="#">Sub Navigation 2</a></li>
								<li><a href="#">Sub Navigation 3</a></li>
							</ul> --></li>
						<li class="dropdown"><a href="Weather.jsp">Weather</a>
							<!--<ul class="sub_navigation">
								 <li><a href="#">Sub Navigation 1</a></li>
								<li><a href="#">Sub Navigation 2</a></li>
								<li><a href="#">Sub Navigation 3</a></li>
							</ul> --></li>
						<li class="dropdown"><a href="InitialConditions.jsp">Initial Conditions</a>
							<!-- <ul class="sub_navigation">
								<li><a href="#">Sub Navigation 1</a></li>
								<li><a href="#">Sub Navigation 2</a></li>
								<li><a href="#">Sub Navigation 3</a></li>
							</ul> --></li>
						<li class="dropdown"><a href="ManagementEvents.jsp">Management Events</a>
							<!-- <ul class="sub_navigation">
								<li><a href="#">Sub Navigation 1</a></li>
								<li><a href="#">Sub Navigation 2</a></li>
								<li><a href="#">Sub Navigation 3</a></li>
							</ul> --></li>
					</ul>
				</td>
			</tr>
			<tr>
				<td ><textarea name="textarea1" id="textarea1"
						rows="12" cols="60"> Enter some related text here</textarea></td>
						<td><p>Display some information</p>
<div class="scroll"></div></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="20">
						<tr>
							<td>
						   						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
