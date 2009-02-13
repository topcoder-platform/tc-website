<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% ResultSetContainer list = (ResultSetContainer) request.getAttribute("list"); %>
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
        <td class="cardCell" width="100%" align="center">
            <div class="myTCBody">

                <div align=center>
                    <img src="/i/collegetour/banner.jpg" alt="Competition, evolved." border=0 clear="all">
                </div>

                <p>
                    <h2 align="center">2006-2007 TopCoder College Tour</h2>
                    <br/><br/>
                    <%--
                                        <p align="center"><a href="#schools">Participating schools</a></p>
                    --%>

                    <h3>Is your school on the schedule?</h3>

                    TopCoder will be touring the college campuses during the remainder of 2006 and early 2007 to promote
                    TopCoder competitions, both Component and Algorithm, and to grow membership. We're looking for
                    collegiate CS students who are interested in hosting TopCoder on campus for an evening of problem
                    solving, food, prizes and fun.

                    <br/><br/>

                    <h3>How will the College Tour work?</h3>
                    Each selected campus will receive a visit from TopCoder during a regularly scheduled SRM
                    (<strong>S</strong>ingle <strong>R</strong>ound <strong>M</strong>atch). TopCoder
                    will provide a private registration path for each campus prior to the SRM. At the time of the SRM,
                    the registered students will gather in a computer lab and compete in their own virtual room during
                    the SRM,
                    with everyone solving the same Division II problems. Everyone who registers and attends the SRM will
                    receive a
                    TopCoder t-shirt and the top three performers will receive other great prizes. TopCoder will also
                    provide food
                    and beverages for all in attendance.
                    <br/><br/>
                    Prior to the SRM, TopCoder will provide the school with a web page dedicated to their event, to be
                    used for promotional and informational purposes. Additionally, TopCoder will provide flyers to be
                    printed and hung around campus to attract attention.
                    <br/><br/>
                    At the conclusion of the SRM, TopCoder representatives will talk about the benefits of being
                    involved with TopCoder:

                    <ul>
                        <li><strong>Component Design & Development:</strong> Learn how building software happens under
                            TopCoder's competitive model.
                        </li>
                        <li><strong>SRMs:</strong> Win cash prizes and chat before the competition with sponsors
                            interested in hiring TopCoder members
                        </li>
                        <li><strong>TopCoder Software:</strong> Consulting and full-time employment possibilities.</li>
                        <li><strong>TopCoder Employment Services:</strong> Learn how the leading technology companies -
                            Google, Yahoo, Microsoft, National Security Agency, Sun Microsystems, NVIDIA, VeriSign,
                            Motorola, etc. - hire elite talent and what positions there are available.
                        </li>
                        <li><strong>TopCoder tournaments - TopCoder Open & TopCoder Collegiate Challenge:</strong> Win
                            huge cash prizes, major recognition, and an all-expenses paid trip to the onsite finals with
                            other top-notch programmers from around the world.
                        </li>
                        <li><strong>TopCoder Studio:</strong> Learn about TopCoder's newest competition for Graphic
                            Designers and artists.
                        </li>
                    </ul>
                    <br/>

                    Interested in coordinating this event at your school? Contact
                    <A href="mailto:collegetour@topcoder.com">collegetour@topcoder.com</a> today!

                    <br/><br/>
                    <% if (request.getAttribute(Constants.FORUM_ID) != null) {%>
                    <tc-webtag:forumLink forumID="<%=Long.parseLong((String)request.getAttribute(Constants.FORUM_ID))%>"
                                         message="Discuss College Tour"/>
                    <% } %>
                </p>

                <a name="schools"></a>
                <rsc:iterator list="<%=list%>" id="resultRow">
                    <div align="center" style="padding: 20px;">
                        <div align="center" style="width: 100px; border-bottom: 1px solid #999999; padding-bottom: 4px; margin-bottom: 10px;">
                        <strong><rsc:item name="start_time" row="<%=resultRow%>" format="MM.dd.yyyy"/></strong>
                        </div>
                        <img src="<rsc:item name="image_path" row="<%=resultRow%>"/>"
                             alt="<rsc:item name="event_name" row="<%=resultRow%>"/>" border="0"/>
                    </div>
                </rsc:iterator>
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
