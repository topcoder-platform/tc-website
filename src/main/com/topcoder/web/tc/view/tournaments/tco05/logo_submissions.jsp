<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Open - Logo Design Contest</title>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>

<style type="text/css">
.pageSpacer
{
   width: 510px;
	padding: 15px 0px 10px 0px;
   text-align: left;
}
.logoBox {
   text-align: center;
}

</style>

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" width="100%" align="center">

         <div class="pageSpacer">

            <div class="logoBox"><img src="/i/tournament/tco05/logo_logo.gif" alt="TCO05 Logo Contest" border="0"/></div>
            <div align="center">
   			<jsp:include page="logo_links.jsp" >
   			<jsp:param name="selectedTab" value="submissions"/>
   			</jsp:include>
            </div>

            <br><br>
            <table cellpadding="10" cellspacing="0" align="center" border="0">
            <tr><td>001<br><img src="/i/tournament/tco05/logo_submissions/001.gif" alt="" border="0" /></td></tr>
            <tr><td>002<br><img src="/i/tournament/tco05/logo_submissions/002.gif" alt="" border="0" /></td></tr>
            <tr><td>003<br><img src="/i/tournament/tco05/logo_submissions/003.gif" alt="" border="0" /></td></tr>
            <tr><td>004<br><img src="/i/tournament/tco05/logo_submissions/004.gif" alt="" border="0" /></td></tr>
            <tr><td>005<br><img src="/i/tournament/tco05/logo_submissions/005.gif" alt="" border="0" /></td></tr>
            <tr><td>006<br><img src="/i/tournament/tco05/logo_submissions/006.jpg" alt="" border="0" /></td></tr>
            <tr><td>007<br><img src="/i/tournament/tco05/logo_submissions/007.gif" alt="" border="0" /></td></tr>
            <tr><td>008<br><img src="/i/tournament/tco05/logo_submissions/008.gif" alt="" border="0" /></td></tr>
            </table>
         </div>

         <p><br/></p>
         </td>
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
