<%@  page   
  contentType="text/html"
  import="com.topcoder.common.web.util.Conversion"
%>

<%
  String image = Conversion.checkNull ( request.getParameter("image") );
  String image1 = Conversion.checkNull ( request.getParameter("image1") );

  if ( image1.equals("steelblue") ) {
    image1 = "/i/steelblue_top_left1.gif";
  } else {
    image1 = "/i/table_top_left1.gif";
  }
%>

<table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr valign="bottom">
    <td valign="top" width="11"><img width="11" height="26" border="0" src="/i/spacer.gif"/></td>
    <td valign="top" width="75" align="left"><img width="180" height="26" border="0" src="/i/header_<%=image%>.gif" alt="<%=image%>"/></td>
    <td class="bodyTextBold" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><span class="bodySubhead"><%=Conversion.checkNull(request.getParameter("title"))%></span></td>
    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="26" border="0"/></td>
  </tr>

</table>

