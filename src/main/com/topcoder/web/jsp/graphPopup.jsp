<%@ page 
  language="java"
  errorPage="/errorPage.jsp"
%>

<html>
  <head>
    <title>TopCoder</title>
  </head>
  <body bgcolor="#000000" background="/images/background_2.jpg" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" onLoad="focus()">
    <table>
      <tr>
        <td>
          <img src="/i/logo.gif" width="206" height="49"/>
        </td>
      </tr>
      <tr>
        <td>
          <img src="<%=request.getQueryString()%>" width="<%=request.getParameter("width")%>" height="<%=request.getParameter("height")%>"/>
        </td>
      </tr>
    </table>
  </body> 
</html>
