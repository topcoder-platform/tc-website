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
<jsp:param name="title" value="2008 Assembly Cup Series"/>
</jsp:include>

<jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="assembly"/>
    <jsp:param name="tabLev2" value="overview"/>
</jsp:include>

<span class="title">Overview</span>
<br /><br />
Each assembly competition will carry a total number of points equivalent to the prize money for that competition. Placement Points will be awarded based on the number of submissions that pass review, as follows:
<br /><br />
<A class="bcLink" name="point_table"></A>
<table width="500" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
   <tr>
      <td class="sidebarTitle">&#160;</td>
      <td class="sidebarTitle">&#160;</td>
      <td class="sidebarTitle" align="center" colspan="7"># of Submissions that Pass Review</td>
   </tr>
   <tr>
      <td class="sidebarTitle" align="center" rowspan="8">Placement<br />Points</td>
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
      <td class="sidebarText" align="right">70%</td>
      <td class="sidebarText" align="right">65%</td>
      <td class="sidebarText" align="right">60%</td>
      <td class="sidebarText" align="right">56%</td>
      <td class="sidebarText" align="right">53%</td>
      <td class="sidebarText" align="right">51%</td>
   </tr>
   <tr>
      <td class="sidebarText" align="center">2nd</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">30%</td>
      <td class="sidebarText" align="right">25%</td>
      <td class="sidebarText" align="right">22%</td>
      <td class="sidebarText" align="right">20%</td>
      <td class="sidebarText" align="right">18%</td>
      <td class="sidebarText" align="right">17%</td>
   </tr>
   <tr>
      <td class="sidebarText" align="center">3rd</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">10%</td>
      <td class="sidebarText" align="right">10%</td>
      <td class="sidebarText" align="right">10%</td>
      <td class="sidebarText" align="right">10%</td>
      <td class="sidebarText" align="right">10%</td>
   </tr>
   <tr>
      <td class="sidebarText" align="center">4th</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">8%</td>
      <td class="sidebarText" align="right">8%</td>
      <td class="sidebarText" align="right">8%</td>
      <td class="sidebarText" align="right">8%</td>
   </tr>
   <tr>
      <td class="sidebarText" align="center">5th</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">6%</td>
      <td class="sidebarText" align="right">6%</td>
      <td class="sidebarText" align="right">6%</td>
   </tr>
   <tr>
      <td class="sidebarText" align="center">6th</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">5%</td>
      <td class="sidebarText" align="right">5%</td>
   </tr>
   <tr>
      <td class="sidebarText" align="center">7th</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">&#160;</td>
      <td class="sidebarText" align="right">3%</td>
   </tr>
</table>
<br /><br />
If more than seven (7) submissions pass review, the competitors who place in 8th position or below will not receive any placement points.
<br /><br />
Up to 100% of the placement points may be deducted for bugs or late final fixes. Twenty percent (20%) of the placement points will be deducted for every four (4) hours a final fix is late. On a case-by-case basis as determined by TopCoder staff, additional placement points may be deducted for bugs found in the application within thirty (30) days of completion.
<br /><br />
The number of points allocated to an individual will be equal to the number of points received multiplied by the percentage of prize money the individual agreed to during registration.
<br /><br />
NOTE: Coaches may earn Digital Run points.
<br /><br />
<strong>For example:</strong>
<br /><br />
Team A has three participants and places second; Team B has two participants and places first.  The contest has a prize purse of $10,000.  Both teams agree to split their prizes equally among their respective team members. The participants on Team A would receive (10,000 * 0.30)/3 = 1000.00 points per person and Team B would receive (10,000 * 0.70)/2 = 3500.00 per person.
<br /><br />
<strong>Example 2:</strong>
<br /><br />
<ul>
<li>Team A finishes in first place for a $12,000 competition and has two members splitting the prize equally.</li>
<li>Team B finishes in second place with two members splitting the prizes so that each member receives 40% and their coach receives 20%.</li>
<li>Team C comes in third place with the team captain taking 50% of the prize purse and two other team members each taking 25%.</li>
</ul>
The points would be awarded as follows:
<br /><br />
<table width="500" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
   <tr>
      <td class="sidebarTitle" align="center" valign="middle">Team</td>
      <td class="sidebarTitle" align="center" valign="middle">Percentage of Points</td>
      <td class="sidebarTitle" align="center" valign="middle">Total Points Earned</td>
      <td class="sidebarTitle" align="center" valign="middle">Individual percentage</td>
      <td class="sidebarTitle" align="center" valign="middle">Individual Points earned</td>
   </tr>
   <tr>
      <td class="sidebarText" rowspan="2" align="center" valign="middle" nowrap="nowrap">Team A</td>
      <td class="sidebarText" align="center" valign="middle" rowspan="2">65%</td>
      <td class="sidebarText" align="center" valign="middle" rowspan="2">7800</td>
      <td class="sidebarText" align="center" valign="middle">50%</td>
      <td class="sidebarText" align="center" valign="middle">3800</td>
    </tr>
   <tr>
      <td class="sidebarText" align="center" valign="middle">50%</td>
      <td class="sidebarText" align="center" valign="middle">3800</td>
    </tr>
   <tr>
      <td class="sidebarText" rowspan="3" align="center" nowrap="nowrap">Team B</td>
      <td class="sidebarText" align="center" valign="middle" rowspan="3">25%</td>
      <td class="sidebarText" align="center" valign="middle" rowspan="3">3000</td>
      <td class="sidebarText" align="center" valign="middle">40%</td>
      <td class="sidebarText" align="center" valign="middle">1200</td>
    </tr>
   <tr>
      <td class="sidebarText" align="center" valign="middle">40%</td>
      <td class="sidebarText" align="center" valign="middle">1200</td>
    </tr>
   <tr>
      <td class="sidebarText" align="center" valign="middle">20%</td>
      <td class="sidebarText" align="center" valign="middle">600</td>
    </tr>
   <tr>
      <td class="sidebarText" rowspan="3" align="center" nowrap="nowrap">Team C</td>
      <td class="sidebarText" align="center" valign="middle" rowspan="3">10%</td>
      <td class="sidebarText" align="center" valign="middle" rowspan="3">1200</td>
      <td class="sidebarText" align="center" valign="middle">50%</td>
      <td class="sidebarText" align="center" valign="middle">600</td>
    </tr>
   <tr>
      <td class="sidebarText" align="center" valign="middle">25%</td>
      <td class="sidebarText" align="center" valign="middle">300</td>
    </tr>
   <tr>
      <td class="sidebarText" align="center" valign="middle">25%</td>
      <td class="sidebarText" align="center" valign="middle">300</td>
    </tr>
