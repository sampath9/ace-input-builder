<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="uiCommon.SortingValuesUsingjsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<title>Main page</title>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

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
<script type="text/javascript" >
jQuery(document).ready(function() {
  jQuery(".content").hide();
  //toggle the componenet with class msg_body
  jQuery(".heading").mouseover(function()
  {
    jQuery(this).next(".content").slideToggle(500);
  });
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
.layer1 {
margin: 0;
padding: 0;
width: 500px;
}
 
.heading {
margin: 1px;
color: #fff;
padding: 3px 10px;
cursor: pointer;
width: 250px;
position: relative;
background-color:#c30;
}
.content {
padding: 5px 10px;
background-color:#fafafa;
}
p { padding: 5px 0; }
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
	color: black;
	position: absolute;
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
<script type="text/javascript">
	function fnCheckSelected(chosen) {
		alert(chosen);
		var FieldsByCategory = document.Mainpage.CategoryFields;
		if (chosen == "Soils") {
			document.getElementById("SoilsDiv").style.visibility = "visible";
		}
			else {
				document.getElementById("SoilsDiv").style.visibility = "hidden";
			}
		if (chosen == "Metadata") {
			document.getElementById("MetadataDiv").style.visibility = "visible";
		}
			else {
				document.getElementById("MetadataDiv").style.visibility = "hidden";
			}
	}
	
	function fnCheckForValues(){
		document.getElementById("SoilsDiv").style.visibility = "hidden";
		document.getElementById("MetadataDiv").style.visibility = "hidden";
	}
</script>

<title>Main Page</title>
</head>
<body onload="fnCheckForValues();" bgcolor="#FCFAE8">
	<form name="Mainpage" id="Mainpage" method="post" action="">
		<table cellpadding="10">
			<tr>
				<td align="center">
				<th>MAIN PAGE</th>
				</td>
			</tr>
			<tr>
				<td>Category</td>
				<% SortingValuesUsingjsp svuj = new SortingValuesUsingjsp();
			     svuj.mainMethod(); %>
				<td align="left"><select name="Category" id="Category"
					onchange="fnCheckSelected(document.Mainpage.Category.options[document.Mainpage.Category.selectedIndex].value);">
						<option value="Metadata">Metadata</option>
						<option value="Soils">Soils</option>
						<option value="Weather">Weather</option>
						<option value="Initial Conditions">Initial Conditions</option>
						<option value="Management Events">Management Events</option>
				</select> <select name="CategoryFields" size="1">
						<option value=" " selected="selected">Please select one
							of the options above first</option>
				</select></td>
			</tr>
		</table>
		<div id="MetadataDiv">

			<% //SortingValuesUsingjsp svuj = new SortingValuesUsingjsp();
						     session.setAttribute("visited", "metadata");
						     //session.setAttribute("objectMain", svuj);
						     int CountMetaData = svuj.getMetadataValuesCounter();
						     //out.print(CountMetaData);
						     //out.print(svuj.getMetadataValues());
						     String MetadataValues[][] = new String[CountMetaData-1][2];
						     MetadataValues = svuj.getMetadataValues();%>\
						     <div class="layer1">
				<%for (int i=0; i<=CountMetaData-1; i++){%>
					<p class="heading">Code Display <%= MetadataValues[i][0] %></p>
 				<div class="content">
					Description <%= MetadataValues[i][1] %>
					Unit or Type <%= MetadataValues[i][2] %>
					</div>
				<% } %>
				</div>
		</div>
		<div id="SoilsDiv">hello in soils</div>
	</form>