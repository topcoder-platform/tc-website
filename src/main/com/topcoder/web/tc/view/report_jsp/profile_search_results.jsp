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
    Map m = (Map)request.getAttribte("XYZ");
    Iterator it = m.keySet().iterator();
    while(it.hasNext()){
        String key = it.next();
        String[] s = (String[])key;
        out.print("<tr><td>"+key+"</td><td>{");
        for(int i = 0; i<s.length; i++){
            if(i == 0)
                out.print(s[i]);
            else
                out.print(", "+s[i]);
        }
        out.print("</td></tr>\n");
    }
%>
</table>
  </body>
</html>



