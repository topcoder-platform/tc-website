<%@  page   
  contentType="text/html"
  import="com.topcoder.common.web.util.Conversion"
%>

<%
  String image = Conversion.checkNull ( request.getParameter("image") );
%>

<table cellspacing=0 class=pageTitleTable>
    <tr>
        <td width="100%" class=pageTitle><img border=0 src="/i/header_<%=image%>.gif" alt="<%=image%>"/></td><td align=right class=pageSubtitle>&#160;<%=Conversion.checkNull(request.getParameter("title"))%></td>
    </tr>
</table>

