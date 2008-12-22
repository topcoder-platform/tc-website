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
    <h2>TopCoder College Tour SRM Overview</h2>

    <br>

    <h3>The Event</h3>
    TopCoder is sponsoring an onsite programming competition at 
    Moscow State Lomonosov University and Moscow Institute of Physics and Technology
    on
    Thursday 10.04.2007.
    <br><br>

    <span class="bigRed">Registration for this event ends on 
    Wednesday 10.03.2007 11:59 PM UTC +4.
    </span><br>
    <br>
    
    The event will take place on each campus from
    02:30 PM UTC +4
    until
    05:00 PM UTC +4
    in
     ${mainEvent.location}. This event is being run in conjunction
    with
    <A href="/tc?module=MatchDetails&rd=10785">Single Round Match 369</A>.
    In addition to <A href="/reg/">registering with TopCoder</A>, all competitors must register
    <a href="/tc?module=IntroEventViewRegister&eid=${eid}">here</a>
    and be onsite for the competition.
    In addition to the programming contest, TopCoder will provide food and give a presentation on the benefits of TopCoder membership.

    <br><br>

    <h3>Prizes</h3>

    <ul>
        <c:if test="${not empty mainEvent.firstPlacePrize }">
            <li>1st place prize - ${mainEvent.firstPlacePrize}
            </li>
        </c:if>
        <c:if test="${not empty mainEvent.secondPlacePrize }">
            <li>2nd place prize - ${mainEvent.secondPlacePrize}
            </li>
        </c:if>
        <c:if test="${not empty mainEvent.thirdPlacePrize }">
            <li>3rd place prize - ${mainEvent.thirdPlacePrize}
            </li>
        </c:if>
    </ul>

    NOTE: Each school will compete for its own set of prizes.
    <br /><br />
    All competitors will receive a TopCoder t-shirt. Placement in the SRM will be determined by the
    total number of points at the conclusion of the SRM. The competitor with the highest total positive
    (i.e., greater than zero) points will finish in 1st place. The overall winner will receive the 1st
    place prize, the 2nd place finisher will receive the 2nd place prize, and the 3rd place finisher
    will receive the 3rd place prize.

    <br><br>

    <h3>Event Schedule</h3>

    The timeline for the day of the event:
    <ul>
        <li>
            01:00 PM
            - TopCoder Presentation
        </li>
        <li>
            02:30 PM
            - Computer lab opens & competitors set up
        </li>
        <li>
            03:00 PM
            - Competition starts
        </li>
        <li>
            04:35 PM
            - Competition ends
        </li>
        <li>
            04:40 PM
            - Food
        </li>
        <li>
            05:30 PM
            - Preliminary results
        </li>
    </ul>

    Final results will be announced and prizes will be distributed on the day following the event.
    <br /><br />
    <strong>Lena Nosova</strong> will give a presentation to explain the benefits of TopCoder membership and competition.
    <a href="/download/misc/College_Tour_Presentation.ppt">The presentation</a> is available for download.

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
