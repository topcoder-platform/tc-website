<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.common.web.data.report.*,
          com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
          com.topcoder.shared.dataAccess.resultSet.ResultColumn"

%>

<html>
  <head>
    <title>TopCoder Reporting II</title>
  </head>
  <body>
    <a href=<%=Constants.SERVLET_ADDR+"?"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY%>><< back to main menu<a><br/><br/>
    <center>
    <br/>
    <br/>
<%
        Map results = (Map)request.getAttribute(Constants.REPORT_RESULT_KEY);
        ResultSetContainer rs = null;
        Map.Entry me = null;
        ResultSetContainer.ResultSetRow rsr = null;
        for (Iterator it = results.entrySet().iterator(); it.hasNext(); ) {
            me = (Map.Entry)it.next();
            rs = (ResultSetContainer)me.getValue();
            ResultColumn[] columns = rs.getColumns();
%>
    <B><%=me.getKey().toString()%></B><BR/>
    <TABLE WIDTH="60%" HEIGHT="100%" BORDER="1" CELLPADDING="0" CELLSPACING="0">
      <TR><TD><FONT size="4"><b>Results</b></FONT></TD></TR>
      <TR>
        <TD></TD>
<%      for (int i=0; i<columns.length; i++) { %>
          <TD><b><%=columns[i].getName()%></b></TD>
<%      } %>
        <TD></TD>
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
          <TD><%=rsr.getItem(j).toString()%>"></TD>
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
