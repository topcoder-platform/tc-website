<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>2006 TopCoder Collegiate Challenge - Logo Design Contest</title>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>

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
        <td width="180"><jsp:include page="/includes/global_left.jsp">
<jsp:param name="node" value="topcoder_tournaments"/>
</jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" width="100%" align="center">

         <div class="pageSpacer">

            <div class="logoBox"><img src="/i/tournament/tccc06/logo_logo.gif" alt="TCCC06 Logo Contest" border="0"/></div><br>
            <div align="center">
            <jsp:include page="logo_links.jsp" >
            <jsp:param name="selectedTab" value="submissions"/>
            </jsp:include>
            </div>

<p align="center">
<A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_submissions">0</A>
&#160;|&#160;1
<%--&#160;|&#160;<A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_submissions_2">2</A>
&#160;|&#160;<A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_submissions_3">3</A>
&#160;|&#160;<A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_submissions_4">4</A>
&#160;|&#160;<A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_submissions_5">5</A>
&#160;|&#160;<A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_submissions_6">6</A>--%>
</p>

<table cellpadding="10" cellspacing="0" align="center" border="0">
<tr><td>0010<br><img src="/i/tournament/tco06/logo_submissions/0010.jpg" alt="" border="0" /></td></tr>   <%--15795717--%>
<tr><td>0009<br><img src="/i/tournament/tco06/logo_submissions/0009.png" alt="" border="0" /></td></tr>   <%--15498334--%>
<tr><td>0008<br><img src="/i/tournament/tco06/logo_submissions/0008.png" alt="" border="0" /></td></tr>   <%--15498334--%>
<tr><td>0007<br><img src="/i/tournament/tco06/logo_submissions/0007.jpg" alt="" border="0" /></td></tr>   <%--19797817--%>
<tr><td>0006<br><img src="/i/tournament/tco06/logo_submissions/0006.jpg" alt="" border="0" /></td></tr>   <%--19797315--%>
<tr><td>0005<br><img src="/i/tournament/tco06/logo_submissions/0005.gif" alt="" border="0" /></td></tr>   <%--19746045--%>
<tr><td>0004<br><img src="/i/tournament/tco06/logo_submissions/0004.jpg" alt="" border="0" /></td></tr>   <%--15795717--%>
<tr><td>0003<br><img src="/i/tournament/tco06/logo_submissions/0003.gif" alt="" border="0" /></td></tr>   <%--13334614--%>
<tr><td>0002<br><img src="/i/tournament/tco06/logo_submissions/0002.png" alt="" border="0" /></td></tr>   <%--10487679--%>
<tr><td>0001<br><img src="/i/tournament/tco06/logo_submissions/0001.jpg" alt="" border="0" /></td></tr>   <%--8396227--%>
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