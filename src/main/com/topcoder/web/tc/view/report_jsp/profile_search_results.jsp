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
<script language="javascript">
<!--
    function sort(i){
        document.revise['module'].value = 'ProfileSearch';
        document.revise['order'].value = i;
        document.revise.submit();
    }
    function revise(){
        document.revise['module'].value = 'LegacyReport';
        document.revise['t'].value = 'profile_search';
        document.revise.submit();
    }
    -->
</script>
    <title>TopCoder Reporting</title>
  </head>
  <body>
    <table>
    <tr>
    <tc:counter min="0" max="<%=results.getColumnCount()-1%>" id="i">
        <td>
            <a href="JavaScript:sort('<%=i%>')">
                <%=headers.get(Integer.parseInt(i))%>
            </a>
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
        <input type="hidden" name="t" value="">
        <input type="hidden" name="order" value="">
        <logic:iterate collection="<%=e%>" id="key">
            <logic:iterate collection="<%=Arrays.asList(request.getParameterValues(key.toString()))%>" id="val">
                <input type="hidden" name="<%=key%>" value="<%=val%>">
            </logic:iterate>
        </logic:iterate>
    </form>
    <a href="JavaScript:revise()">Revise query</a>
  </body>
</html>



