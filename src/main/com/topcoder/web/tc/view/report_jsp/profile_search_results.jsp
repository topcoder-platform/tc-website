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
</script>
  </head>
  <body>
  <table>
<%
    String s = (String)request.getAttribute("XYZ");
    out.print(s);
%>
</table>
  </body>
</html>



