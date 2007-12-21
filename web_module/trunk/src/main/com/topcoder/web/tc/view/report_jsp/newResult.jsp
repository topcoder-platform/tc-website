<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ page import="com.topcoder.common.web.data.report.Constants"%>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants"%>
<%@ page import="com.topcoder.shared.dataAccess.QueryDataAccess"%>
<%@ page import="com.topcoder.shared.dataAccess.QueryRequest"%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.DBMS" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.tc.controller.request.report.CSVResults" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=utf-8" %>

<html>
  <head>
    <title>TopCoder Reporting II</title>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
      <link type="text/css" rel="stylesheet" href="/css/tcStyles.css">
      <style type="text/css">

      table tr.odd  {
        background: #E5E5E5;
      }

      table tr.even {
        background: #D5D5D5;
      }

      table tr.odd:hover,
      table tr.even:hover {
        background: #CCFFCC;
      }


      </style>

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
    ResultSetContainer rs;
    ResultSetContainer.ResultSetRow query;
    for (Object query1 : queries) {
        query = (ResultSetContainer.ResultSetRow) query1;
        rs = (ResultSetContainer) results.get(query.getStringItem("name"));
%>
        <table id="datatable" border="1" cellpadding="0" cellspacing="0" class="stat" width="100%">
            <TR>
                <TD colspan="<%=rs.getColumns().length%>" ALIGN="left">
                    <FONT size="4"><b><%=query.getStringItem("name")%> Results</b></FONT>
                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=CSVResults&amp;<%=DataAccessConstants.COMMAND%>=<%=command%>&amp;db=${param['db']}&amp;<%=CSVResults.QUERY_NAME%>=<%=query.getStringItem("name")%>">Download as CSV (Excel)</a>
                    </TD>
            </TR>
            <TR>
                <% for (int i = 0; i < rs.getColumns().length; i++) {%>
                <TD><b>
                    <% if (rs.getColumnInfo(i).getType()==Types.DECIMAL ||
                    rs.getColumnInfo(i).getType()== Types.NUMERIC ||
                    rs.getColumnInfo(i).getType()== Types.FLOAT) { %>
                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="<%=i%>" descColumn="<%=i%>"/>&amp;<%=DataAccessConstants.SORT_QUERY%>=<%=query.getStringItem("name")%>"><%= StringUtils.replace(rs.getColumns()[i].getName(), "_", " ")%></a>
                    <% } else { %>
                    <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="<%=i%>" ascColumn="<%=i%>"/>&amp;<%=DataAccessConstants.SORT_QUERY%>=<%=query.getStringItem("name")%>"><%= StringUtils.replace(rs.getColumns()[i].getName(), "_", " ")%></a>
                     <% } %>
                </b></TD>
                <% } %>
            </TR>
            <%
                boolean even = true;
                ResultSetContainer.ResultSetRow r;
                for (Object r1 : rs) {
                    r = (ResultSetContainer.ResultSetRow) r1;%>
            <tr class="<%=even?"even":"odd"%>">
                <%
                    for (int j = 0; j < rs.getColumns().length; j++) {
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
