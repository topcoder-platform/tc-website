<%--                   
/**
 *  profile.jsp
 */
--%>
<%@  page 
  language="java"
  import="java.util.*,
          com.topcoder.common.web.data.report.*"

%>

<%
  ReportNode reportList = null;
  Report report = null;
  Integer reportId = null;
  Parameter[] parameters = null;
  String GET_REPORT_ADDR = Constants.SERVLET_ADDR +  "?" + Constants.TASK_NAME_KEY + "=" + Constants.REPORT_RESULT_KEY + "&" + Constants.REPORT_ID_KEY + "=" + request.getParameter(Constants.REPORT_ID_KEY);
  reportList = (ReportNode)request.getAttribute(Constants.REPORT_LIST_KEY);
  reportId = new Integer(request.getParameter(Constants.REPORT_ID_KEY));
  report = reportList.findReport(reportId);
  parameters = report.getParameters();
%>  

<html>
  <head>
    <title>TopCoder Reporting</title>
  </head>
  <body>
    <a href=<%=Constants.SERVLET_ADDR%><< back to main menu<a><br/><br/>
    <form name="paramForm" method="get" action="<%=Constants.SERVLET_ADDR%>">
      <input type="hidden" name="<%=Constants.TASK_NAME_KEY%>" value="<%=Constants.REPORT_RESULT_KEY%>"/>
      <input type="hidden" name="<%=Constants.REPORT_ID_KEY%>" value="<%=request.getParameter(Constants.REPORT_ID_KEY)%>"/>
      <table cellpadding="0" cellspacing="0" border="0" > 
        <tr>
          <td colspan="3">
            <b>Enter Report Parameters</b>
          </td>
        </tr>
        <tr><td><br/><br/></td></tr>
  <%
    for (int i=0; i<parameters.length; i++) {
%>
        <tr>
          <td>
            <b><%=parameters[i].getDisplayName()%>:</b>
          </td>
          <td>
            &#160;&#160;&#160;
          </td>
          <td>
            <input type="text" name="<%=parameters[i].getColumnName()%>" size="15" maxlength="20"/>
          </td>
        </tr>
<%
    }
%>
        <tr><td><br/></td></tr>
        <tr><td colspan="3"><center><a href="Javascript:document.paramForm.submit()">Submit</a></center></td></tr>
      </table>
    </form>
  </body> 
</html>


