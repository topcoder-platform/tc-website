<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
<title>TopCoder - The Digital Run</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="digitalrun"/>
</jsp:include>
</head>
<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<!-- centerer -->
<div align="center">

    <!-- spacer -->
    <div id="pageSpacer">

<jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="design"/>
    <jsp:param name="tabLev2" value="overview"/>
</jsp:include>

<span class="title">Overview</span>
<br /><br />
Each contest posted in <a href="/tc?module=ViewActiveContests&amp;ph=112">Software Design</a>, <a href="/tc?module=ActiveContests&amp;pt=7">Software Architecture</a>, <a href="/tc?module=ActiveContests&amp;pt=23">Software Conceptualization</a>, <a href="/tc?module=ActiveContests&amp;pt=6">Software Specification</a>, and <a href="/tc?module=ActiveContests&amp;pt=26">Test Scenarios</a> will carry a point value. Placement points will be awarded based on the number of submissions that pass review, as follows:
<br /><br />
<a class="bcLink" name="point_table"></a>
<div align="center">
<table cellpadding="0" cellspacing="0" class="drStat" width="400">
<thead>
    <tr>
        <th class="title" colspan="8">Percentage of Placement Points</th>
    </tr>
   <tr>
      <th>&#160;</th>
      <th colspan="7"># of Submissions that Pass Review</th>
   </tr>
   <tr>
      <th class="c">Place</th>
      <th class="r">1</th>
      <th class="r">2</th>
      <th class="r">3</th>
      <th class="r">4</th>
      <th class="r">5</th>
   </tr>
</thead>
<tbody>
   <tr class="odd">
      <td class="c">1st</td>
      <td class="r">100%</td>
      <td class="r">70%</td>
      <td class="r">65%</td>
      <td class="r">60%</td>
      <td class="r">56%</td>
   </tr>
   <tr class="even">
      <td class="c">2nd</td>
      <td class="r">&#160;</td>
      <td class="r">30%</td>
      <td class="r">25%</td>
      <td class="r">22%</td>
      <td class="r">20%</td>
   </tr>
   <tr class="odd">
      <td class="c">3rd</td>
      <td class="r">&#160;</td>
      <td class="r">&#160;</td>
      <td class="r">10%</td>
      <td class="r">10%</td>
      <td class="r">10%</td>
   </tr>
   <tr class="even">
      <td class="c">4th</td>
      <td class="r">&#160;</td>
      <td class="r">&#160;</td>
      <td class="r">&#160;</td>
      <td class="r">8%</td>
      <td class="r">8%</td>
   </tr>
   <tr class="odd">
      <td class="c">5th</td>
      <td class="r">&#160;</td>
      <td class="r">&#160;</td>
      <td class="r">&#160;</td>
      <td class="r">&#160;</td>
      <td class="r">6%</td>
   </tr>
</tbody>
</table>
</div>
<br /><br />
If more than five (5) submissions pass review, the competitors who place in 6th position or below will not receive any placement points. 
<br /><br />
Up to 100% of placement points may be deducted for bugs or late final fixes. 20% of a placement point will be deducted for every (24) hours a final fix or component forum issue is late. On a case-by-case basis, as determined by TopCoder staff, additional placement points may be deducted for bugs found in components within 30 days of completion.
<br /><br />

    </div>
</div>

<jsp:include page="../../foot.jsp" />

</body>

</html>