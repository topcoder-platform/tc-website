<%--
/**
 *  index.jsp
 */
--%>
<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.common.web.data.report.*"

%>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%!
  private String getSpaces(int s) {
    StringBuffer buf = new StringBuffer(s);
    for (int i=0; i<s; i++)
      buf.append("&#160;");
    return buf.toString();
  }
%>

<%!
  private String printTree(ReportNode node, StringBuffer buf) {
    String GET_REPORT_ADDR = Constants.SERVLET_ADDR +  "&" + Constants.TASK_NAME_KEY + "=" + Constants.REPORT_RESULT_KEY + "&" + Constants.REPORT_ID_KEY + "=";
    ReportNode child = null;
    for (int i=0; i<node.getChildCount(); i++) {
      child = (ReportNode)node.getChildAt(i);
      if (child.isLeaf() && child.getContents() instanceof Report) {
        buf.append("<li><a href=");
        buf.append(GET_REPORT_ADDR);
        buf.append(((Report)child.getContents()).getId());
        buf.append(">");
        buf.append(child.getContents().toString());
        buf.append("<a></li>");
      } else {
        if (child.getContents() instanceof Report) {
          buf.append("<li><a href=");
          buf.append(GET_REPORT_ADDR);
          buf.append(((Report)child.getContents()).getId());
          buf.append(">");
          buf.append(child.getContents().toString().replace('_',' '));
          buf.append("<a></li>");
        } else {
          buf.append("<b>" + child.getContents().toString() + "</b>");
        }
        buf.append("<ul>");
        printTree(child, buf);
        buf.append("</ul>");
      }
    }
    return buf.toString();
  }

%>


<%
  ReportNode reportList = null;
  Boolean processed = (Boolean)request.getAttribute(Constants.PROCESSED_KEY);
  if (processed==null || !processed.booleanValue()) {
    String dest = Constants.SERVLET_ADDR + "&" + Constants.TASK_NAME_KEY + "=" + Constants.REPORT_LIST_KEY;
%>
    <jsp:forward page="<%=dest%>"/>
<%
  } else {
    reportList = (ReportNode)request.getAttribute(Constants.REPORT_LIST_KEY);
  }

%>

<html>
  <head>
    <title>TopCoder Reporting</title>
  </head>
  <body>
      <font size="6">
        <b>
          TopCoder Reporting
        </b>
      </font
      <br/>
      <br/>
      <br/>
      <a href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?module=Static&d1=report_jsp&d2=newIndex">Additional Reports<a><br/><br/>

      <b>Profile Information<b><br/>
      <ul><li><a href=<%=Constants.SERVLET_ADDR + "&" + Constants.TASK_NAME_KEY + "=" + Constants.REPORT_PROFILE_LIST_MENU_KEY%>>Profile List<a></li></ul>
      <ul><li><a href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?module=ProfileSearch&t=profile_search">Super Mega Profile Search<a></li></ul>
      <ul><li><a href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?module=Static&d1=report_jsp&d2=profile">Profile Look Up<a></li></ul>
      <ul><li><a href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?module=Static&d1=report_jsp&d2=tcs_profile">TCS Profile Look Up<a></li></ul>
     <!-- <ul><li><a href=<%=Constants.JSP_ADDR + "&"+Constants.TASK_NAME_KEY+"=" + Constants.REPORT_PROFILE_LIST_MENU_KEY%>>Profile List<a></li></ul>-->

<%=
       printTree(reportList, new StringBuffer())
%>
  </body>
</html>

