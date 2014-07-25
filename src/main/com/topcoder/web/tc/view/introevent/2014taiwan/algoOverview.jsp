<%@ page import="com.topcoder.web.common.model.IntroEventConfig" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder College Tour</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

</head>

<body>

<jsp:include page="../../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="m_competitions"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">
<div class="fixedWidthBody">

<jsp:include page="../../page_title.jsp">
    <jsp:param name="image" value="college_tour"/>
    <jsp:param name="title" value="Overview"/>
</jsp:include>

<div align="center">
    <tc-webtag:sponsorImage image="image" alt="College Logo" border="0"/>
</div>

<!-- college tour site subnav -->
<jsp:include page="topMenu.jsp">
    <jsp:param name="active" value="algo_overview"/>
</jsp:include>

<!-- ends -->

<p>
    <div align="center"><a href="/tc?module=CollegeTourDescription"><img src="/i/collegetour/seeOtherEvents.png" /></a></div>
    <h2>2014 [topcoder] Taiwan Programming Competition</h2>

    <br>

    <h3>The Event</h3>
    [topcoder] is sponsoring a programming competition on Monday 07.28 2014 2:30pm CST (China Standard Time) UTC/GMT +8 hours.<br><br>

    <span class="bigRed">Registration for this event is from Friday 07.18 2014 2:30pm CST (China Standard Time) to Monday 07.28 2014 2:30pm CST (China Standard Time).</span><br>
    <br>
    
    All members registered as Taiwan will be eligible to compete.
    <br><br>

    <h3>Prizes</h3>

    <ul>
            <li>1st place finisher will win an iPad mini Retina.
            </li>

            <li>2nd place from will win an iPad mini Retina.
            </li>


            <li>3rd place from will win an iPad mini Retina.
            </li>

            <li>All registrants will receive a Maxwell-topcoder t-shirt.
            </li>

    </ul>

    <br /><br />
    

    <h3>Event Schedule</h3>

    [1] National Chiao Tung University<br/>
    <table style="border-collapse:separate;border-spacing:20px 10px;">
      <tr>
        <td rowspan="3">July 28th</td><td>13:00-14:00</td><td>[topcoder] Lecture, Engineering Building 3, Room 115</td>
      </tr>
      <tr>
        <td>14:00-16:00</td><td>Competition, Engineering Building 3, Room 330</td>
      </tr>
      <tr>
        <td>16:30-17:00</td><td>Award Ceremony, Engineering Building 3, Room 115</td>
      </tr>
    </table>
    <br/>

    [2] National Taiwan University<br/>
    <table style="border-collapse:separate;border-spacing:20px 10px;">
      <tr>
        <td rowspan="3">July 28th</td><td>13:00-14:00</td><td>[topcoder] Lecture</td>
      </tr>
      <tr>
        <td>14:00-16:00</td><td>Competition</td>
      </tr>
      <tr>
        <td>16:30-17:00</td><td>Award Ceremony</td>
      </tr>
    </table>

</p>


</div>

</td>
<!-- Center Column Ends -->

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

<jsp:include page="../../foot.jsp"/>

</body>

</html>
