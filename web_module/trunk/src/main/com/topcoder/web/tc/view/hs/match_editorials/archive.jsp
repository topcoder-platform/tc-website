<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="/script.jsp" />
</head>
<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="hs_match_editorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="sectionHeader">Match Editorial Archive - 2006</div>

<table width="100%" border="0" cellspacing="0" cellpadding="3">
   <table width="100%" border="0" cellspacing="0" cellpadding="3">
   
   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>September</strong></td></tr>
   <tr><td class="bodyText">09.11.06</td><td class="bodyText" nowrap="0" width="100%">TCHS SRM 14 - <a href="/tc?module=Static&d1=hs&d2=match_editorials&d3=hs_srm14">Problem Set & Analysis</a></td></tr>

   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>August</strong></td></tr>
   <tr><td class="bodyText">08.28.06</td><td class="bodyText" nowrap="0" width="100%">TCHS SRM 13 - <a href="/tc?module=Static&d1=hs&d2=match_editorials&d3=hs_srm13">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.21.06</td><td class="bodyText" nowrap="0" width="100%">TCHS SRM 12 - <a href="/tc?module=Static&d1=hs&d2=match_editorials&d3=hs_srm12">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.14.06</td><td class="bodyText" nowrap="0" width="100%">TCHS SRM 11 - <a href="/tc?module=Static&d1=hs&d2=match_editorials&d3=hs_srm11">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">08.07.06</td><td class="bodyText" nowrap="0" width="100%">TCHS SRM 10 - <a href="/tc?module=Static&d1=hs&d2=match_editorials&d3=hs_srm10">Problem Set & Analysis</a></td></tr>

   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>July</strong></td></tr>
   <tr><td class="bodyText">07.31.06</td><td class="bodyText" nowrap="0" width="100%">TCHS SRM 9 - <a href="/tc?module=Static&d1=hs&d2=match_editorials&d3=hs_srm9">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">07.24.06</td><td class="bodyText" nowrap="0" width="100%">TCHS SRM 8 - <a href="/tc?module=Static&d1=hs&d2=match_editorials&d3=hs_srm8">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">07.17.06</td><td class="bodyText" nowrap="0" width="100%">TCHS SRM 7 - <a href="/tc?module=Static&d1=hs&d2=match_editorials&d3=hs_srm7">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">07.10.06</td><td class="bodyText" nowrap="0" width="100%">TCHS SRM 6 - <a href="/tc?module=Static&d1=hs&d2=match_editorials&d3=hs_srm6">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">07.05.06</td><td class="bodyText" nowrap="0" width="100%">TCHS SRM 5 - <a href="/tc?module=Static&d1=hs&d2=match_editorials&d3=hs_srm5">Problem Set & Analysis</a></td></tr>

   <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
   <tr><td valign="middle" class="bodyText" colspan="2"><strong>June</strong></td></tr>
   <tr><td class="bodyText">06.26.06</td><td class="bodyText" nowrap="0" width="100%">TCHS SRM 4 - <a href="/tc?module=Static&d1=hs&d2=match_editorials&d3=hs_srm4">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">06.19.06</td><td class="bodyText" nowrap="0" width="100%">TCHS SRM 3 - <a href="/tc?module=Static&d1=hs&d2=match_editorials&d3=hs_srm3">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">06.12.06</td><td class="bodyText" nowrap="0" width="100%">TCHS SRM 2 - <a href="/tc?module=Static&d1=hs&d2=match_editorials&d3=hs_srm2">Problem Set & Analysis</a></td></tr>
   <tr><td class="bodyText">06.05.06</td><td class="bodyText" nowrap="0" width="100%">TCHS SRM 1 - <a href="/tc?module=Static&d1=hs&d2=match_editorials&d3=hs_srm1">Problem Set & Analysis</a></td></tr>

</table>

</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="tchs"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>