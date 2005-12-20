<%@ page contentType="text/html;charset=utf-8" %>
<%@ page
        language="java"
        import="com.topcoder.web.codinginterface.longcontest.Constants"

        %>
    <%@ page import="com.topcoder.web.codinginterface.longcontest.model.LongContest"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder</title>
    <jsp:include page="script.jsp" />
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>

<body>

<jsp:include page="top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<%-- Left Column Begins--%>
<td width="180">
    <%-- value of level2 is 'topcoder' or 'intel' --%>
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="level1" value="long_contests"/>
        <jsp:param name="level2" value="topcoder"/>
    </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

    <%-- value of image is 'long_comps_topcoder' or 'long_comps_intel' --%>
    <jsp:include page="page_title.jsp">
        <jsp:param name="image" value="long_comps_topcoder"/>
        <jsp:param name="title" value="Active Contests"/>
    </jsp:include>

    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

                    <tr>
                        <td class="tableTitle" colspan="10">Active Contests</td>
                    </tr>
                    <tr>
                        <td class="tableHeader">Contest</td>
                        <td class="tableHeader" colspan="3" nowrap="nowrap">Problem Name</td>
                        <td class="tableHeader" align="center" nowrap="nowrap">Registrants</td>
                        <td class="tableHeader" align="center" nowrap="nowrap">Competitors</td>
                        <td class="tableHeader" align="center" nowrap="nowrap">Submissions</td>
                        <td class="tableHeader" align="center" nowrap="nowrap">Start time</td>
                        <td class="tableHeader" align="center" nowrap="nowrap">End time</td>
                        <td class="tableHeader" align="center" nowrap="nowrap">Forum</td>
                    </tr>

                    <%boolean even = true;%>
                    <logic:iterate name="<%=Constants.CONTEST_LIST_KEY%>" id="contest">
                        <tr>
                            <td class="<%=even?"statLt":"statDk"%>"><b><tc-webtag:beanWrite name="contest" property="contestName"/></b>
                                <% pageContext.setAttribute("sponsorImage", ((LongContest)contest).getSponsorImage());%>
                                <div style="float: left;"><ci:sponsorImage image="sponsorImage" alt="Sponsor" border="0" ifNull=""/></div>
                            </td>
                            <td class="<%=even?"statLt":"statDk"%>">
                                <logic:equal name="contest" property="passed" value="false">
                                    <logic:equal name="contest" property="coderRegistered" value="false">
                                        <tc-webtag:beanWrite name="contest" property="problemName"/>
                                    </logic:equal>
                                    <logic:notEqual name="contest" property="coderRegistered" value="false">
                                        <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewProblemStatement&<%=Constants.COMPONENT_ID%>=<tc-webtag:beanWrite name="contest" property="componentID"/>&<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>" class="statLink">
                                        <tc-webtag:beanWrite name="contest" property="problemName"/>
                                        </A>
                                    </logic:notEqual>
                                </logic:equal>
                                <logic:notEqual name="contest" property="passed" value="false">
                                        <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewProblemStatement&<%=Constants.COMPONENT_ID%>=<tc-webtag:beanWrite name="contest" property="componentID"/>&<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>" class="statLink">
                                        <tc-webtag:beanWrite name="contest" property="problemName"/>
                                        </A>
                                </logic:notEqual>

                            </td>
                            <td class="<%=even?"statLt":"statDk"%>">
                                <logic:equal name="contest" property="passed" value="false">
                                    <logic:equal name="contest" property="coderRegistered" value="false">
                                        <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewReg&<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>"
                                           class="statLink">Register</a>
                                    </logic:equal>
                                    <logic:notEqual name="contest" property="coderRegistered" value="false">
                                        <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=Submit&<%=Constants.COMPONENT_ID%>=<tc-webtag:beanWrite name="contest" property="componentID"/>&<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>&<%=Constants.CONTEST_ID%>=<tc-webtag:beanWrite name="contest" property="contestID"/>"
                                           class="statLink">Submit</a>
                                    </logic:notEqual>
                                </logic:equal>
                            </td>
                            <td class="<%=even?"statLt":"statDk"%>">
                                <logic:equal name="contest" property="passed" value="false">
                                    <logic:equal name="contest" property="started" value="true">
                                        <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewStandings&<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>"
                                           class="statLink">Standings</a>
                                    </logic:equal>
                                </logic:equal>
                                <logic:notEqual name="contest" property="passed" value="false">
                                    <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewOverview&<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>"
                                       class="statLink">Results</a>
                                </logic:notEqual>
                            </td>
                            <td class="<%=even?"statLt":"statDk"%>" align="center" nowrap="nowrap">
                                <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewRegistrants&<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>" class="statLink">
                                    <tc-webtag:beanWrite name="contest" property="numRegistrants"/></A></td>
                            <td class="<%=even?"statLt":"statDk"%>" align="center" nowrap="nowrap">
                                    <tc-webtag:beanWrite name="contest" property="numCompetitors"/></td>
                            <td class="<%=even?"statLt":"statDk"%>" align="center" nowrap="nowrap">
                                                    <tc-webtag:beanWrite name="contest" property="submissionCount"/></td>
                            <td class="<%=even?"statLt":"statDk"%>" align="center" nowrap="nowrap">
                                <tc-webtag:beanWrite name="contest" property="startTime"
                                                     format="MM.dd.yyyy HH:mm"/></td>
                            <td class="<%=even?"statLt":"statDk"%>" align="center" nowrap="nowrap">
                                <tc-webtag:beanWrite name="contest" property="endTime"
                                                     format="MM.dd.yyyy HH:mm"/></td>
                            <td class="<%=even?"statLt":"statDk"%>" align="center" nowrap="nowrap">
                                <logic:notEqual name="contest" property="forumId" value="0">
                                    <tc-webtag:forumLink forumID="<%=((LongContest)contest).getForumId()%>" message="discuss"/>
                                </logic:notEqual>
                            </td>

                        </tr>
                        <%even = !even;%>
                    </logic:iterate>

                </TABLE>
            </TD>
        </tr>
    </TABLE>

    <p><br></p>
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