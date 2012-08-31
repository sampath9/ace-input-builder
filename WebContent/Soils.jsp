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
<script type="text/javascript">
function fnCheckSelected(){
	alert('hello');
	alert(document.getElementById('codeDisplay').options[document.getElementById('codeDisplay').selectedIndex].value);
}
function fnGetValues() {
	alert('final submit');
	alert(document.getElementById('codeDisplay').options[document.getElementById('codeDisplay').selectedIndex].value);
	alert(document.getElementById('Description').options[document.getElementById('Description').selectedIndex].value);
	alert(document.getElementById('unit_or_type').options[document.getElementById('unit_or_type').selectedIndex].value);
	alert(document.getElementById('userInput').value);
	
}
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

<title>SOILS</title>
</head>
<body bgcolor="#FCFAE8">
	<form  name="SoilsPage" id="SoilsPage" method="post" onsubmit="fnGetValues();">
		<table cellpadding="10">
		<tr>
		  		<th>
		  		    Soils
		  		</th>
		  </tr>
			
			<tr>
				<td><textarea name="textarea1" id="textarea1" rows="12"
						cols="60"> Enter some related text here</textarea></td>
				<td><p>Display some information</p>
					<div class="scroll"></div></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="20">
						<tr>
							<td>
						    Code Display
						    <% //SortingValuesUsingjsp svuj = new SortingValuesUsingjsp();
						     SortingValuesUsingjsp svuj = (SortingValuesUsingjsp)session.getAttribute("objectMain");
						    // svuj.mainMethod();
						    session.setAttribute("visited", "soils");
						     int Count = svuj.getSoilValuesCounter();
						     //out.println(Count);
						     //out.println(svuj.getMetadataValues());
						     String SoilValues[][] = new String[Count-1][2];
						     SoilValues = svuj.getSoilValues();%>
						     <select name="Code Display" id="codeDisplay" style="border-color: #FFD175;">
						     <%for (int i=0; i<=Count-1; i++){%>
									<option value="<%= SoilValues[i][0] %>"><%= SoilValues[i][0] %></option>
						     	<%}%>
						     </select></td>
							<td>
							Description
							<select name="Description" id="Description" style="border-color: #FFD175;">
						     <%for (int i=0; i<=Count-1; i++){%>
									<option value="<%= SoilValues[i][1] %>"><%= SoilValues[i][1] %></option>
						     	<%}%>
						     </select></td>
							<td>
							Unit or Type
							<select name="unit_or_type" id="unit_or_type" style="border-color: #FFD175;">
						     <%for (int i=0; i<=Count-1; i++){%>
									<option value="<%= SoilValues[i][2] %>"><%= SoilValues[i][2] %></option>
						     	<%}%>
						     </select></td>
							<td>Enter the Value<input type="text" style="height:23px; border-color: gray; " name="userInput" id="userInput"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td width="15%" align="center"><input type="submit" value="Submit the form" /></td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</form>
</body>
</html>
