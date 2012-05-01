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
<jsp:param name="title" value="2007.5 Assembly Cup Series"/>
</jsp:include>

<jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="assembly"/>
    <jsp:param name="tabLev2" value="overview"/>
</jsp:include>

<span class="title">Overview</span>
<br><br>
Each assembly competition will carry a total number of points equivalent to the prize money for that competition. Placement Points will be awarded based on the number of submissions that pass review, as follows:
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
      <td class="sidebarTitle" align="right">1</td>
      <td class="sidebarTitle" align="right">2</td>
      <td class="sidebarTitle" align="right">3</td>
      <td class="sidebarTitle" align="right">4</td>
      <td class="sidebarTitle" align="right">5</td>
      <td class="sidebarTitle" align="right">6</td>
      <td class="sidebarTitle" align="right">7</td>
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
Up to 100% of the placement points may be deducted for bugs or late final fixes. Twenty percent of the placement points will be deducted for every four (4) hours a final fix is late. On a case-by-case basis, as determined by TopCoder staff, additional placement points may be deducted for bugs found in the application within 30 days of completion.
<br><br>
The number of points allocated to an individual will be equal to the number of points received multiplied by the percentage of prize money the individual agreed to during registration.
<br><br>
NOTE: Coaches may earn digital run points.
<br><br>
<strong>For example:</strong>
<br><br>
Team A, with three participants, places second and Team B, with two participants, places first in a $10,000 contest; both teams had agreed to split their prizes equally.  The participants on Team A would receive (10,000 * .35)/3 = 1166.67 points per person and Team B would receive (10,000 *.65)/2 = 3250.00 per person.
<br><br>
<strong>Example 2:</strong>
<br><br>
<ul>
<li>Team A finishes in first place for a $12,000 competition with two participants splitting the prize.</li>
<li>Team B comes in second place with two people splitting the prizes of 40% and 40% and giving 20% to a coach.</li>
<li>Team C comes in third place with the team captain taking 50% and two other team members each taking 25%.</li>
</ul>
The points would be awarded as follows:
<br><br>
<table width="500" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
   <tr>
      <td class="sidebarTitle">Team</td>
      <td class="sidebarTitle" align="center">Percentage of Points</td>
      <td class="sidebarTitle" align="center">Points Earned</td>
      <td class="sidebarTitle" align="center">Team mate percentage</td>
      <td class="sidebarTitle" align="center">Points earned</td>
   </tr>
   <tr>
      <td class="sidebarText" rowspan="2"nowrap="nowrap">Team A</td>
      <td class="sidebarText" align="center">54%</td>
      <td class="sidebarText" align="center">6480</td>
      <td class="sidebarText" align="center">50%</td>
      <td class="sidebarText" align="center">3240</td>
    </tr>
   <tr>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">50%</td>
      <td class="sidebarText" align="center">3240</td>
    </tr>
   <tr>
      <td class="sidebarText" rowspan="3"nowrap="nowrap">Team B</td>
      <td class="sidebarText" align="center">30%</td>
      <td class="sidebarText" align="center">3600</td>
      <td class="sidebarText" align="center">40%</td>
      <td class="sidebarText" align="center">1440</td>
    </tr>
   <tr>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">40%</td>
      <td class="sidebarText" align="center">1440</td>
    </tr>
   <tr>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">20%</td>
      <td class="sidebarText" align="center">720</td>
    </tr>
   <tr>
      <td class="sidebarText" rowspan="3"nowrap="nowrap">Team C</td>
      <td class="sidebarText" align="center">16%</td>
      <td class="sidebarText" align="center">1920</td>
      <td class="sidebarText" align="center">50%</td>
      <td class="sidebarText" align="center">960</td>
    </tr>
   <tr>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">25%</td>
      <td class="sidebarText" align="center">480</td>
    </tr>
   <tr>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">25%</td>
      <td class="sidebarText" align="center">480</td>
    </tr>
</table>

<br><br>

<strong>Example 3:</strong>

<ul>
<li>Team A finishes in first place for a $12,000 competition with two participants splitting the prize.  Team A also was late on final fixes for 8 hours and had one bug for a penalty of 3%.</li>
<li>Team B comes in second place with two people splitting the prizes of 40% and 40% and giving 20% to a coach.</li>
<li>Team C comes in third place with the team captain taking 50% and two other team members each taking 25%.</li>
</ul>

The points would be awarded as follows:
<br><br>

<table width="500" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
   <tr>
      <td class="sidebarTitle">Team</td>
      <td class="sidebarTitle" align="center">Percentage of Points</td>
      <td class="sidebarTitle" align="center">Penalties</td>
      <td class="sidebarTitle" align="center">Points Earned</td>
      <td class="sidebarTitle" align="center">Team mate percentage</td>
      <td class="sidebarTitle" align="center">Points earned</td>
   </tr>
   <tr>
      <td class="sidebarText" rowspan="2"nowrap="nowrap">Team A</td>
      <td class="sidebarText" align="center">54%</td>
      <td class="sidebarText" align="center">3%</td>
      <td class="sidebarText" align="center">6285.6</td>
      <td class="sidebarText" align="center">50%</td>
      <td class="sidebarText" align="center">3142.8</td>
    </tr>
   <tr>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">50%</td>
      <td class="sidebarText" align="center">3142.8</td>
    </tr>
   <tr>
      <td class="sidebarText" rowspan="3"nowrap="nowrap">Team B</td>
      <td class="sidebarText" align="center">30%</td>
      <td class="sidebarText" align="center">0%</td>
      <td class="sidebarText" align="center">3600</td>
      <td class="sidebarText" align="center">40%</td>
      <td class="sidebarText" align="center">1440</td>
    </tr>
   <tr>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">40%</td>
      <td class="sidebarText" align="center">1440</td>
    </tr>
   <tr>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">20%</td>
      <td class="sidebarText" align="center">720</td>
    </tr>
   <tr>
      <td class="sidebarText" rowspan="3"nowrap="nowrap">Team C</td>
      <td class="sidebarText" align="center">16%</td>
      <td class="sidebarText" align="center">0%</td>
      <td class="sidebarText" align="center">1920</td>
      <td class="sidebarText" align="center">50%</td>
      <td class="sidebarText" align="center">960</td>
    </tr>
   <tr>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">25%</td>
      <td class="sidebarText" align="center">480</td>
    </tr>
   <tr>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">&nbsp;</td>
      <td class="sidebarText" align="center">25%</td>
      <td class="sidebarText" align="center">480</td>
    </tr>
</table>
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