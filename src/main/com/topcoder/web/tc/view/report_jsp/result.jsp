<%--                   
/**
 *  result.jsp
 */
--%>
<%@  page 
  language="java"
  import="java.util.*,
          com.topcoder.common.web.data.report.*"

%>

<%
  Report r = null;
  ReportNode reports = null;
  String[] columnHeadings = null;
  ArrayList a = null;
  Boolean processed = (Boolean)request.getAttribute(Constants.PROCESSED_KEY);
  if (processed==null || !processed.booleanValue()) {
    String dest = Constants.SERVLET_ADDR + "?" + request.getQueryString();
%>
    <jsp:forward page="<%=dest%>"/>
<%
  } else {
    reports = (ReportNode)request.getAttribute(Constants.REPORT_LIST_KEY);
    r = (Report)reports.findReport(new Integer(request.getParameter(Constants.REPORT_ID_KEY)));
    columnHeadings = r.getColumnHeadings();
    a = r.getResult();
  }
    
%>

<html>
  <head>
    <title>TopCoder Reporting</title>
  </head>
  <body>
   <a href=<%=Constants.SERVLET_ADDR%>><< back to main menu<a><br/><br/>
    <center>
    <font size="4">
      <b>
<%=
      r.getTitle()
%>
      </b>
    </font>
    <br/>
    <br/>
    <table cellpadding="0" cellspacing="0" border="1" > 
<%
    if (columnHeadings != null) {
%>
      <tr>
<%
      for (int i=0; i<columnHeadings.length; i++) {
%>
        <td>
          <b>
<%=
        columnHeadings[i]
%>
          </b>
        </td>
<%
      }
%>
      </tr>
<%
    }
%>

<%
    for (int i=0; i<a.size(); i++) {
      if (i%2 == 1)
%>
      <tr bgcolor="#ccffcc">
<%
        else
%>
        <tr>
<%
      ResultItem[] results = (ResultItem[])a.get(i);
      for (int j=0; j<results.length; j++) {
        if (results[j] instanceof FloatResult || results[j] instanceof IntResult)
%>
        <td align="right">
<%     
        else
%>
        <td>
<%=
          (results[j].toString()==null||results[j].toString().length()==0)?"&#160;":results[j].toString() 
%>
        </td>
<%    
      }
%>
      </tr>      
<%
    }
%>
    </table>
    </center>
  </body> 
</html>

