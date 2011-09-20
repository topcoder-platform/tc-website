<%@  page   
  contentType="text/html"
%>
<%@ page import="com.topcoder.web.common.StringUtils"%>

<%
  String image = StringUtils.checkNull ( request.getParameter("image") );
%>

<table cellspacing="0" cellpadding="0" class="pageTitleTable">
    <tr>
        <td width="100%" class="pageTitle"><img border="0" src="/i/header_<%=image%>.gif" alt="<%=image%>"/></td>
        <td align="right" class="pageSubtitle">&#160;<%=StringUtils.checkNull(request.getParameter("title"))%></td>
    </tr>
</table>

