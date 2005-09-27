<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<html>
<head>
<title>Programming Contests, Software Development, and Employment Services at TopCoder</title>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/tcStyles.css"/>
<script type="text/javascript">
function arena() {
  w=window.open("http://www.topcoder.com/tc?module=Static&d1=applet&d2=launch","Launch","top=2,left=2,width=300,height=225,resizable=yes,status=1");
  return;
}
</script>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left_full.jsp">
                <jsp:param name="level1" value=""/>
                <jsp:param name="level2" value=""/>
                <jsp:param name="level3" value=""/>
                <jsp:param name="level4" value=""/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
		<td width="100%" align="center">
			<img src="/i/clear.gif" alt="" width="1" height="15" border="0" /><br/>
		 </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <p><br/></p>
         </td>
<!-- Right Column Ends -->

    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>

