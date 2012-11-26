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
    TopCoder is sponsoring an online programming competition from Wednesday 05.16 2012 11:59 PM EDT until Thursday 05.31 2012 11:59 PM EDT.
    <br><br>

    <span class="bigRed">Registration for this event is from Wednesday 05.16 2012 11:59 PM EDT until Thursday 05.31 2012 11:59 PM EDT.</span><br>
    <br>
    
    TopCoder representative will present at some sites to discuss TopCoder competitions and employment services.

    <br><br>

    <h3>Prizes</h3>

    <ul>
            <li>1 TCAP Champion - 1st place finisher will win an all expense paid trip to TopCoder Open 2012 in Orlando.
            Please refer to the <a href="http://community.topcoder.com/tco12">TCO 12 website</a> for visa and travel requirements.
            </li>
            <li>10 Calabi-Yau Daily Champions<sup>*</sup> - Competitors with highest provisional ranks during the last 10 days will
            receive a Calabi-Yau Manifold Glass Sculpture. The champions are selected 216 hours prior to contest end time, and every 24
            hours after that. If at that time a competitor has already received the daily champion in the prior days the next
            best competitor will be selected. If there is a tie for the highest provisional rank, the competitor having the earliest last
            submission time will be selected among all tied competitors.
            </li>
            <li>1000 Top Performers<sup>*</sup> - Up to 1000 competitors with highest final ranks will receive an English copy of
            book "The Shape of Inner Space: String Theory and the Geometry of the Universe's Hidden Dimensions" authored by Shing-Tung Yau.
            </li>
    </ul>

    The champion, Calabi-Yau prize winners and Top Performers will receive a certificate<sup>*</sup> indicating the prize and rank in 2012 TopCoder
    Asia-Pacific competition among 400,000+ (up to date) TopCoder members.
    Placement in the marathon competition will be determined by the total number of points at the conclusion of the marathon competition.

    <br><br>

	<sup>*</sup> Daily Champion and Top Performer prizes and certificates are only distributed in mainland China. Winners residing out of this
    region may request their prizes and certificates to be picked up onsite TopCoder Open 2012 at Caribe Royale, Orlando. In the case a
    prize is unable to be claimed it will not be given to the next place. In order to receive any prize or certificate, your final score
    needs to be strictly positive (i.e., not zero).
    <br><br>

    <h3>Event Schedule</h3>

    The timeline for the day of the event: Yingying Wu and Jiazhi Wu will give a presentation to explain the benefits of TopCoder membership and competition.

    <br><br>

    <h3>Forum</h3>

    Please visit Marathon Match Discussion Forum for 2012 TopCoder Asia-Pacific Programming Competition <a href="http://apps.topcoder.com/forums/?module=Thread&threadID=746187&start=0">here</a> for discussions and questions about this event, as well as topics pertaining to TopCoder's Marathon Matches, such as strategy and competition formats.

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
