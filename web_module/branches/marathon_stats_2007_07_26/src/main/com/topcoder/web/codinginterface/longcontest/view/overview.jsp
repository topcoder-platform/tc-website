<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.web.codinginterface.longcontest.Constants"
        %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="resultMap" type="java.util.Map" scope="request"/>
<jsp:useBean id="sortLinkBase" class="java.lang.String" scope="request"/>
<jsp:useBean id="prevPageLink" class="java.lang.String" scope="request"/>
<jsp:useBean id="nextPageLink" class="java.lang.String" scope="request"/>
<%    
    ResultSetContainer categories = (ResultSetContainer) resultMap.get("long_contest_round_categories");
    ResultSetContainer rsc = (ResultSetContainer) resultMap.get("long_contest_overview_info");
    ResultSetContainer.ResultSetRow infoRow = (ResultSetContainer.ResultSetRow) rsc.get(0);
%>
<% int roundType = request.getAttribute(Constants.ROUND_TYPE_ID) == null ? Constants.LONG_ROUND_TYPE_ID : ((Integer) request.getAttribute(Constants.ROUND_TYPE_ID)).intValue();%>
<% String myNode = "long_compete";
    String image = "long_comps_topcoder";
    if (roundType == Constants.LONG_PRACTICE_ROUND_TYPE_ID) {
        myNode = "long_practice";
    } else if (roundType == Constants.INTEL_LONG_PRACTICE_ROUND_TYPE_ID) {
        myNode = "long_intelmtcs_practice";
        image = "long_comps_intel";
    } else if (roundType == Constants.INTEL_LONG_ROUND_TYPE_ID) {
        myNode = "long_intelmtcs_compete";
        image = "long_comps_intel";
    }
%>

<html>
<head>
    <title>TopCoder</title>
    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
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
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="<%=myNode%>"/>
    </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<jsp:include page="page_title.jsp">
    <jsp:param name="image" value="<%=image%>"/>
    <jsp:param name="title" value="Contest Overview"/>
</jsp:include>

<div style="float:right; padding: 0px 0px 0px 5px;">
    <ci:sponsorImage image="<%=Constants.SPONSOR_IMAGE%>" alt="Sponsor" border="0" ifNull="&#160;"/>
</div>

<script language="JavaScript">
    <!--
    function goTo(selection) {
        sel = selection.options[selection.selectedIndex].value;
        if (sel && sel != '#') {
            window.location = '<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewOverview&<%=Constants.ROUND_ID%>=' + sel;
        }
    }
    // -->
</script>
Please select a contest:<br>
<tc-webtag:rscSelect name="<%=Constants.ROUND_ID%>" list="${rounds}" fieldText="name" fieldValue="round_id" selectedValue="<%=request.getParameter(Constants.ROUND_ID)%>" onChange="goTo(this)"/>
<br><br>


<span class="bigHandle">Contest: <rsc:item name="contest_name" row="<%=infoRow%>"/> &gt; <rsc:item name="round_name" row="<%=infoRow%>"/></span>
<br>
<span class="bodySubtitle">Categories:
<% if (categories.isEmpty()) { %> None <% } %>
<%boolean first = true;%>
<rsc:iterator list="<%=categories%>" id="resultRow">
    <% if (!first) { %>, <% } %><rsc:item name="problem_category_desc" row="<%=resultRow%>"/>
    <% first = false; %>
</rsc:iterator>
<br>
Competitors: <rsc:item name="num_competitors" row="<%=infoRow%>"/><br>
Avg. Submissions: <rsc:item name="avg_submissions" row="<%=infoRow%>" format="#.##" ifNull="N/A"/></span><br>
<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewProblemStatement&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=infoRow%>"/>&<%=Constants.PROBLEM_ID%>=<rsc:item name="problem_id" row="<%=infoRow%>"/>" class="bcLink">Problem
    Statement</A><br>
<% if (request.getAttribute(Constants.FORUM_ID) != null) { %>
<tc-webtag:forumLink forumID="<%=((Long)request.getAttribute(Constants.FORUM_ID)).longValue()%>" message="Discuss this contest"/>
<% } %>
<div class="pagingBox">
    <logic:notEmpty name="prevPageLink"><a href="<%=prevPageLink%>" class="bcLink">
    </logic:notEmpty>&lt;&lt; previous<logic:notEmpty name="prevPageLink"></a></logic:notEmpty>
    &nbsp;|&nbsp;
    <logic:notEmpty name="nextPageLink"><a href="<%=nextPageLink%>" class="bcLink">
    </logic:notEmpty>next &gt;&gt;<logic:notEmpty name="nextPageLink"></a></logic:notEmpty>
