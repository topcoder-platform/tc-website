<%@  page
  language="java"
  import="java.util.*,
          weblogic.security.acl.Security,
          com.topcoder.common.web.data.report.Constants,
          com.topcoder.shared.dataAccess.DataAccessConstants,
          com.topcoder.common.web.data.report.Query"

%>


<html>
  <head>
    <title>TopCoder Reporting</title>
  </head>
  <body>
      <font size="6">
        <b>
          TopCoder Reporting II
        </b>
      </font
      <br/>
      <br/>
      <br/>
      <a href=<%=Constants.SERVLET_ADDR%>><< back to regular reporting page<a><br/><br/>
      <br/>
      <br/>
      <br/>
      <UL>
        <LI><A HREF="<%=Constants.SERVLET_ADDR+"?"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=user_list&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">User List</A></LI>
      </UL>


  </body>
</html>