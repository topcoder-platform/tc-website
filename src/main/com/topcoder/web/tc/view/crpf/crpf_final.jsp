<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Charity Challenge</title>
<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/crpfStyle.css"/>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="review_board"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="charity"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />

<!--CRPF Header-->
               <table align="center">
                  <tr>
                     <td>
                     <A href="/tc?&module=CRPFStatic&d1=crpf&d2=crpf_photos"><img src="/i/events/crpf03/crfp_banner.jpg" width="510" height="160" border="0" alt="TopCoder Charity Challenge benefiting the CRPF;T"></A><br/>
                     <img src="/i/clear.gif" width="10" height="15" border="0"/></td>
                  </tr>
               </table>

<!-- Tab bar links-->
<jsp:include page="crpfLinks.jsp" >
   <jsp:param name="selectedTab" value="advancers"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="crpfSublinks.jsp" >
   <jsp:param name="selectedList" value=""/>
   <jsp:param name="selectedTab" value=""/>
</jsp:include>



               <blockquote>
               <h2>Advancers</h2>
<!-- Online Rounds begins -->
            <p align="right"><a href="/tc?&module=CRPFStatic&d1=crpf&d2=crpf_advancers">Round 1</a>&#160;|&#160;Finals</p>
            <table align="center" border="0" cellpadding="2" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="crpfTitle" width="100%" colspan="3" bgcolor="#4E9DD5">Finals</td>
               </tr>
                <tr>
                    <td class="crpfAdvancersSort" width="10%" align="right" nowrap="nowrap">Place</td>
                    <td class="crpfAdvancersSort" width="25%" align="left" nowrap="nowrap">Handle</td>
                    <td class="crpfAdvancersSort" width="65%" align="right" nowrap="nowrap">Points</td>
               </tr>
<tr valign="top"><td class="sidebarText" align="right">1st</td><td class="sidebarText" align="left">jms137</td><td class="sidebarText" align="right">1316.57</td></tr>
<tr valign="top"><td class="sidebarText" align="right">2nd</td><td class="sidebarText" align="left">John Dethridge</td><td class="sidebarText" align="right">1209.47</td></tr>
<tr valign="top"><td class="sidebarText" align="right">3rd</td><td class="sidebarText" align="left">po</td><td class="sidebarText" align="right">1203.13</td></tr>
<tr valign="top"><td class="sidebarText" align="right">4th</td><td class="sidebarText" align="left">hamster</td><td class="sidebarText" align="right">1067.53</td></tr>
            </table><br />
            </blockquote>

<!-- Online Rounds ends -->
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <img src="/i/clear.gif" width="170" height="1" border="0"><br/>
            <jsp:include page="crpf_right.jsp" />
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>