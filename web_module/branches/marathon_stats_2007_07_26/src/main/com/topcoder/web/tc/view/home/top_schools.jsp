<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<% ResultSetContainer schools = (ResultSetContainer)request.getAttribute("School_Avg_Rating");%>

<div id="topTenAlgoSchools" style="display: none;">
<table cellpadding="0" cellspacing="0" class="rightNav" style="width: 100%;">
<tbody>
    <tr>
        <td class="title" colspan="3">Algorithm Schools</td>
    </tr>
    <tr>
        <td class="headerC">&nbsp;</td>
        <td class="header">School</td>
        <td class="headerR">Rating</td>
    </tr>
    <%boolean even = true;%>
    <rsc:iterator list="<%=schools%>" id="resultRow">
    <tr class="<%=even?"light":"dark"%>">
        <td class="valueC"><rsc:item name="rank" row="<%=resultRow%>"/></td>
        <td class="value"><strong><rsc:item name="name" row="<%=resultRow%>"/></strong></td>
        <td class="valueR"><rsc:item name="avg_rating" row="<%=resultRow%>"/></td>
    </tr>
    <%even = !even;%>
    </rsc:iterator>
</tbody>
</table>
</div>

<%--
<table width="100%" border="0" cellspacing="0" cellpadding="3" bgcolor="#555555">
    <tr valign="middle">
        <td class="statTextBig" width="1%" nowrap="0">&#160;Schools</td>
        <td class="statTextBig" width="15"><A href="javascript:openWin('/tc?module=Static&d1=statistics&d2=info&d3=topSchools','schoolrankinfo', 500,500)" class="statTextBig"><img src="/i/icon_help_blue.gif" alt="?" width="15" height="11" border="0"/></A></td>
        <td class="statTextBig" align="right" width="99%"><a href="/stat?c=school_avg_rating" class="statTextBig">View all</a>&#160;</td>
    </tr>
</table>
<table border="0" cellspacing="0" cellpadding="3" width="100%" bgcolor="#333333">
    <tr valign="middle">
        <td align="center" background="/i/graybv_lite_bg.gif" class="statText" width="10%">&#160;Rank</td>
        <td align="left" background="/i/graybv_lite_bg.gif" class="statText" width="45%">Name</td>
        <td align="right" background="/i/graybv_lite_bg.gif" class="statText" width="45%">Rating</td>
    </tr>
    <% boolean even = true;%>
    <rsc:iterator list="<%=schools%>" id="resultRow">
        <tr>
            <td align="right" class="formHandleEven"><rsc:item name="rank" row="<%=resultRow%>"/>&#160;&#160;&#160;</td>
            <td align="left" class="formHandleEven" ><strong><rsc:item name="name" row="<%=resultRow%>"/></strong></td>
            <td align="right" class="formHandleEven" ><rsc:item name="avg_rating" row="<%=resultRow%>"/></td>
        </tr>
        <% even = !even;%>
    </rsc:iterator>
</table>
--%>