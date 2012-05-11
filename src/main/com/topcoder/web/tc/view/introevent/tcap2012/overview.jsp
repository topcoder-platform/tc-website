<%@ page import="com.topcoder.web.common.model.IntroEventConfig" %>
<%@ page import="com.topcoder.web.tc.controller.request.introevent.AlgoOverview" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder College Tour</title>

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

<div align="center">
    <img src="/i/introevent/Calabi-YauSpaceLogo.jpg" border="0" />
</div>

<!-- ends -->

<p>
    <h2>2012 TopCoder Asia-Pacific Programming Competition Overview</h2>

    <br>

    <h3>The Event</h3>
    TopCoder is sponsoring an onsite programming competition from Wednesday 05.16 2012 11:59 PM CST until Thursday 05.31 2012 11:59 PM CST.
    <br><br>

    <span class="bigRed">Registration for this event is from Wednesday 05.16 2012 11:59 PM CST until Thursday 05.31 2012 11:59 PM CST.</span><br>
    <br>
    
    TopCoder representative will present at some sites to discuss TopCoder competitions and employment services.

    <br><br>

    <h3>Prizes</h3>

    <ul>
            <li>1st place prize - Trip to TopCoder Open 2012 in Orlando
            </li>
            <li>Calabi-Yau prize - Calabi-Yau Crystal Model with illumination will be awarded for the last 10 Daily Champion
            </li>
            <li>Top Performers - The Shape of Inner Space for the first 1,000 place
            </li>
    </ul>

    The champion, Calabi-Yau prize winners and Top Performers will receive a certificate indicating the prize and rank in 2012 TopCoder Asia-Pacific competition among 400,000+(up to date) TopCoder members.
    Placement in the marathon competition will be determined by the total number of points at the conclusion of the marathon competition.
    The competitor with the highest total positive (i.e., greater than zero) points will finish in 1st place.
    The overall winner will receive the 1st place prize, the 2nd place finisher will receive the 2nd place prize, and the 3rd place finisher will receive the 3rd place prize.

    <br><br>

    <h3>Event Schedule</h3>


    The timeline for the day of the event: Yingying Wu and Jiazhi Wu will give a presentation to explain the benefits of TopCoder membership and competition.

    <br><br>
    
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
