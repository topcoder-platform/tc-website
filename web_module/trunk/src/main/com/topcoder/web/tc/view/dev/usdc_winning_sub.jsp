<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Ultimate Software Development Contest</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value="contests"/>
                <jsp:param name="level3" value="ultimate"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />

<!-- Tab bar links-->
<jsp:include page="usdc_links.jsp" >
   <jsp:param name="selectedTab" value="results"/>
</jsp:include>

<h2>Results</h2>

                        <table width="510" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                            <tr>
                                <td class=header colspan=5>Project Winners</td>
                            </tr>
                            <tr>
                                <td class="sidebarTitle" nowrap=nowrap>Component</td>
                                <td class="sidebarTitle" align=center>Winner</td>
                                <td class="sidebarTitle" align=center nowrap=nowrap>Submission Date</td>
                                <td class="sidebarTitle" align=center>Score</td>
                                <td class="sidebarTitle" align=right>Prize</td>
                            </tr>
                            <tr>
                                <td class="sidebarText" nowrap=nowrap>Component A</td>
                                <td class="sidebarText" align=center><a href="/">somedude</a></td>
                                <td class="sidebarText" align=center nowrap=nowrap>06.03.2004 09:00AM</td>
                                <td class="sidebarText" align=center>90</td>
                                <td class="sidebarText" align=right>$1000</td>
                            </tr>
                        </table>

        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <jsp:include page="right.jsp"/>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
