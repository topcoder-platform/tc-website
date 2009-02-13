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
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="result" type="java.util.List" scope="request"/>
<jsp:useBean id="systemTestCount" type="java.lang.Number" scope="request"/>
<jsp:useBean id="sortLinkBase" class="java.lang.String" scope="request"/>
<jsp:useBean id="prevPageLink" class="java.lang.String" scope="request"/>
<jsp:useBean id="nextPageLink" class="java.lang.String" scope="request"/>

<% String image = "long_comps_topcoder";%>

<html>
<head>
    <title>TopCoder</title>
<jsp:include page="/script.jsp" />
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
            <jsp:param name="node" value="long_queue"/>
         </jsp:include>
        </td>
        <%-- Left Column Ends --%>

        <%-- Center Column Begins --%>
        <TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

            <jsp:include page="page_title.jsp">
                <jsp:param name="image" value="<%=image%>"/>
                <jsp:param name="title" value="Queue Status"/>
            </jsp:include>
            
            <logic:notEqual name="systemTestCount" value="0">
	            <span class="bodySubtitle">System Tests Remaining: <%=systemTestCount%></span><br/><br/>
	        </logic:notEqual>    

            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
                            <tr>
                                <td class="tableTitle" colspan="6">Queue Status</td>
                            </tr>
                            <tr>
                                <td class="tableHeader" width="15%">
                                    Handle
                                </td>
                                <td class="tableHeader" width="15%">
                                    Contest
                                </td>
                                <td class="tableHeader" width="15%">
                                    Language
                                </td>
                                <td class="tableHeader" width="20%" align="center">
                                    Entered Queue
                                </td>
                                <td class="tableHeader" width="15%" align="right">
                                    Type
                                </td>
                                <td class="tableHeader" width="20%" align="right">
                                    Tests Remaining
                                </td>
                            </tr>
                            <% if (result.isEmpty()) { %>
                            <tr><td colspan="6" class="statDk">There are currently no submissions in the queue.</td></tr>
                            <% } %>
                            <%boolean even = true;%>
                            <logic:iterate collection="<%=result%>" id="resultRow" type="com.topcoder.server.ejb.TestServices.LongTestQueueStatusItem">
                                <tr>
                                    <td class="<%=even?"statLt":"statDk"%>" nowrap="nowrap">
                                        <tc-webtag:handle coderId='<%=resultRow.getUserId()%>'/>
                                    </td>
                                    <td class="<%=even?"statLt":"statDk"%>" nowrap="nowrap">
                                        <A href="?module=ViewStandings&rd=<%=resultRow.getRoundId()%>"><%=resultRow.getContestName()%> &gt; <%=resultRow.getRoundName()%></A>
                                    </td>
                                    <td class="<%=even?"statLt":"statDk"%>" nowrap="nowrap">
                                    	<%=resultRow.getLanguageName()%>
                                    </td>
                                    <td class="<%=even?"statLt":"statDk"%>" align="center">
                                        <tc-webtag:format object="<%=resultRow.getQueueDate()%>" format="MM.dd.yyyy HH:mm:ss"/>
                                    </td>
                                    <td class="<%=even?"statLt":"statDk"%>" align="right">
                                        <%=resultRow.getSubmissionType()%>
                                    </td>
                                    <td class="<%=even?"statLt":"statDk"%>" align="right">
                                        <%=resultRow.getCount()%>
                                    </td>
                                </tr>
                                <%even = !even;%>
                            </logic:iterate>
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