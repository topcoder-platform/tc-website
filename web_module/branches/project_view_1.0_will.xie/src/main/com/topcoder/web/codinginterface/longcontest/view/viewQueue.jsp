<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page
        language="java"

        %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<%@ taglib prefix="mm" tagdir="/WEB-INF/tags" %>
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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="script.jsp" />
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>
<% java.util.Map roundTypes = (java.util.Map) request.getAttribute("roundTypes"); %>

<jsp:include page="top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="includes/global_left.jsp">
            <jsp:param name="node" value="long_queue"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="left" class="bodyColumn">

            <jsp:include page="page_title.jsp">
                <jsp:param name="image" value="<%=image%>"/>
                <jsp:param name="title" value="Queue Status"/>
            </jsp:include>
            
            <logic:notEqual name="systemTestCount" value="0">
                <p align="center">System Tests Remaining: <strong><%=systemTestCount%></strong></p>
            </logic:notEqual>    

            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="stat">
            <tbody>
                <tr>
                    <td class="title" colspan="6">Queue Status</td>
                </tr>
                <tr>
                    <td class="header">
                        Handle
                    </td>
                    <td class="header">
                        Contest
                    </td>
                    <td class="header">
                        Language
                    </td>
                    <td class="headerC">
                        Entered Queue
                    </td>
                    <td class="headerR">
                        Type
                    </td>
                    <td class="headerR">
                        Tests Remaining
                    </td>
                </tr>
                <% if (result.isEmpty()) { %>
                <tr class="light">
                    <td colspan="6" class="valueC">
                        <div align="center" style="margin: 40px 0px 40px 0px;">
                            There are currently no submissions in the queue.
                        </div>
                    </td>
                </tr>
                <% } %>
                <%boolean even = true;%>
                <logic:iterate collection="<%=result%>" id="resultRow" type="com.topcoder.server.ejb.TestServices.LongTestQueueStatusItem">
                    <tr class="<%=even?"light":"dark"%>">
                        <td class="value" nowrap="nowrap">
                            <tc-webtag:handle context='marathon_match' coderId='<%=resultRow.getUserId()%>'/>
                        </td>
                        <td class="value" nowrap="nowrap">
							Contest name unavailable
                            <%-- COMMENTED OUT FOR NASA CHALLENGE
							<a href="?module=ViewStandings&amp;rd=<%=resultRow.getRoundId()%>">
                                <mm:contest roundName="<%=resultRow.getRoundName()%>" contestName="<%=resultRow.getContestName()%>" roundTypeId="<%= (Integer) roundTypes.get(new Integer(resultRow.getRoundId())) %>"/>
                            </a>
							--%>
                        </td>
                        <td class="value" nowrap="nowrap">
                            <%=resultRow.getLanguageName()%>
                        </td>
                        <td class="valueC">
                            <tc-webtag:format object="<%=resultRow.getQueueDate()%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/>
                        </td>
                        <td class="valueR">
                            <%=resultRow.getSubmissionType()%>
                        </td>
                        <td class="valueR">
                            <%=resultRow.getCount()%>
                        </td>
                    </tr>
                    <%even = !even;%>
                </logic:iterate>
            </tbody>
            </table>


        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>