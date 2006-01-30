<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ page import="com.topcoder.web.common.tag.HandleTag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="struts-bean.tld" prefix="bean" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>

<% //common code that pulls out the request bean.
Request srb = (Request) request.getAttribute("REQUEST_BEAN");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>TopCoder Statistics</title>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
    </head>

    <body>

        <jsp:include page="../top.jsp">
            <jsp:param name="level1" value=""/>
        </jsp:include>

        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
            <!-- Left Column Begins-->
            <td width="180">
                <jsp:include page="../includes/global_left.jsp">
                    <jsp:param name="level1" value="development"/>
                    <jsp:param name="level2" value="components"/>
                </jsp:include>
            </td>
            <!-- Left Column Ends -->

            <!-- Center Column Begins -->
            <TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">
            <TABLE>
            <TR VALIGN="middle">
                <TD>
                    Contest
                </TD>
                <TD>
                    Division I winner
                </TD>
                <TD>
                    (Div I wins)
                </TD>
                <TD>
                    Division II winner
                </TD>
                <TD>
                    (Div II wins)
                </TD>
            </TR>
            <logic:present name="QUERY_RESPONSE" scope="request">
                <bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>
                <logic:iterate name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map.Entry" scope="request">
                    <logic:equal name="queryEntries" property="key" value="srm_division_wins">
                        <logic:present name="queryEntries" property="value">
                            <bean:define id="resultSet" name="queryEntries" property="value" type="ResultSetContainer" />
                            <logic:iterate name="resultSet" id="resultRow" type="ResultSetContainer.ResultSetRow">
                                <tr>
                                    <%
                                    Number n1 = (Number)resultRow.getItem(1).getResultData();
                                    Number n2 = (Number)resultRow.getItem(3).getResultData();
                                    long winner1 = (n1 == null ? -1 : n1.longValue()),
                                            winner2 = (n2 == null ? -1 : n2.longValue());
                                    %>
                                    <td><bean:write name="resultRow" property='<%= "item[" + 0 /* contest name */ + "]" %>'/></td>

                                    <% if (winner1 == -1) { %>
                                    <td>(none)</td><td></td>
                                    <% } else { %>
                                    <td><tc-webtag:handle coderId='<%= winner1 %>' context='<%=HandleTag.ALGORITHM%>'/></td>
                                    <td><bean:write name="resultRow" property='<%= "item[" + 2 /* #wins 1 */ + "]" %>'/></td>
                                    <% } %>

                                    <% if (winner2 == -1) { %>
                                    <td>(none)</td><td></td>
                                    <% } else { %>
                                    <td><tc-webtag:handle coderId='<%= winner2 %>' context='<%=HandleTag.ALGORITHM%>'/></td>
                                    <td><bean:write name="resultRow" property='<%= "item[" + 4 /* #wins 2 */ + "]" %>'/></td>
                                    <% } %>
                                </tr>
                            </logic:iterate>
                        </logic:present>
                    </logic:equal>
                </logic:iterate>
            </logic:present>
        </table>
            </td>
            <!-- Center Column Ends -->

            <!-- Right Column Begins -->
            <td width="170">
                <jsp:include page="../public_right.jsp">
                    <jsp:param name="level1" value="privatelabel"/>
                </jsp:include>
            </td>
            <!-- Right Column Ends -->

            <!-- Gutter -->
            <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
            <!-- Gutter Ends -->
        </tr>
        </table>

        <jsp:include page="../foot.jsp"/>

    </body>

</html>
