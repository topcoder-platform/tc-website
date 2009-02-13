<%@  page   
  contentType="text/html"
  import="com.topcoder.common.web.util.Conversion"
%>

<%
  String image = Conversion.checkNull ( request.getParameter("image") );
%>

<table border=0 cellspacing=0 cellpadding=0 width="100%">
    <tr>
        <td width="100%" class="pageTitle"><img border="0" src="/i/header_<%=image%>.gif" alt="<%=image%>"/></td>
    </tr>
    <tr>
        <td width="100%" class="pageSubtitle"><%=Conversion.checkNull(request.getParameter("title"))%></td>
    </tr>
</table>

