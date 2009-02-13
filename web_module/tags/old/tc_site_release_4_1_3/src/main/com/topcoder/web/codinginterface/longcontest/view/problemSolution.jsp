<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.web.codinginterface.longcontest.Constants,
                com.topcoder.web.tc.controller.legacy.stat.common.JSPUtils,
                java.util.StringTokenizer"

        %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="resultMap" type="java.util.Map" scope="request"/>
<%
    ResultSetContainer rsc = (ResultSetContainer) resultMap.get("long_contest_submission");
    ResultSetContainer.ResultSetRow infoRow = (ResultSetContainer.ResultSetRow) rsc.get(0);
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

<%!
    private String addSpace(String text) {
        int i = -1;
        text = JSPUtils.htmlEncode(text);
        while ((i = text.indexOf("\n\n")) >= 0) {
            text = text.substring(0, i + 1) + "&#160;" + text.substring(i + 1);

        }

        StringTokenizer strtok = new StringTokenizer(text, "\n");
        StringBuffer stBuffer = new StringBuffer(text.length());
        String sTemp = "";
        while (strtok.hasMoreTokens()) {
            sTemp = strtok.nextToken();
            for (i = 0; i < sTemp.length(); i++) {
                if (sTemp.charAt(i) == ' ')
                    stBuffer.append("&#160;");
                else
                    stBuffer.append(sTemp.charAt(i));
            }
            stBuffer.append("<BR>");
        }
        return stBuffer.toString();
    }
%>

<html>
<head>
    <title>TopCoder</title>
    <jsp:include page="script.jsp" />
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
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
                <jsp:param name="title" value="Problem Solution"/>
            </jsp:include>

            <span class="bigHandle">Contest: <rsc:item name="contest_name" row="<%=infoRow%>"/></span><br>
            <span class="bodySubtitle">Problem: <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewProblemStatement&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=infoRow%>"/>&<%=Constants.PROBLEM_ID%>=<rsc:item name="problem_id" row="<%=infoRow%>"/>">
                <rsc:item name="problem_name" row="<%=infoRow%>"/></a></span>

            <p>
                <span class="bodySubtitle">Coder: <tc-webtag:handle coderId='<%=infoRow.getLongItem("coder_id")%>'/></span>
                <br>
                <span class="bodySubtitle">Submission: <rsc:item name="submission_number" row="<%=infoRow%>"/></span>
                <br>

            <div class="problemText" style="color:black">
                <%=addSpace(infoRow.getStringItem("submission_text"))%>
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