<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<% ResultSetContainer countries = (ResultSetContainer)request.getAttribute("Country_Avg_Rating");%>

<table width="100%" border="0" cellspacing="0" cellpadding="3" bgcolor="#555555">
    <tr valign="middle">
        <td class="statTextBig" width="1%" nowrap="0">&#160;Countries</td>
        <td class="statTextBig" width="15"><A href="javascript:openWin('/tc?&amp;module=Static&amp;d1=statistics&amp;d2=info&amp;d3=topCountries','countryrankinfo', 500,500)" class="statTextBig"><img src="/i/icon_help_blue.gif" alt="?" width="15" height="11" border="0"/></A></td>
        <td class="statTextBig" align="right" width="99%"><a href="/stat?c=country_avg_rating" class="statTextBig">View all</a>&#160;</td>
    </tr>
</table>
<table border="0" cellspacing="0" cellpadding="3" width="100%" bgcolor="#333333">
    <tr valign="middle">
        <td align="center" background="/i/graybv_lite_bg.gif" class="statText" width="10%">&#160;Rank</td>
        <td align="left" background="/i/graybv_lite_bg.gif" class="statText" width="45%">Name</td>
        <td align="right" background="/i/graybv_lite_bg.gif" class="statText" width="45%">Rating</td>
    </tr>
    <% boolean even = true;%>
    <rsc:iterator list="<%=countries%>" id="resultRow">
        <tr>
            <td align="right" class="<%=even?"formHandleEven":"formHandleOdd"%>"><rsc:item name="rank" row="<%=resultRow%>"/>&#160;&#160;&#160;</td>
            <td align="left" class="<%=even?"formHandleEven":"formHandleOdd"%>" nowrap="nowrap"><rsc:item name="name" row="<%=resultRow%>"/></td>
            <td align="right" class="<%=even?"formHandleEven":"formHandleOdd"%>" nowrap="nowrap"><rsc:item name="avg_rating" row="<%=resultRow%>"/></td>
        </tr>
        <% even = !even;%>
    </rsc:iterator>
</table>