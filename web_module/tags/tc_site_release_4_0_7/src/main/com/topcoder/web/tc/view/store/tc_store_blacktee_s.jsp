<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Gear Store</title>

<jsp:include page="../../script.jsp" />

<STYLE TYPE="text/css">
<!--
 	.StoreTABLE	{ margin-top: 10px; margin-bottom: 10px; text-align: center; width: 540px;
 				font-family: Verdana, sans-serif;
				color: #000000;
				font-size: 11pt;
				font-weight: normal;
				text-decoration: none;
				text-align: center;
				line-height: 14pt }

 	.StoreTD	{ text-align: center; width: 180px; height: 55px; }

	.LeftBG		{ background-image: url(/i/store/tc_store_left.gif); width: 90px; height: 100% }

	.RightBG	{ background-image: url(/i/store/tc_store_right.gif); width: 90px; height: 100% }

    a.Store:link, a.Store:active, a.Store:visited	{ color: #000000; text-decoration: none }
    a.Store:hover	{ color: #FF0000; text-decoration: none }
-->
 </STYLE>

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value="store"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" align="center">
	<table class="StoreTABLE" align="center" border="0" cellpadding="5" cellspacing="0">
	<tr>
		<td class="LeftBG" rowspan="8"></td>
		<td class="StoreTD" colspan="2"><img src="/i/store/tcgear_logo.gif"></img></td>
		<td class="RightBG" rowspan="8"></td>
	</tr>
		<tr>
			<td colspan="2"><img src="/i/store/tc_store_teeshort_black2.jpg"></img></td>
		</tr>
		<tr>
			<td colspan="2"><strong>TopCoder Logo Tee - Black Short Sleeve</strong>
<P>100% ring-spun cotton, heavyweight 6.1oz T-shirt in Black. The TopCoder logo is silkscreened on the left chest and on the upper back.</P>
		<a class="Store" href="tc?module=Static&d1=store&d2=home"><strong>- Back -</strong></a></td>
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
