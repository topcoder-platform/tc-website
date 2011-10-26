<%@ page contentType="text/html;charset=utf-8" %>
<%@ page
        language="java"
        import="com.topcoder.web.codinginterface.longcontest.Constants"

        %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
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

<html>
<head>
    <title>Submit Success</title>
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
                <jsp:param name="node" value="<%=myNode%>"/>
            </jsp:include>
        </td>
        <%-- Left Column Ends --%>

        <%-- Center Column Begins --%>
        <TD class="statTableSpacer" width="100%" valign="top">

            <jsp:include page="page_title.jsp">
                <jsp:param name="image" value="<%=image%>"/>
                <jsp:param name="title" value="Coding Area"/>
            </jsp:include>

            <div style="float:right; padding: 0px 0px 0px 5px;">
                <ci:sponsorImage image="<%=Constants.SPONSOR_IMAGE%>" alt="Sponsor" border="0" ifNull="&#160;"/>
            </div>

            <% int count = ((Number) request.getAttribute(Constants.QUEUE_LENGTH)).intValue();%>

            Successful Submission.
            <% if (count == 0) { %>
            There are no submissions in the queue.
            <% } else if (count == 1) { %>
            There is 1 submission in the queue.
            <% } else { %>
            There are <%=count%> submissions in the queue.
            <% } %>

            <c:set value="<%=Constants.ROUND_ID%>" var="roundId"/>
            <c:set value="<%=Constants.CONTEST_ID%>" var="contestId"/>
            <c:set value="<%=Constants.COMPONENT_ID%>" var="componentId"/>

            <br/>
            <br/>
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewStandings&<%=Constants.ROUND_ID%>=<%=request.getAttribute(Constants.ROUND_ID)%>">View
                Standings</A>
            <br/>
            <br/>
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewQueue">View Queue</A>
            <br/>
            <br/>
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=Submit&amp;${roundId}=${requestScope[roundId]}&amp;${contestId}=${requestScope[contestId]}&amp;${componentId}=${requestScope[componentId]}">Submit
                Again</A>
            <br/><br/>
        <c:if test="${not empty mess}">
            <hr/>
            <span class="bodySubtitle">Messages</span><br>
            <textarea cols="70" rows="5" name="messages" class="messageTextArea" wrap="off" readonly>${mess}</textarea>
            <hr/><br/>
            
        </c:if>
        </TD>

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