</table>

<br /><br />

<strong>Example 3:</strong>

<ul>
<li>Team A finishes in first place for a $12,000 competition with two members splitting the prize equally. Team A also was late on final fixes for 8 hours and had one bug for a 3% penalty.</li>
<li>Team B finishes in second place with two members splitting the prizes so that each member receives 40% and their coach receives 20%.</li>
<li>Team C finishes in third place with the team captain taking 50% of the prize purse and two other team members each taking 25%.</li>
</ul>

The points would be awarded as follows:
<br /><br />

<table width="500" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
   <tr>
      <td class="sidebarTitle" align="center" valign="middle">Team</td>
      <td class="sidebarTitle" align="center" valign="middle">Percentage of Points</td>
      <td class="sidebarTitle" align="center" valign="middle">Team Penalties</td>
      <td class="sidebarTitle" align="center" valign="middle">Total Points Earned</td>
      <td class="sidebarTitle" align="center" valign="middle">Individual Percentage</td>
      <td class="sidebarTitle" align="center" valign="middle">Individual Points Earned</td>
   </tr>
   <tr>
      <td class="sidebarText" rowspan="2" align="center" valign="middle" nowrap="nowrap">Team A</td>
      <td class="sidebarText" align="center" valign="middle" rowspan="2">65%</td>
      <td class="sidebarText" align="center" valign="middle" rowspan="2">3%</td>
      <td class="sidebarText" align="center" valign="middle" rowspan="2">7566</td>
      <td class="sidebarText" align="center" valign="middle">50%</td>
      <td class="sidebarText" align="center" valign="middle">3783</td>
    </tr>
   <tr>
      <td class="sidebarText" align="center" valign="middle">50%</td>
      <td class="sidebarText" align="center" valign="middle">3783</td>
    </tr>
   <tr>
      <td class="sidebarText" rowspan="3" align="center" valign="middle" nowrap="nowrap">Team B</td>
      <td class="sidebarText" align="center" valign="middle" rowspan="3">25%</td>
      <td class="sidebarText" align="center" valign="middle" rowspan="3">0%</td>
      <td class="sidebarText" align="center" valign="middle" rowspan="3">3000</td>
      <td class="sidebarText" align="center" valign="middle">40%</td>
      <td class="sidebarText" align="center" valign="middle">1200</td>
    </tr>
   <tr>
      <td class="sidebarText" align="center" valign="middle">40%</td>
      <td class="sidebarText" align="center" valign="middle">1200</td>
    </tr>
   <tr>
      <td class="sidebarText" align="center" valign="middle">20%</td>
      <td class="sidebarText" align="center" valign="middle">600</td>
    </tr>
   <tr>
      <td class="sidebarText" rowspan="3" align="center" valign="middle" nowrap="nowrap">Team C</td>
      <td class="sidebarText" align="center" rowspan="3" valign="middle">10%</td>
      <td class="sidebarText" align="center" rowspan="3" valign="middle">0%</td>
      <td class="sidebarText" align="center" rowspan="3" valign="middle">1200</td>
      <td class="sidebarText" align="center" valign="middle">50%</td>
      <td class="sidebarText" align="center" valign="middle">600</td>
    </tr>
   <tr>
      <td class="sidebarText" align="center" valign="middle">25%</td>
      <td class="sidebarText" align="center" valign="middle">300</td>
    </tr>
   <tr>
      <td class="sidebarText" align="center" valign="middle">25%</td>
      <td class="sidebarText" align="center" valign="middle">300</td>
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