<%--
/**
 *  profile.jsp
 */
--%>
<%@  page
  language="java"
  errorPage="/errorPage.jsp"
  import="java.util.*,
          com.topcoder.common.web.data.report.*,
          com.topcoder.shared.dataAccess.resultSet.*"

%>


<html>
  <head>
    <title>TopCoder Reporting</title>
  </head>
  <body>
<%
    Map m = null;
    ResultSetContainer container = null;
    ResultSetContainer.ResultSetRow p = null;
    m = (Map)request.getAttribute(Constants.REPORT_PROFILE_SEARCH_KEY);
    //if (m!=null) {
      //container = (ResultSetContainer)m.get("Profile_Search");
      //p = container.getRow(0);
%>
  <FORM ACTION="/tc?module=ProfileSearch" METHOD="POST">
    <table cellpadding="0" cellspacing="0" border="0">
      <TR><TD><A HREF="<%=Constants.SERVLET_ADDR%>"><< back to main menu</A></TD></TR>
      <tr><td>Handle: <input type="text" name="handle" size="10"></td></tr>
    </table>
  </FORM>
  </body>
</html>



