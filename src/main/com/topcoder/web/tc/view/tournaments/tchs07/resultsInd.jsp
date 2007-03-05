<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.common.tag.HandleTag" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("tchs07_alg_adv_overview"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/coders.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tchs07.css"/>
    <title>TopCoder High School 2007</title>
</head>
<body>

<div align="center" style="background: transparent;">
    <div class="content">
        <img src="/i/tournament/tchs07/contentN.png" alt="contentN" style="display: block;"/>

        <jsp:include page="links.jsp">
            <jsp:param name="tabLev1" value="resultsInd"/>
            <jsp:param name="tabLev2" value=""/>
            <jsp:param name="tabLev3" value=""/>
        </jsp:include>

        <div class="contentSpacer">
            <h2>Individual Results</h2>

            <table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
                <thead>
                    <tr>
                        <td class="title" colspan="8">
                            Individual Results
                        </td>
                    </tr>
                    <tr>
                        <td class="header">
                            Handle
                        </td>
                        <td class="header">
                            Team
                        </td>
                        <td class="headerC">
                            Region
                        </td>
                        <td class="headerC" nowrap="nowrap">
                            Round 1
                        </td>
                        <td class="headerC" nowrap="nowrap">
                            Round 2
                        </td>
                        <td class="headerC" nowrap="nowrap">
                            Round 3
                        </td>
                        <td class="headerC">
                            Semifinals
                        </td>
                        <td class="headerC">
                            Finals
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <%boolean even = false;%>
                    <rsc:iterator list="<%=rsc%>" id="resultRow">
                        <tr>
                            <td class="<%=even?"advanceDk":"advanceLt"%>">
                                <tc-webtag:handle coderId='<%=resultRow.getLongItem("coder_id")%>' context="<%=HandleTag.HS_ALGORITHM%>"/>
                            </td>
                            <td class="<%=even?"advanceDkC":"advanceLtC"%>">
                                <rsc:item name="team_name" row="<%=resultRow%>"/>
                            </td>
                            <td class="<%=even?"advanceDkC":"advanceLtC"%>">
                                <rsc:item name="region_name" row="<%=resultRow%>"/>
                            </td>
                            <% if (StringUtils.checkNull(resultRow.getStringItem("round1")).equals("Eliminated")) { %>
                            <td class="<%=even?"eliminateDkC":"eliminateLtC"%>">
                                <rsc:item name="round1" row="<%=resultRow%>"/>
                            </td>
                            <% } else { %>
                            <td class="<%=even?"advanceDkC":"advanceLtC"%>">
                                <rsc:item name="round1" row="<%=resultRow%>"/>
                            </td>
                            <% } %>
                            <% if (StringUtils.checkNull(resultRow.getStringItem("round2")).equals("Eliminated")) { %>
                            <td class="<%=even?"eliminateDkC":"eliminateLtC"%>">
                                <rsc:item name="round2" row="<%=resultRow%>"/>
                            </td>
                            <% } else { %>
                            <td class="<%=even?"advanceDkC":"advanceLtC"%>">
                                <rsc:item name="round2" row="<%=resultRow%>"/>
                            </td>
                            <% } %>
                            <% if (StringUtils.checkNull(resultRow.getStringItem("round3")).equals("Eliminated")) { %>
                            <td class="<%=even?"eliminateDkC":"eliminateLtC"%>">
                                <rsc:item name="round3" row="<%=resultRow%>"/>
                            </td>
                            <% } else { %>
                            <td class="<%=even?"advanceDkC":"advanceLtC"%>">
                                <rsc:item name="round3" row="<%=resultRow%>"/>
                            </td>
                            <% } %>
                            <% if (StringUtils.checkNull(resultRow.getStringItem("semi")).equals("Eliminated")) { %>
                            <td class="<%=even?"eliminateDkC":"eliminateLtC"%>">
                                <rsc:item name="semi" row="<%=resultRow%>"/>
                            </td>
                            <% } else { %>
                            <td class="<%=even?"advanceDkC":"advanceLtC"%>">
                                <rsc:item name="semi" row="<%=resultRow%>"/>
                            </td>
                            <% } %>
                            <% if (StringUtils.checkNull(resultRow.getStringItem("final")).equals("Eliminated")) { %>
                            <td class="<%=even?"eliminateDkC":"eliminateLtC"%>">
                                <rsc:item name="final" row="<%=resultRow%>"/>
                            </td>
                            <% } else { %>
                            <td class="<%=even?"advanceDkC":"advanceLtC"%>">
                                <rsc:item name="final" row="<%=resultRow%>"/>
                            </td>
                            <% } %>
                        </tr>
                        <%even = !even;%>
                    </rsc:iterator>
                </tbody>
            </table>

        </div>
        <div class="footer">
            Copyright &#169; 2000-2006, TopCoder, Inc. All rights reserved.
        </div>
        <img src="/i/tournament/tchs07/contentS.png" alt="contentS" style="display: block;"/>
    </div>
</div>

</body>
</html>

