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
    <h2>TopCoder College Tour SRM Overview</h2>
    
    <span class="bigRed">This event has been cancelled.  Thank you to everyone who registered.</span>

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
    After the event ends, food will be served and a TopCoder representative will be present to discuss
    TopCoder competitions and employment services.

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

    All competitors will receive a TopCoder t-shirt. Placement in the SRM will be determined by the
    total number of points at the conclusion of the SRM. The competitor with the highest total positive
    (i.e., greater than zero) points will finish in 1st place. The overall winner will receive the 1st
    place prize, the 2nd place finisher will receive the 2nd place prize, and the 3rd place finisher
    will receive the 3rd place prize.

    <br><br>

    <h3>Event Schedule</h3>

    <c:set var="eventStartId" value="<%=IntroEventConfig.EVENT_START_PROP_ID%>"/>
    <c:set var="resultsId" value="<%=IntroEventConfig.RESULTS_PROP_ID%>"/>
    <c:set var="foodId" value="<%=IntroEventConfig.FOOD_PROP_ID%>"/>
    <c:set var="presentationId" value="<%=IntroEventConfig.PRESENTATION_PROP_ID%>"/>
    <c:set var="prizesId" value="<%=IntroEventConfig.PRIZES_PROP_ID%>"/>
    <c:set var="foodPresentationId" value="<%=IntroEventConfig.FOOD_PRESENTATION_PROP_ID%>"/>
    <c:set var="roundStartId" value="<%=AlgoOverview.ROUND_START_ID%>"/>
    <c:set var="sysTestEndId" value="<%=AlgoOverview.SYS_TEST_END_ID%>"/>



    The timeline for the day of the event:
    <ul>
        <c:forEach items="${schedule}" var="schedItem">

            <c:choose>
                <c:when test="${schedItem.a==eventStartId}">
                    <li>
                    <tc-webtag:format object="${schedItem.b}" format="hh:mm a z" timeZone="${mainEvent.timeZone.description}"/>
                    - Computer lab opens &amp; competitors set up
                    </li>
                </c:when>
                <c:when test="${schedItem.a==roundStartId}">
                    <li>
                    <tc-webtag:format object="${schedItem.b}" format="hh:mm a z" timeZone="${mainEvent.timeZone.description}"/>
                    - Competition starts
                    </li>
                </c:when>
                <c:when test="${schedItem.a==sysTestEndId}">
                    <li>
                    <tc-webtag:format object="${schedItem.b}" format="hh:mm a z" timeZone="${mainEvent.timeZone.description}"/>
                    - Competition ends
                    </li>
                </c:when>
                <c:when test="${schedItem.a==foodPresentationId}">
                    <li>
                    <tc-webtag:format object="${schedItem.b}" format="hh:mm a z" timeZone="${mainEvent.timeZone.description}"/>
                    - Food &amp; TopCoder presentation
                    </li>
                </c:when>
                <c:when test="${schedItem.a==resultsId}">
                    <li>
                    <tc-webtag:format object="${schedItem.b}" format="hh:mm a z" timeZone="${mainEvent.timeZone.description}"/>
                    - Food &amp; TopCoder presentation
                    </li>
                </c:when>
                <c:when test="${schedItem.a==presentationId}">
                    <li>
                    <tc-webtag:format object="${schedItem.b}" format="hh:mm a z" timeZone="${mainEvent.timeZone.description}"/>
                    - TopCoder presentation
                    </li>
                </c:when>
                <c:when test="${schedItem.a==foodId}">
                    <li>
                    <tc-webtag:format object="${schedItem.b}" format="hh:mm a z" timeZone="${mainEvent.timeZone.description}"/>
                    - Food
                    </li>
                </c:when>
                <c:when test="${schedItem.a==prizesId}">
                    <li>
                    <tc-webtag:format object="${schedItem.b}" format="hh:mm a z" timeZone="${mainEvent.timeZone.description}"/>
                    - Prizes
                        </li>
                </c:when>
            </c:choose>

        </c:forEach>
    </ul>


    <strong>${mainEvent.recruiterName }</strong> will give a presentation to explain the benefits of TopCoder membership and competition.
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
