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
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>


<html>
  <head>
    <title>TopCoder Reporting</title>
  </head>
  <body>
<%
    Map m = null;
    ResultSetContainer.ResultSetRow p;
    m = (Map)request.getAttribute(Constants.REPORT_PROFILE_SEARCH_KEY);
    ResultSetContainer states = (ResultSetContainer)m.get("state_list");
    ResultSetContainer countries = (ResultSetContainer)m.get("country_list");
%>
  <FORM ACTION="/tc?module=ProfileSearch" METHOD="POST">
    <table cellpadding="0" cellspacing="0" border="0">
      <TR><TD><A HREF="<%=Constants.SERVLET_ADDR%>"><< back to main menu</A></TD></TR>
      <tr><td>Handle: <input type="text" name="handle" size="15"></td></tr>
      <tr><td>E-Mail: <input type="text" name="email" size="15"></td></tr>
      <tr><td>First Name: <input type="text" name="firstname" size="15"></td></tr>
      <tr><td>Last Name: <input type="text" name="lastname" size="15"></td></tr>
      <tr><td>Zipcode: <input type="text" name="zipcode" size="5"></td></tr>
      <tr><td>City: <input type="text" name="city" size="15"></td></tr>
      <tr><td>Company: <input type="text" name="company" size="15"></td></tr>
         <rsc:iterator list="<%=states%>" id="resultRow">
           <rsc:item name="state_code" row="<%=resultRow%>"/>
         </rsc:iterator>
    </table>
  </FORM>
  </body>
</html>



