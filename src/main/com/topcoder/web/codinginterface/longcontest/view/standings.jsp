<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"
        %>

<%@ page import="com.topcoder.web.codinginterface.longcontest.Constants" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="java.util.Date"%>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<% ResultSetContainer roundInfo = (ResultSetContainer) request.getAttribute("roundInfo"); %>
<% ResultSetContainer standings = (ResultSetContainer) request.getAttribute(Constants.ROUND_STANDINGS_LIST_KEY); %>
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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder</title>
    <jsp:include page="script.jsp" />
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
    <script type="text/javascript">
        function next() {
            var myForm = document.standingsForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value=parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value)+parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
            myForm.submit();
        }
        function previous() {
            var myForm = document.standingsForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value=parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value)-parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
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
        <jsp:param name="level2" value="<%=level2%>"/>
    </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<jsp:include page="page_title.jsp">
    <jsp:param name="image" value="<%=image%>"/>
    <jsp:param name="title" value="Standings"/>
</jsp:include>

<div style="float:right; padding: 0px 0px 0px 5px;">
   <ci:sponsorImage image="<%=Constants.SPONSOR_IMAGE%>" alt="Sponsor" border="0" ifNull="&#160;"/>
</div>
<%if (request.getAttribute(Constants.MESSAGE) != null) {%>
<span class="errorText"><%=request.getAttribute(Constants.MESSAGE)%></span><br>
<%}%>
<span class="bigHandle">Contest: <rsc:item name="contest_name" set="<%=roundInfo%>"/></span><br>
    <% if(roundInfo.getIntItem(0, "round_type_id")!=Constants.LONG_PRACTICE_ROUND_TYPE_ID) { %>
<span class="bodySubtitle">Registrants: <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewRegistrants&<%=Constants.ROUND_ID%>=<%=request.getAttribute(Constants.ROUND_ID)%>" class="bcLink">
    <rsc:item name="num_registrants" set="<%=roundInfo%>"/></A></span>
<br><%  } %>
<span class="bodySubtitle">Competitors: <rsc:item name="num_competitors" set="<%=roundInfo%>"/></span>
<br>
<form name="standingsForm" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.NUMBER_RECORDS%>"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.START_RANK%>"/>
    <tc-webtag:hiddenInput name="<%=Constants.ROUND_ID%>"/>
    <tc-webtag:hiddenInput name="<%=Constants.MODULE%>" value="ViewStandings"/>


<div style="clear: both;" align="center">
   <div class="pagingBox">
   <%=(standings.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
       | <%=(standings.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
   </div>
</div>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

                <tr>
                    <td class="tableTitle" colspan="6">Standings</td>
                </tr>
                <tr>
                    <td class="tableHeader" width="20">
                        <A href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=standings.getColumnIndex("handle_lower")%>" includeParams="true"/>">Handle</A>
                    </td>
                    <td class="tableHeader" width="20%" align="right" nowrap="nowrap">
                        <A href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=standings.getColumnIndex("points")%>" includeParams="true"/>">Score</A>
                    </td>
                    <td class="tableHeader" width="20%" align="center" nowrap="nowrap">
                        <A href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=standings.getColumnIndex("rank")%>" includeParams="true"/>">Rank</A>
                    </td>
                    <td class="tableHeader" width="20%" align="center" nowrap="nowrap">
                        <A href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=standings.getColumnIndex("submit_time")%>" includeParams="true"/>">Last Submission Time</A>
                    </td>
                    <td class="tableHeader" width="20%" align="center" nowrap="nowrap">
                        <A href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=standings.getColumnIndex("submission_number")%>" includeParams="true"/>">Submissions</A>
                    </td>
                </tr>
                <%-- ITERATOR --%>
                <%boolean even = true;%>
                <%--control whitespace to reduce html size --%>
                <rsc:iterator list="<%=standings%>" id="resultRow"><tr>
<td class="<%=even?"statLt":"statDk"%>">
<tc-webtag:handle coderId="<%=resultRow.getLongItem("coder_id")%>"/></td>
<td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 7px;">
<rsc:item name="points" row="<%=resultRow%>" format="0.00"/><%=resultRow.getIntItem("status_id")==130?"*":""%></td>
<td class="<%=even?"statLt":"statDk"%>" align="center">
<rsc:item name="rank" row="<%=resultRow%>"/></td>
<td class="<%=even?"statLt":"statDk"%>" align="center">
<tc-webtag:format object="<%=new Date(resultRow.getLongItem("submit_time"))%>" format="MM.dd.yyyy HH:mm:ss"/></td></td>
<td class="<%=even?"statLt":"statDk"%>" align="center">
<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=<%=Constants.RP_SUBMISSION_HISTORY%>&<%=Constants.CODER_ID%>=<rsc:item name="coder_id" row="<%=resultRow%>"/>&<%=Constants.ROUND_ID%>=<%=request.getAttribute(Constants.ROUND_ID)%>&<%=Constants.COMPONENT_ID%>=<rsc:item name="component_id" row="<%=resultRow%>"/>" class="statLink">
<rsc:item name="submission_number" row="<%=resultRow%>"/>
</A></td></tr><%even = !even;%></rsc:iterator>
                <%-- END ITERATOR --%>
            </TABLE>
        </TD>
    </tr>
</TABLE>
    <p>* Indicates that this competitor's most recent submission has not yet been scored</p>

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