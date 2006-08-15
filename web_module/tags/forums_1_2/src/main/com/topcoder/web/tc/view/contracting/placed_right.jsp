<%@ page import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
                 com.topcoder.web.tc.Constants, com.topcoder.shared.util.DBMS" %>
<%
    Request r = new Request();
    r.setContentHandle("recent_placement_top");
    DataAccessInt dai = new CachedDataAccess(60*60*1000, DBMS.OLTP_DATASOURCE_NAME);
    ResultSetContainer list = (ResultSetContainer)dai.getData(r).get("recent_placement_top");
%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<link type="text/css" rel="stylesheet" href="/css/tcStyles.css"/>
<table class="stat" cellpadding="0" cellspacing="0" width="170">
    <tr valign="middle">
        <td class="title" colspan="3">Recent Placements&#160;<a href="/tc?module=RecentPlacements">View all</a></td>
    </tr>
   <tr valign="middle">
        <td class="header">Member</td>
        <td class="headerR">Compensation</td>
    </tr>
   <rsc:iterator list="<%=list%>" id="resultRow">
        <tr class="dark">
            <td class="value"><tc-webtag:ratingColor rating='<%=resultRow.getIntItem("member_rating")%>'><rsc:item name="rating_color" row="<%=resultRow%>"/></tc-webtag:ratingColor></td>
            <td class="valueR"><rsc:item name="compensation" row="<%=resultRow%>"/></td>
        </tr>
   </rsc:iterator>
   </tbody>
</table>
