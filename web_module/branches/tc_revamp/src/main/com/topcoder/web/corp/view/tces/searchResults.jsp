<%@ page import="java.util.Map"%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page import="java.util.List"%>
<%@ page import="com.topcoder.web.corp.common.TCESConstants"%>
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
                            <tces:trailIterator id="trailItem" trailList="<%=(List)request.getAttribute("trail")%>">
                                <a href="<jsp:getProperty name="trailItem" property="href" />" class="bodyText"><jsp:getProperty name="trailItem" property="name" /></a> &gt;
                            </tces:trailIterator>
                            <br/>
                            <span class=testHead>Search Results</span>
                            <br/><br/>
                            <strong>Campaign:</strong> <%=request.getAttribute("campaignName")%>
                            <br/>
                        </p>
                    </td>
                </tr>
            </table>
            <p class="bodyText">
                <a href="<%=request.getAttribute("editURL")%>">Modify Search</a>&#160;|&#160;<a href="<%=sessionInfo.getServletPath()%>?module=ViewSearchTask&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=request.getAttribute(TCESConstants.CAMPAIGN_ID_PARAM)%>">New Search</a>
            </p>

            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
                <tr>
                    <td class="screeningHeader">
                        <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=results.getColumnIndex("handle_lower")%>" includeParams="true"/>">Handle</a>
                    </td>
                    <td class="screeningHeader" align="center">
                        <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=results.getColumnIndex("alg_rating")%>" includeParams="true"/>" class="statLink">Algorithm<br />Rating</a>
                    </td>
                    <td class="screeningHeader" align="center">
                        <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=results.getColumnIndex("des_rating")%>" includeParams="true"/>" class="statLink">Design<br/>Rating</a>
                    </td>
                    <td class="screeningHeader" align="center">
                        <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=results.getColumnIndex("dev_rating")%>" includeParams="true"/>" class="statLink">Development<br/>Rating</a>
                    </td>
                    <td class="screeningHeader" align="center">
                        <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=results.getColumnIndex("state_code")%>" includeParams="true"/>">State</a>
                    </td>
                    <td class="screeningHeader">
                        <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=results.getColumnIndex("country_name")%>" includeParams="true"/>">Country</a>
                    </td>
                    <td class="screeningHeader">
                        <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=results.getColumnIndex("coder_type_desc")%>" includeParams="true"/>">Type</a>
                    </td>
                    <td class="screeningHeader">
                        <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=results.getColumnIndex("school_name")%>" includeParams="true"/>">School</a>
                    </td>
                    <td class="screeningHeader" align="center">
                        <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=results.getColumnIndex("most_recent_hit")%>" includeParams="true"/>">Most Recent Hit</a>
                    </td>
                    <td class="screeningHeader" align="center">
                        <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=results.getColumnIndex("has_resume")%>" includeParams="true"/>">Resume</a>
                    </td>
                </tr>

                <% int i = 0; %>
                <%--not indenting to save some space on the download cuz this can be a big loop
                    and the spaces significantly impact the size of the html source
                --%>
<%boolean even = true;%>
<rsc:iterator list="<%=results%>" id="resultRow"><tr valign="top">
<td class="<%=even?"screeningCellEven":"screeningCellOdd"%>"><tces:handle campaignId="<%=resultRow.getLongItem("campaign_id")%>" db="<%=(String)request.getAttribute("oltpDb")%>"jobId='<%=resultRow.getLongItem("job_id")%>' coderId='<%=resultRow.getLongItem("user_id")%>' /></td>
<td class="<%=even?"screeningCellEven":"screeningCellOdd"%>" align="right"><rsc:item name="alg_rating" row="<%=resultRow%>"/></td>
<td class="<%=even?"screeningCellEven":"screeningCellOdd"%>" align="right"><rsc:item name="des_rating" row="<%=resultRow%>" format="#"/></td>
<td class="<%=even?"screeningCellEven":"screeningCellOdd"%>" align="right"><rsc:item name="dev_rating" row="<%=resultRow%>" format="#"/></td>
<td class="<%=even?"screeningCellEven":"screeningCellOdd"%>" align="center"><rsc:item name="state_code" row="<%=resultRow%>"/></td>
<td class="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item name="country_name" row="<%=resultRow%>"/></td>
<td class="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item name="coder_type_desc" row="<%=resultRow%>"/></td>
<td class="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item name="school_name" row="<%=resultRow%>"/></td>
<td class="<%=even?"screeningCellEven":"screeningCellOdd"%>" align="center"><rsc:item name="most_recent_hit" row="<%=resultRow%>"/></td>
<td class="<%=even?"screeningCellEven":"screeningCellOdd"%>" align="center"><rsc:item name="has_resume" row="<%=resultRow%>"/></td>
<%even=!even;%>
</tr></rsc:iterator>

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