</div>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

                <tr>
                    <td class="tableTitle" colspan="9">Contest Overview</td>
                </tr>
                <tr>
                    <td class="tableHeader" width="5%" align="right">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['placed']}" includeParams="true" excludeParams="sr" />">Rank</a></td>
                    <td class="tableHeader" width="15%">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['handle']}" includeParams="true" excludeParams="sr" />">Handle</a></td>
                    </td>
                    <td class="tableHeader" width="15%" align="right">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['provisional_placed']}" includeParams="true" excludeParams="sr" />">Provisional Rank</a></td>
                    <td class="tableHeader" width="15%" align="right">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['point_total']}" includeParams="true" excludeParams="sr" />">Provisional Score</a></td>
                    <td class="tableHeader" width="15%" align="right">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['system_point_total']}" includeParams="true" excludeParams="sr" />">Final Score</a></td>
                    <td class="tableHeader" width="10%" align="center">
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="${columnMap['language_name']}" includeParams="true" excludeParams="sr" />">Language</a></td>
                    <td class="tableHeader" width="10%">&#160;</td>
                    <td class="tableHeader" width="15%">&#160;</td>
                    <td class="tableHeader" width="15%">&#160;</td>
                </tr>
                <%-- ITERATOR --%>
                <%boolean even = true;%>
				<c:forEach items="${competitors}" var="resultRow" varStatus="status">
				    <tr class='${status.index % 2 == 1? "dark" : "light" }'>
                    <tr>
                        <td class="<%=even?"statLt":"statDk"%>" align="right">
                            <rsc:item name="placed" row="<%=resultRow%>"/></td>
                        <td class="<%=even?"statLt":"statDk"%>">
                            <tc-webtag:handle context='marathon_match' coderId='<%=resultRow.getLongItem("coder_id")%>'/></td>
                        
                        
                        <td class="valueR">${resultRow.map['provisional_placed'] }</td>
                        <td class="<%=even?"statLt":"statDk"%>" align="right">
                            <rsc:item name="point_total" row="<%=resultRow%>" format="0.00"/></td>
                            
                            
                        <td class="<%=even?"statLt":"statDk"%>" align="right">
                            <rsc:item name="system_point_total" row="<%=resultRow%>" format="0.00"/></td>
                        <td class="<%=even?"statLt":"statDk"%>" align="center">
                            <rsc:item name="language_name" row="<%=resultRow%>"/></td>
                        <td class="<%=even?"statLt":"statDk"%>" align="center">
                            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewSystemTestResults&<%=Constants.ROUND_ID%>=<%=request.getParameter(Constants.ROUND_ID)%>&<%=Constants.PROBLEM_ID%>=<rsc:item name="problem_id" row="<%=resultRow%>"/>&<%=Constants.CODER_ID%>=<rsc:item name="coder_id" row="<%=resultRow%>"/>">results</A>
                        </td>
                        <td class="<%=even?"statLt":"statDk"%>" align="center" nowrap="nowrap">
                            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewSubmissionHistory&<%=Constants.ROUND_ID%>=<%=request.getParameter(Constants.ROUND_ID)%>&<%=Constants.PROBLEM_ID%>=<rsc:item name="problem_id" row="<%=resultRow%>"/>&<%=Constants.CODER_ID%>=<rsc:item name="coder_id" row="<%=resultRow%>"/>">submission
                                history</A></td>
                        <td class="<%=even?"statLt":"statDk"%>" align="center" nowrap="nowrap">
                            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewExampleHistory&<%=Constants.ROUND_ID%>=<%=request.getParameter(Constants.ROUND_ID)%>&<%=Constants.PROBLEM_ID%>=<rsc:item name="problem_id" row="<%=resultRow%>"/>&<%=Constants.CODER_ID%>=<rsc:item name="coder_id" row="<%=resultRow%>"/>">example
                                history</A></td>
                    </tr>
                    <%even = !even;%>
                 </c:forEach>
            </TABLE>
        </TD>
    </tr>
</TABLE>

<div class="pagingBox">
    <logic:notEmpty name="prevPageLink"><a href="<%=prevPageLink%>" class="bcLink">
    </logic:notEmpty>&lt;&lt; previous<logic:notEmpty name="prevPageLink"></a></logic:notEmpty>
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