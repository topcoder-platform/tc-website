<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet"
%>

<!--
         		 com.jivesoftware.util.StringUtils,
         		 com.jivesoftware.forum.*"
-->

<html>
<head>
<title>TopCoder | Round Tables</title>

<jsp:include page="script.jsp" />

</head>

<body>

<!-- Top begins -->
<%-- Needs auth token
<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="login"/>
</jsp:include>
--%>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<%-- Needs auth token
<!-- Left Column Begins -->
        <td width="170">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="login"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->
--%>

<!-- Center Column begins -->
        <td width="100%"><img src="/i/clear.gif" width="400" height="11" alt="" border="0"><br>

			<table cellspacing=0 class=pageTitleTable>
    			<tr>
        			<td width="100%" class=pageTitle><img border=0 src="/i/header_round_table.gif" alt="round_table"/></td><td align=right class=pageSubtitle>&#160;&#160;</td>
    			</tr>
			</table>

        </td>
<!-- Center Column ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" alt="" border="0"></td>
<!-- Left Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="foot.jsp"/>
<!-- Footer ends -->

</body>
</html>