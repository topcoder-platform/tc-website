<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Gear Store</title>

<jsp:include page="../../script.jsp" />

<STYLE TYPE="text/css">
<!--
 	store_body      { margin: 0px;
 				padding: 0px;
 				background: #FFFFFF; }
 	
 	store_table	{ width: 540px; border-color: #CC0000 }
 	 			
 	store_td		{ text-align: center; width: 180px; height: 55px; border-width: 1px; border-color: #000000 }
  
	.leftbg	{ background-image: url(tc_store_left.gif); height: 100% }

	.rightbg	{ background-image: url(tc_store_right.gif); height: 100% }
	
    store_img			{ margin: 0px; border-width: 1px; border-color: #FF0000 }
  
	H3, P, a:link, a:visited
			{ 	font-family: Verdana, sans-serif;
				color: #000000;
				font-size: 10pt;
				font-weight: normal;
				text-decoration: none;
				text-align: center;
				line-height: 12pt }
	
	H3		{ font-weight: bold }
				
	a:hover	{ text-decoration: none;
				color: #ff0000; }
-->
 </STYLE>

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="1" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="store"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
	<table class="store_table" align="center" border="0" cellpadding="5" cellspacing="0">
	<tr>
		<td id="store_td" class="leftbg" rowspan="8"></td>
		<td id="store_td" colspan="2"><img src="tcgear_logo.gif"></img></td>
		<td id="store_td" class="rightbg" rowspan="8"></td>
	</tr>
	
		<tr>
			<td><img src="teeshort_grey.jpg"></img></td>
			<td><a href="tc_store_greytee_s.html"><strong>TopCoder Logo Tee</strong><br>Grey Short Sleeve</a></td>
		</tr>
		
		<tr>
			<td><img src="teeshort_black.jpg"></img></td>
			<td><a href="tc_store_blacktee_s.html"><strong>TopCoder Logo Tee</strong><br>Black Short Sleeve</a></td>
		</tr>
		
		<tr>
			<td><img src="teelong_grey.jpg"></img></td>
			<td><a href="tc_store_greytee_l.html"><strong>TopCoder Logo Tee</strong><br>Grey Long Sleeve</a></td>
		</tr>
		
		<tr>
			<td><img src="teelong_black.jpg"></img></td>
			<td><a href="tc_store_blacktee_l.html"><strong>TopCoder Logo Tee</strong><br>Black Long Sleeve</a></td>
		</tr>
		
		<tr>
			<td><img src="polo.jpg"></img></td>
			<td><a href="tc_store_polo.html"><strong>TopCoder Polo</strong><br>Black Short Sleeve</a></td>
		</tr>

		<tr>
			<td><img src="jacket.jpg"></img></td>
			<td><a href="tc_store_jacket.html"><strong>TopCoder Jacket</strong></a></td>
		</tr>
		
		<tr>
			<td><img src="backpack.jpg"></img></td>
			<td><a href="tc_store_backpack.html"><strong>TopCoder Backpack</strong></a></td>
		</tr>
</table>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
