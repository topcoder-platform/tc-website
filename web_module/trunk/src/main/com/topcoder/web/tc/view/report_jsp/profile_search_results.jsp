<%@  page
  language="java"
  errorPage="/errorPage.jsp"
  import="java.util.*,
          com.topcoder.common.web.data.report.*,
          com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    Map m = (Map)request.getAttribute(Constants.REPORT_PROFILE_SEARCH_RESULTS_KEY);
    ResultSetContainer results = (ResultSetContainer)m.get("results");
    List headers = (List)request.getAttribute("column_headers");
    Enumeration e = request.getParameterNames();
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
            <%=headers.get(Integer.parseInt(i))%>
        </td>
    </tc:counter>
    </tr>
    <rsc:iterator list="<%=results%>" id="resultRow">
        <tr>
            <tc:counter min="0" max="<%=results.getColumnCount()-1%>" id="i">
                <td>
                    <%=resultRow.getStringItem(Integer.parseInt(i))%>
                </td>
            </tc:counter>
        </tr>
    </rsc:iterator>
    </table>
    <form name="revise" action="tc" method="get">
        <logic:iterate name="<%=e%>" id="key">
            <logic:iterate name="<%=Arrays.asList(request.getParameterValues(key))%>" id="val">
                <input type="hidden" name="<%=e%>" value="<%=val%>">
            </logic:iterate>
        </logic:iterate>
    </form>
  </body>
</html>



