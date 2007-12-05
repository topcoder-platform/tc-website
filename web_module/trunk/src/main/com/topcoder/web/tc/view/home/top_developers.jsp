<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<% ResultSetContainer coders = (ResultSetContainer)request.getAttribute("top_developers");%>

<div>
<table cellpadding="0" cellspacing="0" class="rightNav" style="width: 100%;" onmouseover="goTall('t10Dev');">
    <tr>
        <td class="title" colspan="3">Development&nbsp;<A href="javascript:infoWindow('/tc?module=Static&d1=statistics&d2=info&d3=topRatedDevelopers')"><img src="/i/icon_help_blue.gif" alt="?" border="0"/></A></td>
    </tr>
    <tr>
        <td class="headerC">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td class="header" width="100%">Handle</td>
        <td class="headerR">Rating</td>
    </tr>
<tbody>
    <%int i = 0;%>
    <rsc:iterator list="<%=coders%>" id="resultRow">
    <tr>
        <td class="valueC"><rsc:item name="rank" row="<%=resultRow%>"/></td>
        <td class="value"><tc-webtag:handle coderId='<%=resultRow.getLongItem("coder_id")%>' context="development" /></td>
        <td class="valueR"><rsc:item name="rating" row="<%=resultRow%>" format="#"/></td>
    </tr>
    <%=(i==2 ? "</tbody><tbody class='hide' id='t10Dev'>" : "")%>
    <%i++;%>
    </rsc:iterator>
    <%=(i<3 ? "</tbody><tbody class='hide' id='t10Dev'>" : "")%>
    <tr>
        <td class="valueR" colspan="3"><strong><a href="/stat?c=top_developers" class="gMetal">View all</a></strong></td>
    </tr>
</tbody>
</table>
</div>
