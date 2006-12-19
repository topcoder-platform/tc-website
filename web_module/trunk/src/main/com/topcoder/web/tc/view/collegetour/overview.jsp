<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% Map conf = (Map)request.getAttribute(Constants.COLLEGE_TOUR_CONFIG_INFO);%>
<html>
<head>
    <title>TopCoder College Tour</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180"><jsp:include page="/includes/global_left.jsp">
<jsp:param name="node" value="m_competitions"/>
</jsp:include>
</td>
        <!-- Left Column Ends -->

        <!-- Center Column Begins -->
        <td class="cardCell" width="100%" align="center">
            <div class="myTCBody">

                <jsp:include page="../page_title.jsp">
                    <jsp:param name="image" value="college_tour"/>
                    <jsp:param name="title" value="Overview"/>
                </jsp:include>

                <div align=center>
                    <tc-webtag:sponsorImage image="image" alt="College Logo" border="0"/>
                </div>

                <!-- college tour site subnav -->
                <p align="center">
                    Overview&#160;&#160;|&#160;&#160;
                    <A href="/tc?module=CollegeTourInfo&<%=Constants.COLLEGE_TOUR_EVENT_ID%>=<%=request.getAttribute(Constants.COLLEGE_TOUR_EVENT_ID)%>">Instructions</A>&#160;&#160;|&#160;&#160;
                    <a href="/tc?module=CollegeTourViewReg&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=<%=request.getAttribute(Constants.COLLEGE_TOUR_EVENT_ID)%>">Registration</A>&#160;&#160;|&#160;&#160;
                    <a href="/tc?module=CollegeTourRegistrants&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=<%=request.getAttribute(Constants.COLLEGE_TOUR_EVENT_ID)%>">Registrants</A>&#160;&#160;|&#160;&#160;
                    <% if (request.getAttribute(Constants.FORUM_ID)!=null) {%>
                    <tc-webtag:forumLink forumID="<%=Long.parseLong((String)request.getAttribute(Constants.FORUM_ID))%>" message="Discuss College Tour"/>
                    <% } %>
                </p>

                <!-- ends -->

                <% if ("22".equals(request.getAttribute(Constants.COLLEGE_TOUR_EVENT_ID))) { %>
                <p>
                    <h2>TopCoder College Tour SRM Overview</h2>
<br />
                    <h3>The Event</h3>
                    TopCoder is sponsoring an onsite programming competition at <%=request.getAttribute(Constants.SCHOOL_NAME)%>
                    on <tc-webtag:format object="<%=conf.get(new Integer(Constants.ROUND_START_PROP_ID))%>" format="MM.dd.yyyy"/>. <br/><br/>

                    <span class="bigRed">Registration for this event ends on <tc-webtag:format object="<%=request.getAttribute("regEnd")%>" format="MM.dd.yyyy"/>.</span><br/>
                    <br/>

                    The event is from <tc-webtag:format object="<%=conf.get(new Integer(Constants.EVENT_START_PROP_ID))%>" format="hh:mm a z" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/>
                    until <tc-webtag:format object="<%=conf.get(new Integer(Constants.EVENT_END_PROP_ID))%>" format="hh:mm a z" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/> in
                    the <%=conf.get(new Integer(Constants.LOCATION_PROP_ID))%>. This event is being run in conjunction
                    with <A href="/tc?module=MatchDetails&rd=<%=request.getAttribute(Constants.ROUND_ID)%>"><%=request.getAttribute(Constants.ROUND_NAME)%></A>.
                    In addition to registering with TopCoder, all competitors must register
                    <a href="/tc?module=CollegeTourViewReg&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=<%=request.getAttribute(Constants.COLLEGE_TOUR_EVENT_ID)%>">here</a>.

                    <br />

                    <h3>Prizes</h3>

                    <p>
                        The top 50 scorers will advance to the SRM on 12/13 at 10:00 AM China Time (9:00 PM EST)
                        The top performers on 12/13 will win the following:
                    </p>
                    <ul>
                        <% if (conf.containsKey(new Integer(Constants.FIRST_PLACE_PROP_ID))) {%>
                        <li>1st place prize - <%=conf.get(new Integer(Constants.FIRST_PLACE_PROP_ID))%></li>
                        <% } %>
                        <% if (conf.containsKey(new Integer(Constants.SECOND_PLACE_PROP_ID))) {%>
                        <li>2nd place prize - <%=conf.get(new Integer(Constants.SECOND_PLACE_PROP_ID))%></li>
                        <% } %>
                        <% if (conf.containsKey(new Integer(Constants.THIRD_PLACE_PROP_ID))) {%>
                        <li>3rd place prize - <%=conf.get(new Integer(Constants.THIRD_PLACE_PROP_ID))%></li>
                        <% } %>
                    </ul><br/>

                    All competitors will receive a TopCoder t-shirt. Placement in the SRM will be determined by the
                    total number of points at the conclusion of the SRM. The competitor with the highest total positive
                    (i.e., greater than zero) points will finish in 1st place. The overall winner will receive the 1st
                    place prize, the 2nd place finisher will receive the 2nd place prize, and the 3rd place finisher
                    will receive the 3rd place prize.

      <br />
                    <h3>Event Schedule</h3>

                    The timeline for the day of the event:
                    <ul>
                        <li><tc-webtag:format object="<%=conf.get(new Integer(Constants.EVENT_START_PROP_ID))%>" format="hh:mm a z" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/> - Computer lab opens & competitors set up </li>
                        <li><tc-webtag:format object="<%=conf.get(new Integer(Constants.ROUND_START_PROP_ID))%>" format="hh:mm a z" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/> - Competition starts </li>
                        <li><tc-webtag:format object="<%=conf.get(new Integer(Constants.ROUND_END_PROP_ID))%>" format="hh:mm a z" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/> - Competition ends </li>
                    </ul><br/>

                    <strong><%=conf.get(new Integer(Constants.RECRUITER_NAME_PROP_ID))%></strong>, a TopCoder representative, will be present to explain the TopCoder
                    algorithm, design and development competitions, TopCoder Employment Services, and other aspects of
                    TopCoder.

                    <br/><br/>
                </p>
                <% } else { %>
                <p>
                    <h2>TopCoder College Tour SRM Overview</h2>

                    <br />
                    <h3>The Event</h3>
                    TopCoder is sponsoring an onsite programming competition at <%=request.getAttribute(Constants.SCHOOL_NAME)%>
                    on <tc-webtag:format object="<%=conf.get(new Integer(Constants.ROUND_START_PROP_ID))%>" format="MM.dd.yyyy" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/>. <br/><br/>

                    <span class="bigRed">Registration for this event ends on <tc-webtag:format object="<%=request.getAttribute("regEnd")%>" format="MM.dd.yyyy" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/>.</span><br/>
                    <br/>

                    The event is from <tc-webtag:format object="<%=conf.get(new Integer(Constants.EVENT_START_PROP_ID))%>" format="hh:mm a z" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/>
                    until <tc-webtag:format object="<%=conf.get(new Integer(Constants.EVENT_END_PROP_ID))%>" format="hh:mm a z" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/> in
                    the <%=conf.get(new Integer(Constants.LOCATION_PROP_ID))%>. This event is being run in conjunction
                    with <A href="/tc?module=MatchDetails&rd=<%=request.getAttribute(Constants.ROUND_ID)%>"><%=request.getAttribute(Constants.ROUND_NAME)%></A>.
                    In addition to registering with TopCoder, all competitors must register
                    <a href="/tc?module=CollegeTourViewReg&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=<%=request.getAttribute(Constants.COLLEGE_TOUR_EVENT_ID)%>">here</a> and be onsite for the competition.
                    After the event ends, pizza will be served and a TopCoder representative will be present to discuss
                    TopCoder competitions and employment services.

                    <br /><h3>Prizes</h3>

                    <ul>
                        <% if (conf.containsKey(new Integer(Constants.FIRST_PLACE_PROP_ID))) {%>
                        <li>1st place prize - <%=conf.get(new Integer(Constants.FIRST_PLACE_PROP_ID))%></li>
                        <% } %>
                        <% if (conf.containsKey(new Integer(Constants.SECOND_PLACE_PROP_ID))) {%>
                        <li>2nd place prize - <%=conf.get(new Integer(Constants.SECOND_PLACE_PROP_ID))%></li>
                        <% } %>
                        <% if (conf.containsKey(new Integer(Constants.THIRD_PLACE_PROP_ID))) {%>
                        <li>3rd place prize - <%=conf.get(new Integer(Constants.THIRD_PLACE_PROP_ID))%></li>
                        <% } %>
                    </ul><br/>

                    All competitors will receive a TopCoder t-shirt. Placement in the SRM will be determined by the
                    total number of points at the conclusion of the SRM. The competitor with the highest total positive
                    (i.e., greater than zero) points will finish in 1st place. The overall winner will receive the 1st
                    place prize, the 2nd place finisher will receive the 2nd place prize, and the 3rd place finisher
                    will receive the 3rd place prize.

                    <br /><h3>Event Schedule</h3>

                    The timeline for the day of the event:
                    <ul>
                        <li><tc-webtag:format object="<%=conf.get(new Integer(Constants.EVENT_START_PROP_ID))%>" format="hh:mm a z" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/> - Computer lab opens & competitors set up </li>
                        <li><tc-webtag:format object="<%=conf.get(new Integer(Constants.ROUND_START_PROP_ID))%>" format="hh:mm a z" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/> - Competition starts </li>
                        <li><tc-webtag:format object="<%=conf.get(new Integer(Constants.ROUND_END_PROP_ID))%>" format="hh:mm a z" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/> - Competition ends </li>
                        <li><tc-webtag:format object="<%=conf.get(new Integer(Constants.RESULTS_PROP_ID))%>" format="hh:mm a z" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/> - Pizza, Results, TopCoder presentation </li>
                    </ul><br/>

                    <strong><%=conf.get(new Integer(Constants.RECRUITER_NAME_PROP_ID))%></strong>, a TopCoder representative, will be present to explain the TopCoder
                    algorithm, design and development competitions, TopCoder Employment Services, and other aspects of
                    TopCoder.

                    <br/><br/>
                </p>
                <% } %>

            </div>

        </td>
        <!-- Center Column Ends -->

        <!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
        </td>
        <!-- Right Column Ends -->

        <!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
        <!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>
