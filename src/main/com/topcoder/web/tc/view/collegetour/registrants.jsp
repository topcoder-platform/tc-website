<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% ResultSetContainer registrants = (ResultSetContainer) request.getAttribute("registrants"); %>
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
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_competitions"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Center Column Begins -->
        <td class="cardCell" width="100%" align="center">
            <div class="myTCBody">


                <jsp:include page="../page_title.jsp">
                    <jsp:param name="image" value="college_tour"/>
                    <jsp:param name="title" value="Registrants"/>
                </jsp:include>


                <div align=center>
                    <tc-webtag:sponsorImage image="image" alt="College Logo" border="0"/>
                </div>


                <!-- college tour site subnav -->
                <p align="center">
                    <c:choose>
                        <c:when test="${cteid==41}">
                            <A href="/tc?module=Static&d1=collegetour&d2=multischool&d3=belarus">Overview</A> |
                            <A href="/tc?module=Static&d1=collegetour&d2=multischool&d3=belarusInstructions">Instructions</A>
                            |
                        </c:when>
                        <c:otherwise>
                            <A href="/tc?module=CollegeTourOverview&<%=Constants.COLLEGE_TOUR_EVENT_ID%>=<%=request.getAttribute(Constants.COLLEGE_TOUR_EVENT_ID)%>">Overview</A> | 
                            <A href="/tc?module=CollegeTourInfo&<%=Constants.COLLEGE_TOUR_EVENT_ID%>=<%=request.getAttribute(Constants.COLLEGE_TOUR_EVENT_ID)%>">Instructions</A> | 
                        </c:otherwise>
                    </c:choose>
                    <a href="/tc?module=CollegeTourViewReg&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=<%=request.getAttribute(Constants.COLLEGE_TOUR_EVENT_ID)%>">Registration</A> | 
                    Registrants | 
                    <% if (request.getAttribute(Constants.FORUM_ID) != null) {%>
                    <tc-webtag:forumLink forumID="<%=Long.parseLong((String)request.getAttribute(Constants.FORUM_ID))%>" message="Discuss College Tour"/>
                    <% } %>
                    <c:choose>
                        <c:when test="${cteid==42}">
                            | <A href="/tc?module=Static&d1=collegetour&d2=belgradeCompInfo">Component Information</A>
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                    </c:choose>

                </p>
                <!-- ends -->


                <div align="center">
                    <div style="width: 150px; text-align: left;" class="bodyText">
                        <span class="bodySubtitle">Registrants: <%=registrants.size()%></span><br><br>
                        <% if (!registrants.isEmpty()) {%><strong>Handle</strong><br><% } %>
                        <rsc:iterator list="<%=registrants%>" id="resultRow">
                            <tc-webtag:handle coderId='<%= resultRow.getLongItem("coder_id")%>' context='algorithm'/>
                            <br>
                        </rsc:iterator>
                    </div>
                </div>
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
