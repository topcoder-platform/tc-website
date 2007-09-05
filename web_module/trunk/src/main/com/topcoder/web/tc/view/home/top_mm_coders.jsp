<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer mmcoders = (ResultSetContainer)request.getAttribute("top_mm_coders"); %>

<div id="topTenMM" style="display: none;">
<table cellpadding="0" cellspacing="0" class="rightNav" style="width: 100%;">
<tbody>
    <tr>
        <td class="title" colspan="3">Marathon Match&nbsp;<A href="javascript:infoWindow('/tc?module=Static&d1=statistics&d2=info&d3=topRatedMMCoders')"><img src="/i/icon_help_blue.gif" alt="?" border="0"/></A></td>
    </tr>
    <tr>
        <td class="headerC">&nbsp;</td>
        <td class="header">Handle</td>
        <td class="headerR">Rating</td>
    </tr>
    <%boolean even = true;%>
    <rsc:iterator list="<%=mmcoders%>" id="resultRow">
    <tr>
        <td class="valueC"><rsc:item name="rank" row="<%=resultRow%>"/></td>
        <td class="value"><tc-webtag:handle coderId='<%=resultRow.getLongItem("coder_id")%>' context="marathon_match"/></td>
        <td class="valueR"><rsc:item name="rating" row="<%=resultRow%>"/></td>
    </tr>
    <%even = !even;%>
    </rsc:iterator>
    <tr>
        <td class="valueR" colspan="3"><strong><a href="/longcontest/stats/?module=CoderRank" class="gMetal">View all</a></strong></td>
    </tr>
</tbody>
</table>
</div>
