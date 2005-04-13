<%@  page
  contentType="text/html"
  import="com.topcoder.web.common.StringUtils"
%>

<%
  String image = StringUtils.checkNull ( request.getParameter("image") );
  String image1 = StringUtils.checkNull ( request.getParameter("image1") );

  if ( image1.equals("steelblue") ) {
    image1 = "/i/steelblue_top_left1.gif";
  } else {
    //image1 = "/i/table_top_left1.gif";
      image1 = "/i/clear.gif";
  }
%>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
  <TR>
    <TD VALIGN="top" WIDTH="11" ALIGN="right"><IMG WIDTH="11" HEIGHT="26" BORDER="0" SRC="<%=image1%>"/></TD>
    <TD VALIGN="top" WIDTH="75" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" SRC="/i/header_<%=image%>.gif" ALT="<%=image%>"/></TD>
    <TD CLASS="bodyTextBold" VALIGN="middle" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR>&#160;<SPAN CLASS="bodySubhead">&#160;&#160;<%=StringUtils.checkNull(request.getParameter("title"))%>&#160;&#160;</SPAN></TD>
    <TD VALIGN="top" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"/></TD>
  </TR>

</TABLE>

