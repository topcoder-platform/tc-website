<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page language="java" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% ResultSetContainer registrants = (ResultSetContainer) request.getAttribute("registrants"); %>
<html>
<head>
    <title>TopCoder College Tour</title>

    <jsp:include page="../script.jsp"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>

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
                    <jsp:param name="title" value="Registrants"/>
                </jsp:include>


                <div align=center>
                <tc-webtag:sponsorImage image="image" alt="College Logo" border="0"/>
                </div>


                <!-- college tour site subnav -->
                <p align="center">
                    <A href="/tc?module=CollegeTourOverview&<%=Constants.COLLEGE_TOUR_EVENT_ID%>=<%=request.getAttribute(Constants.COLLEGE_TOUR_EVENT_ID)%>">Overview</A>&#160;&#160;|&#160;&#160;
                    <A href="/tc?module=CollegeTourInfo&<%=Constants.COLLEGE_TOUR_EVENT_ID%>=<%=request.getAttribute(Constants.COLLEGE_TOUR_EVENT_ID)%>">Instructions</A>&#160;&#160;|&#160;&#160;
                    <A href="/tc?module=CollegeTourReg&<%=Constants.COLLEGE_TOUR_EVENT_ID%>=<%=request.getAttribute(Constants.COLLEGE_TOUR_EVENT_ID)%>">Register</A>&#160;&#160;|&#160;&#160;
                    Registrants&#160;&#160;|&#160;&#160;
                    <% if (request.getAttribute(Constants.FORUM_ID)!=null) {%>
                    <tc-webtag:forumLink forumID="<%=Long.parseLong((String)request.getAttribute(Constants.FORUM_ID))%>" message="Discuss College Tour"/>
                    <% } %>
                </p>
                <!-- ends -->


                <span class="bodySubtitle">Registrants: <%=registrants.size()%></span><br>

                <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

                                <tr>
                                    <td class="tableTitle" colspan="6">Registrants</td>
                                </tr>
                                <tr>
                                    <td class="tableHeader" width="20%">
                                        Handle
                                    </td>
                                </tr>


                                <% boolean even = false;%>
                                <rsc:iterator list="<%=registrants%>" id="resultRow">
                                    <tr>
                                        <td class="<%=even?"statLt":"statDk"%>">
                                            <tc-webtag:handle coderId='<%= resultRow.getLongItem("coder_id")%>' context='algorithm'/>
                                        </td>
                                    </tr>
                                    <%even=!even;%>
                                </rsc:iterator>

                            </TABLE>
                        </TD>
                    </tr>
                </TABLE>

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
