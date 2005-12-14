<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.web.codinginterface.longcontest.Constants,
                java.util.Date"

        %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="resultMap" type="java.util.Map" scope="request"/>
<jsp:useBean id="sortLinkBase" class="java.lang.String" scope="request"/>
<jsp:useBean id="prevPageLink" class="java.lang.String" scope="request"/>
<jsp:useBean id="nextPageLink" class="java.lang.String" scope="request"/>
<%
    ResultSetContainer submissions = (ResultSetContainer) resultMap.get("long_coder_submissions");
    ResultSetContainer tmp = (ResultSetContainer) resultMap.get("long_contest_over");
    boolean over = tmp.getBooleanItem(0, 0);
    tmp = (ResultSetContainer) resultMap.get("long_contest_coder_submissions_info");
    ResultSetContainer.ResultSetRow infoRow = (ResultSetContainer.ResultSetRow) tmp.get(0);
%>
<% int roundType = request.getAttribute(Constants.ROUND_TYPE_ID)==null?Constants.LONG_ROUND_TYPE_ID:((Integer)request.getAttribute(Constants.ROUND_TYPE_ID)).intValue();%>
<% String level2 = "topcoder";
   String image = "long_comps_topcoder";
    if (roundType==Constants.LONG_PRACTICE_ROUND_TYPE_ID) {
        level2="topcoder_practice";
    } else if (roundType ==Constants.INTEL_LONG_PRACTICE_ROUND_TYPE_ID) {
        level2="intel_practice";
        image = "long_comps_intel";
    } else if (roundType ==Constants.INTEL_LONG_ROUND_TYPE_ID) {
        level2="intel";
        image = "long_comps_intel";
    }
%>

<html>
<head>
    <title>TopCoder</title>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
</head>

<body>

<jsp:include page="top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value="long_contests"/>
                <jsp:param name="level2" value="<%=level2%>"/>
            </jsp:include>
        </td>
        <%-- Left Column Ends --%>

        <%-- Center Column Begins --%>
        <TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

            <jsp:include page="page_title.jsp">
                <jsp:param name="image" value="<%=image%>"/>
                <jsp:param name="title" value="Submission History"/>
            </jsp:include>

            <div style="float:right; padding: 0px 0px 0px 5px;">
               <ci:sponsorImage image="<%=Constants.SPONSOR_IMAGE%>" alt="Sponsor" border="0" ifNull="&#160;"/>
            </div>
            <span class="bigHandle">Contest: <A href="?module=ViewOverview&rd=<rsc:item name="round_id" row="<%=infoRow%>"/>" class="bcLink"><rsc:item name="contest_name" row="<%=infoRow%>"/></A></span><br>
            <span class="bodySubtitle">Problem: <rsc:item name="problem_name" row="<%=infoRow%>"/></span><br>
            <span class="bodySubtitle">Coder: <tc-webtag:handle coderId='<%=request.getParameter(Constants.CODER_ID)%>'/></span>
            <br>
            <span class="bodySubtitle">Submissions: <rsc:item name="num_submissions" row="<%=infoRow%>"/></span><br>

            <div style="clear: both;" align="center">
               <div class="pagingBox">
                   <logic:notEmpty name="prevPageLink"><a href="<%=prevPageLink%>" class="bcLink">
                   </logic:notEmpty>&lt;&lt; prev<logic:notEmpty name="prevPageLink"></a></logic:notEmpty>
                   &nbsp;|&nbsp;
                   <logic:notEmpty name="nextPageLink"><a href="<%=nextPageLink%>" class="bcLink">
                   </logic:notEmpty>next &gt;&gt;<logic:notEmpty name="nextPageLink"></a></logic:notEmpty>
               </div>
            </div>

            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

                            <tr>
                                <% if (over) { %>
                                <td class="tableTitle" colspan="4">Submission History</td>
                                <% } else { %>
                                <td class="tableTitle" colspan="3">Submission History</td>
                                <% } %>
                            </tr>
                            <tr>
                                <td class="tableHeader" width="25%">
                                    <A href="<%=sortLinkBase%><tc-webtag:sort column="3"/>">Submission</A></td>
                                <td class="tableHeader" width="25%" align="center">
                                    <A href="<%=sortLinkBase%><tc-webtag:sort column="4"/>">Time</A></td>
                                <td class="tableHeader" width="25%" align="right">
                                    <A href="<%=sortLinkBase%><tc-webtag:sort column="5"/>">Score</A></td>
                                <% if (over) { %>
                                <td class="tableHeader" width="25%" align="right">&#160;</td>
                                <% } %>
                            </tr>
                            <%boolean even = true;%>
                            <rsc:iterator list="<%=submissions%>" id="resultRow">
                                <tr>
                                    <td class="<%=even?"statLt":"statDk"%>">
                                        <rsc:item name="submission_number" row="<%=resultRow%>"/></td>
                                    <td class="<%=even?"statLt":"statDk"%>" align="center">
                                        <tc-webtag:format object="<%=new Date(resultRow.getLongItem("submit_time"))%>" format="MM.dd.yyyy HH:mm:ss"/></td>
                                    <td class="<%=even?"statLt":"statDk"%>" align="right">
                                        <rsc:item name="submission_points" row="<%=resultRow%>" format="0.00"/></td>
                                    <% if (over) { %>
                                    <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 40px;">
                                        <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewProblemSolution&<%=Constants.PROBLEM_ID%>=<rsc:item name="problem_id" row="<%=resultRow%>"/>&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=resultRow%>"/>&<%=Constants.CODER_ID%>=<rsc:item name="coder_id" row="<%=resultRow%>"/>&<%=Constants.SUBMISSION_NUMBER%>=<rsc:item name="submission_number" row="<%=resultRow%>"/>">solution</A>
                                    </td>
                                    <% } %>
                                </tr>
                                <%even = !even;%>
                            </rsc:iterator>
                        </TABLE>
                    </TD>
                </tr>
            </TABLE>

            <div class="pagingBox">
                <logic:notEmpty name="prevPageLink"><a href="<%=prevPageLink%>" class="bcLink">
                </logic:notEmpty>&lt;&lt; prev<logic:notEmpty name="prevPageLink"></a></logic:notEmpty>
                &nbsp;|&nbsp;
                <logic:notEmpty name="nextPageLink"><a href="<%=nextPageLink%>" class="bcLink">
                </logic:notEmpty>next &gt;&gt;<logic:notEmpty name="nextPageLink"></a></logic:notEmpty>
            </div>

        </td>

        <%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="public_right.jsp">
                <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
        </td>
        <%-- Right Column Ends --%>

        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
    </tr>
</table>

<jsp:include page="foot.jsp"/>
</body>
</html>