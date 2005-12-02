<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"
        %>
<%@ page import="com.topcoder.web.codinginterface.longcontest.Constants" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<% ResultSetContainer roundInfo = (ResultSetContainer) request.getAttribute("roundInfo"); %>
<% ResultSetContainer standings = (ResultSetContainer) request.getAttribute(Constants.ROUND_STANDINGS_LIST_KEY); %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder</title>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <script type="text/javascript">
        function next() {
            var myForm = document.compListForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value = parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value) + parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
            myForm.submit();
        }
        function previous() {
            var myForm = document.compListForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value = parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value) - parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';

            myForm.submit();
        }
    </script>
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
        <jsp:param name="level2" value="topcoder"/>
    </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<jsp:include page="page_title.jsp">
    <jsp:param name="image" value="long_competitions"/>
    <jsp:param name="title" value="Standings"/>
</jsp:include>

<%if (request.getAttribute(Constants.MESSAGE) != null) {%>
<span class="errorText"><%=request.getAttribute(Constants.MESSAGE)%></span><br>
<%}%>
<span class="bigHandle">Contest: <%=request.getAttribute(Constants.CONTEST_NAME_KEY)%></span><br>
<span class="bodySubtitle">Registrants: <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewRegistrants&<%=Constants.ROUND_ID%>=<%=request.getAttribute(Constants.ROUND_ID)%>" class="bcLink">
    <rsc:item name="num_registrants" set="<%=roundInfo%>"/></A></span>
<br>
<span class="bodySubtitle">Competitors: <rsc:item name="num_competitors" set="<%=roundInfo%>"/></span>
<br>
<form name="standingsForm" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
    <tc-webtag:hiddenInput name="<%=Constants.MODULE%>" value="ViewStandings"/>

<div class="pagingBox">
<%=(standings.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
    | <%=(standings.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
</div>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

                <tr>
                    <td class="tableTitle" colspan="6">Standings</td>
                </tr>
                <tr>
                    <td class="tableHeader" width="25%">
                        <A href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=standings.getColumnIndex("handle_lower")%>" includeParams="true"/>">Handle</A>
                    </td>
                    <td class="tableHeader" width="25%" align="right" nowrap="nowrap">
                        <A href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=standings.getColumnIndex("points")%>" includeParams="true"/>">Score</A>
                    </td>
                    <td class="tableHeader" width="25%" align="right" nowrap="nowrap">
                        <A href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=standings.getColumnIndex("rank")%>" includeParams="true"/>">Rank</A>
                    </td>
                    <td class="tableHeader" width="25%" align="right" nowrap="nowrap">
                        <A href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=standings.getColumnIndex("submission_number")%>" includeParams="true"/>">Submissions</A>
                    </td>
                </tr>
                <%-- ITERATOR --%>
                <%boolean even = true;%>
                <rsc:iterator list="<%=standings%>" id="resultRow">
                    <tr>
                        <td class="<%=even?"statLt":"statDk"%>">
                            <tc-webtag:handle coderId="<%=resultRow.getLongItem("coder_id")%>"/></td>
                        <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 7px;">
                                <rsc:item name="points" row="<%=resultRow%>" format="0.00"/></td>
                        <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 15px;">
                                <rsc:item name="rank" row="<%=resultRow%>"/></td>
                        <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 40px;">
                            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=<%=Constants.RP_SUBMISSION_HISTORY%>&<%=Constants.CODER_ID%>=<rsc:item name="coder_id" row="<%=resultRow%>"/>&<%=Constants.ROUND_ID%>=<%=request.getAttribute(Constants.ROUND_ID)%>&<%=Constants.COMPONENT_ID%>=<rsc:item name="component_id" row="<%=resultRow%>"/>" class="statLink">
                                <rsc:item name="submission_number" row="<%=resultRow%>"/>
                            </A></td>
                    </tr>
                    <%even = !even;%>
                </rsc:iterator>
                <%-- END ITERATOR --%>
            </TABLE>
        </TD>
    </tr>
</TABLE>

<div class="pagingBox">
<%=(standings.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
    | <%=(standings.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
</div>
</form>

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