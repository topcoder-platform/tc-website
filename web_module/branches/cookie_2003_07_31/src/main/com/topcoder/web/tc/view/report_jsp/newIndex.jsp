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
        <LI><A HREF="<%=Constants.SERVLET_ADDR+"?"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=ComponentPricing&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Pricing Report</A></LI>
        <LI><A HREF="<%=Constants.SERVLET_ADDR+"?"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=inquiry_trend_report&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">TCS Inquiry Trend Report</A></LI>
        <LI><A HREF="<%=Constants.SERVLET_ADDR+"?"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=inquiries_last_week&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">TCS Inquiries in Last 7 days</A></LI>
        <LI><A HREF="<%=Constants.SERVLET_ADDR+"?"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=inquiry_detail&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">TCS Inquiry Detail Report</A></LI>
        <LI><A HREF="<%=Constants.SERVLET_ADDR+"?"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=Catalog_Totals&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Catalog Totals</A></LI>
        <LI><A HREF="<%=Constants.SERVLET_ADDR+"?"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=component_status&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Component Status</A></LI>
        <LI><A HREF="<%=Constants.SERVLET_ADDR+"?"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=Component_Downloads&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Component Downloads</A></LI>
        <LI><A HREF="<%=Constants.SERVLET_ADDR+"?"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=ComponentPricing&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Component Pricing</A></LI>
        <LI><A HREF="<%=Constants.SERVLET_ADDR+"?"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=Collegiate_Challenge_Sign-ups&"+Constants.DB_KEY+"="+Query.TRANSACTIONAL%>">Collegiate Challenge Sign-ups</A></LI>
        <LI><A HREF="<%=Constants.SERVLET_ADDR+"?"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=email_report&"+Constants.DB_KEY+"="+Query.TRANSACTIONAL%>">Email Tool Usage</A></LI>
        <LI><A HREF="<%=Constants.SERVLET_ADDR+"?"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=address_change_report&"+Constants.DB_KEY+"="+Query.TRANSACTIONAL%>">Address Change Report</A></LI>
      </UL>
      <br/>
      Submission Reports
      <UL>
        <LI><A HREF="<%=Constants.SERVLET_ADDR+"?"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=submissions&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Submission Detail</A></LI>
        <LI><A HREF="<%=Constants.SERVLET_ADDR+"?"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=submission_count&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Count Of Submissions</A></LI>
        <LI><A HREF="<%=Constants.SERVLET_ADDR+"?"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=submission_by_member&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Submissions ID to Handle</A></LI>
        <LI><A HREF="<%=Constants.SERVLET_ADDR+"?"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=upload_link&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Submissions URL</A></LI>
        <LI><A HREF="<%=Constants.SERVLET_ADDR+"?"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=submission_handle&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Submissions ID to Handle</A></LI>
      </UL>

  </body>
</html>
