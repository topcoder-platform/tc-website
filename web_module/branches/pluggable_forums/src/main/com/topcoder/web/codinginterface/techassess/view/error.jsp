<%@ page import="com.topcoder.web.common.BaseServlet"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html>
<head>
<title>Technical Assessment</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="/css/screening.css" >
</head>
<body>

<% if (exception == null) exception = (Exception)request.getAttribute("exception");
   //if (exception!=null) exception.printStackTrace();
   String message = (String)request.getAttribute(BaseServlet.MESSAGE_KEY);
    String url = (String)request.getAttribute(BaseServlet.URL_KEY);
 %>

<table class=bodyCenter cellspacing=0 cellpadding=0>
   <tr>
      <td align=center>


<%-- TABS --%>
      <jsp:include page="tabs.jsp" >
      <jsp:param name="tabLev1" value="error"/>
      </jsp:include>

<%-- TITLE/CLOCK --%>
      <jsp:include page="time.jsp" >
      <jsp:param name="timer" value="off"/>
      </jsp:include>

      <table cellspacing=0 cellpadding=0 class=bodyTable>
         <tr>
            <td><img src="/i/corp/screening/bodyTL.gif" alt=""/></td>
            <td class=bodyT><img src="/i/corp/screening/clear.gif" alt=""/></td>
            <td><img src="/i/corp/screening/bodyTR.gif" alt=""/></td>
         </tr>
         <tr>
            <td class=bodyL>&#160;</td>
<%-- CONTENT --%>
            <td class=bodyContent>

            <p class=pL>
            <span class=bodyBigTitle>Page Error</span>
            <br /><br />

            <%=message==null?"An error has occurred when attempting to process your request.":message%>
            <br /><br />
            <% if (url!=null) { %>
                Please <a href="<%=url%>">go back</a> to the last page you were viewing.
                <br /><br />
            <% } %>
            If you have a question or comment please email <a href="mailto:service@topcoder.com">service@topcoder.com</a>.
            </p>

            </td>
            <td class=bodyR>&#160;</td>
         </tr>
         <tr>
            <td><img src="/i/corp/screening/bodyBL.gif" alt=""/></td>
            <td class=bodyB>&#160;</td>
            <td><img src="/i/corp/screening/bodyBR.gif" alt=""/></td>
         </tr>
      </table>


      </td>
   </tr>
</table>

</body>
</html>