<%@ page import="com.topcoder.shared.dataAccess.Request,
                 com.topcoder.shared.dataAccess.DataAccessInt,
                 com.topcoder.shared.dataAccess.CachedDataAccess,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Iterator"%>
<%
    Request r = new Request();
    r.setContentHandle("top_downloads");
    DataAccessInt dai = new CachedDataAccess(60*60*1000, "java:InformixDS");
    ResultSetContainer rsc = (ResultSetContainer)dai.getData(r).get("top_downloads");
%>


<table cellspacing="0" cellpadding="0" width="170">
    <tr><td colspan="2"><img src="/images/clear.gif" width="1" height="6" border="0" alt=""></td></tr>
    <tr><td colspan="2" align="right"><img src="/images/right_nav_top.gif" border="0" alt=""></td></tr>
    <tr><td class="topsTitle" colspan="2">Top 10 Most Downloaded Components*</td></tr>
    <tr>
        <td class="topsTitle">Name</td>
        <td class="topsTitle" align="right">DL's</td>
    </tr>
        <%
            ResultSetContainer.ResultSetRow row = null;
            for (Iterator it = rsc.iterator(); it.hasNext();) {
                row = (ResultSetContainer.ResultSetRow)it.next();
        %>
            <tr>
                <td class="topsText"><A href="/"><%=row.getStringItem("component_name")%></A></td>
                <td class="topsText" align="right"><%=row.getIntItem("num_downloads")%></td>
            </tr>
        <%
            }
        %>
    <tr><td colspan="2"><img src="/images/right_nav_btm.gif" border="0" alt=""></td></tr>
</table>
<div align="right" class="small">*over the last 60 days</div>