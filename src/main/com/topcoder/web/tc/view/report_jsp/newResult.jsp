<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.common.web.data.report.*,
          com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
          com.topcoder.shared.dataAccess.resultSet.ResultColumn"

%>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants"%>
<%@ page import="com.topcoder.shared.dataAccess.QueryRequest"%>
<%@ page import="com.topcoder.shared.dataAccess.DataAccess"%>
<%@ page import="com.topcoder.shared.util.DBMS"%>
<%@ page import="com.topcoder.shared.dataAccess.QueryDataAccess"%>

<html>
  <head>
    <title>TopCoder Reporting II</title>
  </head>
  <body>
    <a href=<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY%>><< back to main menu<a><br/><br/>
    <center>
    <br/>
    <br/>
<%
    String command = request.getParameter(DataAccessConstants.COMMAND);
    QueryRequest qr = new QueryRequest();
    HashMap h = new HashMap();
    h.put("queries", "select q.name\n" +
"  from command c\n" +
"     , query q\n" +
"     , command_query_xref cqx\n" +
" where c.command_id = cqx.command_id\n" +
"   and q.query_id = cqx.query_id\n" +
"   and c.command_desc = '" + command + "'\n" +
" order by cqx.sort_order, q.query_id");
    qr.setQueries(h);
    QueryDataAccess da = new QueryDataAccess(request.getParameter("db")==null?DBMS.OLTP_DATASOURCE_NAME:request.getParameter("db"));
    ResultSetContainer queries = (ResultSetContainer)da.getData(qr).get("queries");

    Map results = (Map)request.getAttribute(Constants.REPORT_RESULT_KEY);
    ResultSetContainer rs = null;
    Map.Entry me = null;
    ResultSetContainer.ResultSetRow rsr = null;
    for (Iterator it = queries.iterator(); it.hasNext();) {
            rs = (ResultSetContainer)results.get(((ResultSetContainer.ResultSetRow)it.next()).getStringItem("name"));
            ResultColumn[] columns = rs.getColumns();
%>
    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="3" CELLSPACING="0">
      <TR><TD colspan="<%=columns.length%>" ALIGN="left"><FONT size="4"><b><%=me.getKey().toString()%> Results</b></FONT></TD></TR>
      <TR>
<%      for (int i=0; i<columns.length; i++) { %>
          <TD><b><%=columns[i].getName()%></b></TD>
<%      } %>
      </TR>
<%
      int k=0;
      for (Iterator rows = rs.iterator(); rows.hasNext(); k++) {
        if (k%2==1) {  %>
          <TR bgcolor="#ccffcc">
<%      } else { %>
          <TR>
<%      }
        rsr = (ResultSetContainer.ResultSetRow)rows.next();
        for (int j=0; j<columns.length; j++) {
%>
          <TD NOWRAP="true"><%=rsr.getItem(j).toString()%></TD>
<%      }  %>
        </TR>
<%
      }
%>
    </TABLE><BR/><BR/>
<%
    }
%>
    </center>
  </body>
</html>
