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
            <tr><td>009<br><img src="/i/tournament/tco05/logo_submissions/009.gif" alt="" border="0" /></td></tr>
            <tr><td>010<br><img src="/i/tournament/tco05/logo_submissions/010.gif" alt="" border="0" /></td></tr>
            <tr><td>011<br><img src="/i/tournament/tco05/logo_submissions/011.gif" alt="" border="0" /></td></tr>
            <tr><td>012<br><img src="/i/tournament/tco05/logo_submissions/012.gif" alt="" border="0" /></td></tr>
            <tr><td>013<br><img src="/i/tournament/tco05/logo_submissions/013.jpg" alt="" border="0" /></td></tr>
            <tr><td>014<br><img src="/i/tournament/tco05/logo_submissions/014.jpg" alt="" border="0" /></td></tr>
            <tr><td>015<br><img src="/i/tournament/tco05/logo_submissions/015.gif" alt="" border="0" /></td></tr>
            <tr><td>016<br><img src="/i/tournament/tco05/logo_submissions/016.gif" alt="" border="0" /></td></tr>
            <tr><td>017<br><img src="/i/tournament/tco05/logo_submissions/017.jpg" alt="" border="0" /></td></tr>
            <tr><td>018<br><img src="/i/tournament/tco05/logo_submissions/018.gif" alt="" border="0" /></td></tr>
            <tr><td>019<br><img src="/i/tournament/tco05/logo_submissions/019.gif" alt="" border="0" /></td></tr>
            <tr><td>020<br><img src="/i/tournament/tco05/logo_submissions/020.gif" alt="" border="0" /></td></tr>
            <tr><td>021<br><img src="/i/tournament/tco05/logo_submissions/021.gif" alt="" border="0" /></td></tr>
            <tr><td>022<br><img src="/i/tournament/tco05/logo_submissions/022.gif" alt="" border="0" /></td></tr>
            <tr><td>023<br><img src="/i/tournament/tco05/logo_submissions/023.gif" alt="" border="0" /></td></tr>
            <tr><td>024<br><img src="/i/tournament/tco05/logo_submissions/024.gif" alt="" border="0" /></td></tr>
            <tr><td>025<br><img src="/i/tournament/tco05/logo_submissions/025.gif" alt="" border="0" /></td></tr>
            <tr><td>026<br><img src="/i/tournament/tco05/logo_submissions/026.gif" alt="" border="0" /></td></tr>
            <tr><td>027<br><img src="/i/tournament/tco05/logo_submissions/027.gif" alt="" border="0" /></td></tr>
            <tr><td>028<br><img src="/i/tournament/tco05/logo_submissions/028.gif" alt="" border="0" /></td></tr>
            <tr><td>029<br><img src="/i/tournament/tco05/logo_submissions/029.gif" alt="" border="0" /></td></tr>
            <tr><td>030<br><img src="/i/tournament/tco05/logo_submissions/030.gif" alt="" border="0" /></td></tr>
            <tr><td>031<br><img src="/i/tournament/tco05/logo_submissions/031.gif" alt="" border="0" /></td></tr>
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
