<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder College Tour</title>

    <jsp:include page="../script.jsp"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>

</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value=""/>
                <jsp:param name="level2" value=""/>
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
                    <A href="/tc?module=CollegeTourOverview&<%=Constants.COLLEGE_TOUR_EVENT_ID%>=<%=request.getParameter(Constants.COLLEGE_TOUR_EVENT_ID)%>">Overview</A>&#160;&#160;|&#160;&#160;
                    <A href="/tc?module=CollegeTourInfo&<%=Constants.COLLEGE_TOUR_EVENT_ID%>=<%=request.getParameter(Constants.COLLEGE_TOUR_EVENT_ID)%>">Instructions</A>&#160;&#160;|&#160;&#160;
                    Registration&#160;&#160;|&#160;&#160;
                    <A href="/tc?module=CollegeTourRegistrants&<%=Constants.COLLEGE_TOUR_EVENT_ID%>=<%=request.getParameter(Constants.COLLEGE_TOUR_EVENT_ID)%>">Registrants</A>&#160;&#160;|&#160;&#160;
                    <% if (request.getParameter(Constants.FORUM_ID)!=null) {%>
                    <tc-webtag:forumLink forumID="<%=Long.parseLong(request.getParameter(Constants.FORUM_ID))%>" message="Discuss College Tour"/>
                    <% } %>
                </p>
                <!-- ends -->

                <p>Click <a href="/tc?module=CollegeTourReg&<%=Constants.COLLEGE_TOUR_EVENT_ID%>=<%=request.getParameter(Constants.COLLEGE_TOUR_EVENT_ID)%>">here</a> to register for the TopCoder College Tour event at your school.</p>


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
