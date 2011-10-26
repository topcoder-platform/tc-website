<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - The Digital Run</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../../script.jsp" />
</head>
<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="node" value="digital_run"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="digital_run_20061031"/>
<jsp:param name="title" value="2007.5 Development Cup Series"/>
</jsp:include>

<jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="development"/>
    <jsp:param name="tabLev2" value="overview"/>
</jsp:include>

<span class="title">Overview</span>
<br><br>
Each component posted for a development competition will carry a point value - equivalent to the prize money for the component - in placement points. Placement points will be awarded based on the number of submissions that pass review, as follows:
<br><br>
<A class="bcLink" name="point_table"></A>
<table width="500" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
   <tr>
      <td class="sidebarTitle">&#160;</td>
      <td class="sidebarTitle">&#160;</td>
      <td class="sidebarTitle" align="center" colspan="7"># of Submissions that Pass Review</td>
   </tr>
   <tr>
      <td class="sidebarTitle" align="center" rowspan="8">Placement<br>Points</td>
      <td class="sidebarTitle" align="center">Place</td>
      <td class="sidebarTitle" align="right" width="10%">1</td>
      <td class="sidebarTitle" align="right" width="10%">2</td>
      <td class="sidebarTitle" align="right" width="10%">3</td>
      <td class="sidebarTitle" align="right" width="10%">4</td>
      <td class="sidebarTitle" align="right" width="10%">5</td>
      <td class="sidebarTitle" align="right" width="10%">6</td>
      <td class="sidebarTitle" align="right" width="10%">7</td>
   </tr>
   <tr>
      <td class="sidebarText" align="center">1st</td>
      <td class="sidebarText" align="right">100%</td>
      <td class="sidebarText" align="right">65%</td>
      <td class="sidebarText" align="right">54%</td>
      <td class="sidebarText" align="right">50%</td>
      <td class="sidebarText" align="right">49%</td>
      <td class="sidebarText" align="right">48%</td>
      <td class="sidebarText" align="right">47%</td>
   </tr>
   <tr>
      <td class="sidebarText" align="center">2nd</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">35%</td>
      <td class="sidebarText" align="right">30%</td>
      <td class="sidebarText" align="right">29%</td>
      <td class="sidebarText" align="right">27%</td>
      <td class="sidebarText" align="right">26%</td>
      <td class="sidebarText" align="right">26%</td>
   </tr>
   <tr>
      <td class="sidebarText" align="center">3rd</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">16%</td>
      <td class="sidebarText" align="right">15%</td>
      <td class="sidebarText" align="right">15%</td>
      <td class="sidebarText" align="right">15%</td>
      <td class="sidebarText" align="right">15%</td>
   </tr>
   <tr>
      <td class="sidebarText" align="center">4th</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">6%</td>
      <td class="sidebarText" align="right">6%</td>
      <td class="sidebarText" align="right">6%</td>
      <td class="sidebarText" align="right">6%</td>
   </tr>
   <tr>
      <td class="sidebarText" align="center">5th</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">3%</td>
      <td class="sidebarText" align="right">3%</td>
      <td class="sidebarText" align="right">3%</td>
   </tr>
   <tr>
      <td class="sidebarText" align="center">6th</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">2%</td>
      <td class="sidebarText" align="right">2%</td>
   </tr>
   <tr>
      <td class="sidebarText" align="center">7th</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">1%</td>
   </tr>
</table>
<br><br>
If more than seven (7) submissions pass review, the competitors who place in 8th position or below will not receive any placement points. 
<br><br>
Up to 100% of placement points may be deducted for bugs or late final fixes. 20% of placement point will be deducted for every (24) hours a final fix or component forum issue is late. On a case-by-case basis, as determined by TopCoder staff, additional placement points may be deducted for bugs found in components within 30 days of completion.
<br><br>
</div>

</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>