<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.web.codinginterface.longcontest.Constants,
                com.topcoder.web.common.StringUtils"

        %>
<%@ page import="java.util.StringTokenizer" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib prefix="mm" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="resultMap" type="java.util.Map" scope="request"/>

<% int roundType = request.getAttribute(Constants.ROUND_TYPE_ID) == null ? Constants.LONG_ROUND_TYPE_ID : ((Integer) request.getAttribute(Constants.ROUND_TYPE_ID)).intValue();%>
<% String myNode = "long_compete";
    String image = "long_comps_topcoder";
    if (roundType == Constants.LONG_PRACTICE_ROUND_TYPE_ID || roundType==Constants.AMD_LONG_PRACTICE_ROUND_TYPE_ID) {
        myNode = "long_practice";
    } else if (roundType == Constants.INTEL_LONG_PRACTICE_ROUND_TYPE_ID) {
        myNode = "long_intelmtcs_practice";
        image = "long_comps_intel";
    } else if (roundType == Constants.INTEL_LONG_ROUND_TYPE_ID) {
        myNode = "long_intelmtcs_compete";
        image = "long_comps_intel";
    }
%>
<% ResultSetContainer.ResultSetRow infoRow = (ResultSetContainer.ResultSetRow) request.getAttribute("infoRow"); %>
<%!
    private String addSpace(String text) {
        int i = -1;
        text = StringUtils.htmlEncode(text);
        while ((i = text.indexOf("\n\n")) >= 0) {
            text = text.substring(0, i + 1) + "&#160;" + text.substring(i + 1);

        }

        StringTokenizer strtok = new StringTokenizer(text, "\n");
        StringBuffer stBuffer = new StringBuffer(text.length());
        String sTemp = "";
        while (strtok.hasMoreTokens()) {
            sTemp = strtok.nextToken();
            boolean inTag = false;
            for (i = 0; i < sTemp.length(); i++) {
                if (!inTag && sTemp.charAt(i) == '<') {
                    inTag = true;
                }
                if (inTag && sTemp.charAt(i) == '>') {
                    inTag = false;
                }
                if (!inTag && sTemp.charAt(i) == ' ') {
                    stBuffer.append("&#160;");
                } else {
                    stBuffer.append(sTemp.charAt(i));
                }
            }
            stBuffer.append("<br />");
        }
        return stBuffer.toString();
    }
%>

<html>
<head>
    <title>TopCoder</title>
    <jsp:include page="script.jsp"/>
    <jsp:include page="style.jsp">
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
            <jsp:include page="includes/global_left.jsp">
                <jsp:param name="node" value="m_long_contests"/>
            </jsp:include>
        </td>
        <%-- Left Column Ends --%>

        <%-- Center Column Begins --%>
        <td class="statTableSpacer" width="100%" valign="top">

            <jsp:include page="page_title.jsp">
                <jsp:param name="image" value="<%=image%>"/>
                <jsp:param name="title" value="Problem Solution"/>
            </jsp:include>

            <span class="bigHandle">Contest: <mm:contestLink roundId="${infoRow.map['round_id']}" name="${infoRow.map['display_name']}" /></span><br/>                
            <span class="bodySubtitle">Problem: <mm:problemLink roundId="${infoRow.map['round_id']}" problemId="${infoRow.map['problem_id']}" problemName="${infoRow.map['problem_name']}" /> </span>

            <p>
                <span class="bodySubtitle">Coder: <tc-webtag:handle context='marathon_match' coderId="${infoRow.map['coder_id']}"/></span>
                <br/>
                <span class="bodySubtitle">Submission: ${infoRow.map['submission_number']}</span>
                <br/>
                <% if (String.valueOf(true).equals(request.getAttribute("mostRecent"))&&String.valueOf(true).equals(request.getAttribute(Constants.EXAMPLE_FLAG))) { %>
                <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewExampleResults&amp;<%=Constants.PROBLEM_ID%>=${infoRow.map['problem_id']}&amp;<%=Constants.ROUND_ID%>=${infoRow.map['round_id']}&amp;<%=Constants.CODER_ID%>=${infoRow.map['coder_id']}">Example
                    Results</a>
                <br/>
                <% } %>


            <div class="problemText" style="color:black">
                <%=addSpace(infoRow.getStringItem("submission_text"))%>
            </div>


        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170" id="onRight">
            <jsp:include page="public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<div id="onBottom">
<jsp:include page="foot.jsp" />
</div>

</body>

</html>