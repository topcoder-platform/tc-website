<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.web.codinginterface.longcontest.Constants,
                java.util.Date"

        %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants"%>
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
    ResultSetContainer queue= (ResultSetContainer) resultMap.get("long_contest_queue_status");
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
                <jsp:param name="title" value="Queue Status"/>
            </jsp:include>

            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

                            <tr>
                                <td class="tableHeader" width="20%">
                                    Handle
                                </td>
                                <td class="tableHeader" width="20%">
                                    Contest
                                </td>
                                <td class="tableHeader" width="20%" align="center">
                                    Queue Date
                                </td>
                                <td class="tableHeader" width="20%" align="right">
                                    # Tests Remaining
                                </td>
                            </tr>
                            <% if (queue.isEmpty()) { %>
                            <tr><td colspan="3">There are currently no submissions in the queue.</td></tr>
                            <% } %>
                            <%boolean even = true;%>
                            <rsc:iterator list="<%=queue%>" id="resultRow">
                                <tr>
                                    <td class="<%=even?"statLt":"statDk"%>" align="center" nowrap="nowrap">
                                        <tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id")%>'/>
                                    </td>
                                    <td class="<%=even?"statLt":"statDk"%>" align="center" nowrap="nowrap">
                                        <rsc:item name="contest_name" row="<%=resultRow%>"/> &gt; <rsc:item name="round_name" row="<%=resultRow%>"/>
                                    </td>
                                    <td class="<%=even?"statLt":"statDk"%>" align="right">
                                        <rsc:item name="queue_date" row="<%=resultRow%>" format="MM.dd.yyyy HH:mm:ss"/>
                                    </td>
                                    <td class="<%=even?"statLt":"statDk"%>" align="center">
                                        <rsc:item name="tests" row="<%=resultRow%>"/>
                                    </td>
                                </tr>
                                <%even = !even;%>
                            </rsc:iterator>
                        </TABLE>
                    </TD>
                </tr>
            </TABLE>


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