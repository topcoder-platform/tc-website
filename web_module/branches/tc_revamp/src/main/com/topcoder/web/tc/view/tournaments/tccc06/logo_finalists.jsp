<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>2006 TopCoder Collegiate Challenge - Logo Design Contest</title>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

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

            <div class="logoBox"><img src="/i/tournament/tccc06/logo_logo.gif" alt="TCCC06 Logo Contest" border="0"/></div>
            <div align="center">
            <jsp:include page="logo_links.jsp" >
            <jsp:param name="selectedTab" value="finalists"/>
            </jsp:include>
            </div>

<br><br>
<span class="bodySubtitle">Finalists</span>
<br><br>
<A href="/tc?module=ViewSurvey&sid=217">Vote for your favorite</A>
<br><br>
<table cellpadding="10" cellspacing="0" align="center" border="0" class="bodyText">
<tr><td>0045<br><img src="/i/tournament/tccc06/finalists/0045.gif" alt="" border="0" /><hr></td></tr>
<tr><td>0224<br><img src="/i/tournament/tccc06/finalists/0224.gif" alt="" border="0" /><hr></td></tr>
<tr><td>0227<br><img src="/i/tournament/tccc06/finalists/0227.gif" alt="" border="0" /><hr></td></tr>
<tr><td>0377<br><img src="/i/tournament/tccc06/finalists/0377.gif" alt="" border="0" /><hr></td></tr>
<tr><td>0379<br><img src="/i/tournament/tccc06/finalists/0379.gif" alt="" border="0" /><hr></td></tr>
<tr><td>0404<br><img src="/i/tournament/tccc06/finalists/0404.gif" alt="" border="0" /><hr></td></tr>
<tr><td>0433<br><img src="/i/tournament/tccc06/finalists/0433.gif" alt="" border="0" /><hr></td></tr>
<tr><td>0449<br><img src="/i/tournament/tccc06/finalists/0449.gif" alt="" border="0" /><hr></td></tr>
<tr><td>0462<br><img src="/i/tournament/tccc06/finalists/0462.gif" alt="" border="0" /><hr></td></tr>
<tr><td>0571<br><img src="/i/tournament/tccc06/finalists/0571.gif" alt="" border="0" /><hr></td></tr>
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