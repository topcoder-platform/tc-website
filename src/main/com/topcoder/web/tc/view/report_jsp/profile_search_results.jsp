<%@  page
  language="java"
  errorPage="/errorPage.jsp"
  import="java.util.*,
          com.topcoder.common.web.data.report.*,
          com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="rsc" %>
<%
    Map m = (Map)request.getAttribute(Constants.REPORT_PROFILE_SEARCH_RESULTS_KEY);
    ResultSetContainer results = (ResultSetContainer)m.get("results");
    List headers = (List)request.get("column_headers");
%>


<html>
  <head>
    <title>TopCoder Reporting</title>
</script>
  </head>
  <body>
    <table>
    <tr>
    <tc:counter min="0" max="<%=results.getColumnCount()-1%>" id="i">
        <td>
            <%=headers.get(i)%>
        </td>
    </tc:counter>
    </tr>
    <rsc:iterator list="<%=results%>" id="resultRow">
        <tr>
            <tc:counter min="0" max="<%=results.getColumnCount()-1%>" id="i">
                <td>
                    <%=resultRow.getStringItem(i)%>
                </td>
            </tc:counter>
        </tr>
    </rsc:iterator>
  </body>
</html>



