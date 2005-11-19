<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2006 TopCoder Open - Logo Design Contest</title>
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
            <jsp:include page="/includes/global_left.jsp">
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

            <div class="logoBox"><img src="/i/tournament/tco06/logo_logo.gif" alt="TCO06 Logo Contest" border="0"/></div>
            <div align="center">
            <jsp:include page="logo_links.jsp" >
            <jsp:param name="selectedTab" value="submissions"/>
            </jsp:include>
            </div>

<p align="center">
<A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=logo_submissions">0</A>
&#160;|&#160;<A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=logo_submissions_1">1</A>
&#160;|&#160;<A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=logo_submissions_2">2</A>
&#160;|&#160;<A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=logo_submissions_3">3</A>
&#160;|&#160;<A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=logo_submissions_4">4</A>
&#160;|&#160;<A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=logo_submissions_5">5</A>
&#160;|&#160;6
</p>

<table cellpadding="10" cellspacing="0" align="center" border="0">

<tr><td>0606<br><img src="/i/tournament/tco06/logo_submissions/0606.gif" alt="" border="0" /></td></tr>   <%--154825--%>
<tr><td>0605<br><img src="/i/tournament/tco06/logo_submissions/0605.gif" alt="" border="0" /></td></tr>   <%--154825--%>
<tr><td>0604<br><img src="/i/tournament/tco06/logo_submissions/0604.gif" alt="" border="0" /></td></tr>   <%--7371063--%>
<tr><td>0603<br><img src="/i/tournament/tco06/logo_submissions/0603.gif" alt="" border="0" /></td></tr>   <%--8584656--%>
<tr><td>0602<br><img src="/i/tournament/tco06/logo_submissions/0602.gif" alt="" border="0" /></td></tr>   <%--10416197--%>
<tr><td>0601<br><img src="/i/tournament/tco06/logo_submissions/0601.gif" alt="" border="0" /></td></tr>   <%--10416197--%>
<tr><td>0600<br><img src="/i/tournament/tco06/logo_submissions/0600.gif" alt="" border="0" /></td></tr>   <%--10465538--%>
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
