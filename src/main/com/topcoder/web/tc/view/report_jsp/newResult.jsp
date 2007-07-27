<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants"%>
<%@ page import="com.topcoder.shared.dataAccess.QueryRequest"%>
<%@ page import="com.topcoder.shared.util.DBMS"%>
<%@ page import="com.topcoder.shared.dataAccess.QueryDataAccess"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultColumn" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.topcoder.common.web.data.report.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>

<html>
  <head>
    <title>TopCoder Reporting II</title>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
      <link type="text/css" rel="stylesheet" href="/css/tcStyles.css">
  </head>
  <body>
    <a href="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY%>">&lt;&lt; back to main menu<a><br/><br/>
    <center>
    <br/>
    <br/>
<%
    String command = request.getParameter(DataAccessConstants.COMMAND);
    QueryRequest qr = new QueryRequest();
    HashMap h = new HashMap();
    h.put("queries", "select q.name, cqx.sort_order, q.query_id\n" +
            "  from command c\n" +
            "     , query q\n" +
            "     , command_query_xref cqx\n" +
            " where c.command_id = cqx.command_id\n" +
            "   and q.query_id = cqx.query_id\n" +
            "   and c.command_desc = '" + command + "'\n" +
            " order by cqx.sort_order, q.query_id");
    qr.setQueries(h);
    QueryDataAccess da = new QueryDataAccess(request.getParameter("db") == null ? DBMS.OLTP_DATASOURCE_NAME : request.getParameter("db"));
    ResultSetContainer queries = da.getData(qr).get("queries");

    Map results = (Map) request.getAttribute(Constants.REPORT_RESULT_KEY);
    ResultSetContainer rs = null;
    for (ResultSetContainer.ResultSetRow query : queries) {
        rs = (ResultSetContainer) results.get(query.getStringItem("name"));
        ResultColumn[] columns = rs.getColumns();
%>
        <table id="datatable" border="1" cellpadding="0" cellspacing="0" class="stat" width="100%">
            <TR>
                <TD colspan="<%=columns.length%>" ALIGN="left"><FONT size="4"><b><%=query.getStringItem("name")%>
                    Results</b></FONT></TD>
            </TR>
            <TR>
                <% for (ResultColumn column : columns) { %>
                <TD><b><%=column.getName()%>
                </b></TD>
                <% } %>
            </TR>
            <%
                boolean even = true;
                for (ResultSetContainer.ResultSetRow r : rs) { %>
            <tr class="<%=even?"light":"dark"%>">
                <%
                    for (int j = 0; j < columns.length; j++) {
                %>
                <td class="value" nowrap="nowrap"><%=r.getItem(j).toString()%>
                </td>
                <% } %>
            </tr>
            <%
                    even = !even;
                }
            %>
        </table>
        <BR/><BR/>
        <%
            }
        %>
    </center>
  </body>
</html>
