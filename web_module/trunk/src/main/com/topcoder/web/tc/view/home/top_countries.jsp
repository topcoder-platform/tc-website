<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.tc.Constants"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<% ResultSetContainer countries = (ResultSetContainer)request.getAttribute("Country_Avg_Rating");%>

<div>
<table cellpadding="0" cellspacing="0" class="rightNav" style="width: 100%;" onmouseover="goTall('t10AlgoCountries');">
<tbody>
    <tr>
        <td class="title" colspan="3">Algorithm Countries&nbsp;<A href="javascript:openWin('/tc?module=Static&d1=statistics&d2=info&d3=topCountries','countryrankinfo', 500,500)"><img src="/i/icon_help_blue.gif" alt="?" border="0"/></A></td>
    </tr>
    <tr>
        <td class="headerC">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td class="header" width="100%">Country</td>
        <td class="headerR">Rating</td>
    </tr>
<tbody>
    <%int i = 0;%>
    <rsc:iterator list="<%=countries%>" id="resultRow">
    <tr>
        <td class="valueC"><rsc:item name="rank" row="<%=resultRow%>"/></td>
        <td class="value"><strong><a class="gMetal" href="/tc?module=AlgoRank&<%=Constants.COUNTRY_CODE%>=<rsc:item name="country_code" row="<%=resultRow%>"/>"><rsc:item name="name" row="<%=resultRow%>"/></a></strong></td>
        <td class="valueR"><rsc:item name="avg_rating" row="<%=resultRow%>"/></td>
    </tr>
    <%=(i==2 ? "</tbody><tbody class='hide' id='t10AlgoCountries'>" : "")%>
    <%i++;%>
    </rsc:iterator>
    <%=(i<3 ? "</tbody><tbody class='hide' id='t10AlgoCountries'>" : "")%>
    <tr>
        <td class="valueR" colspan="3"><strong><a href="/stat?c=country_avg_rating" class="gMetal">View all</a></strong></td>
    </tr>
</tbody>
</table>
</div>