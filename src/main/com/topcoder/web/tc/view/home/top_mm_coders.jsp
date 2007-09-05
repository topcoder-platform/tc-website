<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer mmcoders = (ResultSetContainer)request.getAttribute("top_mm_coders"); %>

<table width="180" border="0" cellspacing="0" cellpadding="3" bgcolor="#555555">
    <tr valign="middle">
        <td class="statTextBig" width="1%" nowrap="0">&#160;Marathon</td>
        <td class="statTextBig" width="15"><A href="javascript:infoWindow('/tc?module=Static&d1=statistics&d2=info&d3=topRatedMMCoders')" class="statTextBig"><img src="/i/icon_help_blue.gif" alt="?" width="15" height="11" border="0"/></A></td>
        <td class="statTextBig" align="right" width="99%"><a href="/longcontest/stats/?module=CoderRank" class="statTextBig">View all</a>&#160;</td>
    </tr>
</table>
<table border="0" cellspacing="0" cellpadding="3" width="180" bgcolor="#333333">
    <tr valign="middle">
        <td align="center" background="/i/graybv_lite_bg.gif" class="statText" width="10%">&#160;Rank</td>
        <td align="left" background="/i/graybv_lite_bg.gif" class="statText" width="45%">Handle</td>
        <td align="right" background="/i/graybv_lite_bg.gif" class="statText" width="45%">Rating</td>
    </tr>
    <% boolean even= true; %>
    <rsc:iterator list="<%=mmcoders%>" id="resultRow">
        <tr>
            <td align="right" class="formHandleEven"><rsc:item name="rank" row="<%=resultRow%>"/>&#160;&#160;&#160;</td>
            <td align="left" class="formHandleEven" nowrap="nowrap"><tc-webtag:handle coderId='<%=resultRow.getLongItem("coder_id")%>' context="marathon_match"/></td>
            <td align="right" class="formHandleEven" nowrap="nowrap"><rsc:item name="rating" row="<%=resultRow%>"/></td>
        </tr>
        <% even = !even;%>
    </rsc:iterator>
</table>