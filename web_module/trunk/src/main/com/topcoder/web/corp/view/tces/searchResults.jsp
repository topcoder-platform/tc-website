<%@ page import="java.util.Map"%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java"%>
<%@ taglib uri="tces-taglib.tld" prefix="tces" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="PositionInterestTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.PositionInterestTask"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <title>TopCoder | Recruiting Reports</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <jsp:include page="script.jsp"/>
</head>
<%

    ResultSetContainer results = (ResultSetContainer)request.getAttribute("results");

%>

<body>

<!-- Header Begins -->
<jsp:include page="top.jsp">
    <jsp:param name="level1" value="employment_services"/>
</jsp:include>
<!-- Header Ends -->


<table width=100% border=0 cellpadding=0 cellspacing=0 align=center>
    <TR valign="top">
        <td width="50%">
            <jsp:include page="left.jsp"/>
        </td>
        <!-- Center Column Begins -->
        <td class=recruitingBody>
            <img src="/i/corp/clear.gif" width="700" height="11" alt="" border=0><br/>
            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
                <tr valign="top">
                    <td class=bodyText>
                        <p>
<%--
<tces:trailIterator id="trailItem" trailList="<%=PositionInterestTask.getTrail()%>">
                                <a href="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText">
                                    <jsp:getProperty name="trailItem" property="name"/>
                                </a> &gt;
                            </tces:trailIterator>
--%>
                            <br/>
                            <span class=testHead>Search Results</span>
                            <br/><br/>
<%--
                            <strong>Campaign:</strong>
                            <jsp:getProperty name="PositionInterestTask" property="campaignName"/>
                            <br/>
                            <strong>Position:</strong>
                            <jsp:getProperty name="PositionInterestTask" property="positionName"/>
                            <br>
                            <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.DEMOGRAPHIC_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>" class="bodyText">View
                                collective demographic info</a><br>
--%>
                        </p>
                    </td>
                </tr>
            </table>

            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
                <tr>
                    <td class="screeningHeader">
                        Handle
                    </td>
                    <td class="screeningHeader">
                        Rating
                    </td>
                    <td class="screeningHeader">
                        Design
                            <br/>Rating</td>
                    <td class="screeningHeader">
                        Development
                            <br/>Rating</td>
                    <td class="screeningHeader" align=center>
                        State
                    </td>
                    <td class="screeningHeader">
                        Country
                    </td>
                    <td class="screeningHeader">
                        Type
                    </td>
                    <td class="screeningHeader">
                        School
                    </td>
                    <td class="screeningHeader" align=center>
                        Hit
                            Date</td>
                    <td class="screeningHeader" align=center>
                        Resume
                    </td>
                </tr>

                <% int i = 0; %>
                <%--not indenting to save some space on the download cuz this can be a big loop
                    and the spaces significantly impact the size of the html source
                --%>
                <rsc:iterator list="<%=results%>" id="resultRow">
                    <tr>
                        <td><rsc:item name="handle" row="<%=resultRow%>"/></td>
                        <td><rsc:item name="alg_rating" row="<%=resultRow%>"/></td>
                        <td><rsc:item name="des_rating" row="<%=resultRow%>"/></td>
                        <td><rsc:item name="dev_rating" row="<%=resultRow%>"/></td>
                        <td><rsc:item name="state_code" row="<%=resultRow%>"/></td>
                        <td><rsc:item name="country_name" row="<%=resultRow%>"/></td>
                        <td><rsc:item name="coder_type_desc" row="<%=resultRow%>"/></td>
                        <td><rsc:item name="school_name" row="<%=resultRow%>"/></td>
                        <td><rsc:item name="most_recent_hit" row="<%=resultRow%>"/></td>
                        <td><rsc:item name="has_resume" row="<%=resultRow%>"/></td>
                    </tr>
                </rsc:iterator>
            </table>

            <p><br></p>
        </td>
        <!-- Center Column Ends -->
        <td class=homeRightPromos width="50%">
            <jsp:include page="right.jsp"/>
        </td>
    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="../foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
