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
    <h2>TopCoder College Tour SRM Overview</h2>

    <br>

    <h3>The Event</h3>
    TopCoder is sponsoring an onsite programming competition at ${mainEvent.school.name} on
    <tc-webtag:format object="${roundStart}" format="EEEE MM.dd.yyyy" timeZone="${mainEvent.timeZone.description}"/>. <br><br>

    <span class="bigRed">Registration for this event ends on <tc-webtag:format object="${event.registrationEnd}" format="EEEE MM.dd.yyyy hh:mm a z" timeZone="${mainEvent.timeZone.description}"/>.</span><br>
    <br>
    
    The event is from
    <tc-webtag:format object="${eventStart}" format="hh:mm a z" timeZone="${mainEvent.timeZone.description}"/>
    until
    <tc-webtag:format object="${eventEnd}" format="hh:mm a z" timeZone="${mainEvent.timeZone.description}"/>
    in
     ${mainEvent.location}. This event is being run in conjunction
    with
    <A href="/tc?module=MatchDetails&rd=${mainEvent.roundId}">${contestName}
    </A>.
    In addition to <A href="/reg/">registering with TopCoder</A>, all competitors must register
    <a href="/tc?module=IntroEventViewRegister&eid=${eid}">here</a>
    and be onsite for the competition.

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
        <%--
            <li>Best Female Performer - 1 GB MP4 Player
            </li>
            <li>Event Organizer - 1 GB MP4 Player
            </li>
        --%>
    </ul>

    All competitors will receive a TopCoder t-shirt. Placement in the SRM will be determined by the
    total number of points at the conclusion of the SRM. The competitor with the highest total positive
    (i.e., greater than zero) points will finish in 1st place. The overall winner will receive the 1st
    place prize, the 2nd place finisher will receive the 2nd place prize, and the 3rd place finisher
    will receive the 3rd place prize.
    
    <br /><br />
    
    <h3>Participating Schools</h3>
    Peking University<br />
    Tsinghua University<br />
    Beihang University<br />
    Beijing Institute of Technology<br />
    Beijing Normal University<br />
    Beijing University of Post and Telecommunications<br />
    Beijing Jiaotong University<br />
    Renmin University of China<br />
    China Agricultural University<br />
    Communication University of China<br />
    University of Science and Technology Beijing<br />
    Beijing Information Science and Technology<br />
    Beijing Forestry University<br />
    China University of Mining and Technology,Beijing<br />
    China University of Geosciences<br />
    Beijing University of Technology<br />
    Beijing University of Chemical Technology
    
    <br /><br />
    
    <h3>Co-host Schools</h3>
    Peking University<br />
    Tsinghua University<br />
    Beihang University<br />
    Beijing Institute of Technology<br />
    Beijing Normal University<br />
    Beijing University of Post and Telecommunications<br />
    Beijing Jiaotong University<br />
    Renmin University of China<br />
    China Agricultural University<br />
    Communication University of China<br />
    University of Science and Technology Beijing<br />
    Beijing Information Science and Technology<br />
    Beijing Forestry University<br />
    China University of Mining and Technology,Beijing<br />
    China University of Geosciences<br />
    Beijing University of Technology<br />
    Beijing University of Chemical Technology

    <br><br>

    <h3>Event Schedule</h3>

    The timeline for the day of the event:
    <ul>
        <li>
            <tc-webtag:format object="${eventStart}" format="hh:mm a z" timeZone="${mainEvent.timeZone.description}"/>
            - Computer lab opens &amp; competitors set up
        </li>
        <li>
            <tc-webtag:format object="${roundStart}" format="hh:mm a z" timeZone="${mainEvent.timeZone.description}"/>
            - Competition starts
        </li>
        <li>
            <tc-webtag:format object="${sysTestEnd}" format="hh:mm a z" timeZone="${mainEvent.timeZone.description}"/>
            - Competition ends
        </li>
        <li>
            <tc-webtag:format object="${resultsTime}" format="hh:mm a z" timeZone="${mainEvent.timeZone.description}"/>
            - Food &amp; TopCoder presentation
        </li>
    </ul>

    <strong>${mainEvent.recruiterName }</strong> will give a presentation to explain the benefits of TopCoder membership and competition.
    <a href="/download/misc/College_Tour_Presentation.ppt">The presentation</a> is available for download.

    <br><br>
<%--
    <h3>Lecture Schedule</h3>

    <c:set var="lectureDate" value="<%=IntroEventConfig.LECTURE_DATE%>"/>
    <c:set var="lectureStartTime" value="<%=IntroEventConfig.LECTURE_START_TIME%>"/>
    <c:set var="lectureEndTime" value="<%=IntroEventConfig.LECTURE_END_TIME%>"/>
    <c:set var="lectureLocation" value="<%=IntroEventConfig.LECTURE_LOCATION%>"/>

    TopCoder is also sponsoring a lecture at ${mainEvent.school.name} on ${mainEvent.config[lectureDate].value}.  The lecture is from ${mainEvent.config[lectureStartTime].value} until ${mainEvent.config[lectureEndTime].value} in ${mainEvent.config[lectureLocation].value}.

    <br><br>
    --%>
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
