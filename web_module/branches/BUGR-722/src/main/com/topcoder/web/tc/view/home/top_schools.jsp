<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<% ResultSetContainer schools = (ResultSetContainer)request.getAttribute("School_Avg_Rating");%>

<div id="topTenAlgoSchools" style="display: none;">
<table cellpadding="0" cellspacing="0" class="rightNav" style="width: 100%;">
<tbody>
    <tr>
        <td class="title" colspan="3">Algorithm Schools&nbsp;<A href="javascript:openWin('/tc?module=Static&d1=statistics&d2=info&d3=topSchools','schoolrankinfo', 500,500)"><img src="/i/icon_help_blue.gif" alt="?" border="0"/></A></td>
    </tr>
    <tr>
        <td class="headerC">&nbsp;</td>
        <td class="header">School</td>
        <td class="headerR">Rating</td>
    </tr>
    <%boolean even = true;%>
    <rsc:iterator list="<%=schools%>" id="resultRow">
    <tr>
        <td class="valueC"><rsc:item name="rank" row="<%=resultRow%>"/></td>
        <td class="value"><strong><rsc:item name="name" row="<%=resultRow%>"/></strong></td>
        <td class="valueR"><rsc:item name="avg_rating" row="<%=resultRow%>"/></td>
    </tr>
    <%even = !even;%>
    </rsc:iterator>
    <tr>
        <td class="valueR" colspan="3"><strong><a href="/stat?c=school_avg_rating" class="gMetal">View all</a></strong></td>
    </tr>
</tbody>
</table>
</div>