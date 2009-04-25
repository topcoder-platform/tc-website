<%@  page
  language="java"
  import= "com.topcoder.web.query.common.*,
           com.topcoder.web.query.request.*"
%>
<%@ taglib uri="query-taglib.tld" prefix="query"%>
<jsp:useBean id="DBSelection" scope="request" class="com.topcoder.web.query.request.DBSelection" />
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>Query Tool</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" href="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" href="/css/coders.css"/>
  </HEAD>
  <BODY bgcolor="#000000" topmargin="0" marginheight="0" LEFTMARGIN="0" marginwidth="0"">
  <jsp:include page="top.jsp" />

  <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr><td colspan="6"><img src="/i/clear.gif" width="4" height="16"></td></tr>
    <tr>
      <td width="170" bgcolor="#000000" valign="top">
        <table width="170" border="0" cellpadding="0" cellspacing="0">
          <tr><td><img src="/i/clear.gif" width="170" height="8"></td></tr>
        </table>
      </td>
      <td width="4" bgcolor="#000000" valign="top"><img src="/i/clear.gif" width="4" height="8"></td>
      <td class="statText" width="100%" bgcolor="#000000" valign="top"><img src="/i/clear.gif" width="400" height="1" VSPACE="5" border="0"><BR>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr><td class="statTextBig"><%=Constants.DB_SELECTION_NAME%></td></tr>
          <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="16"></td></tr>
          <query:DBIterator id="db" list="<%=Constants.DB_LIST%>">
            <tr><td>
             <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.COMMAND_LIST_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="db" property="value"/>" class="statText">
                <jsp:getProperty name="db" property="displayName"/>
              </A>
            </td></tr>
          </query:DBIterator>
        </table>
      </td>
      <td width="4" bgcolor="#000000"><img src="/i/clear.gif" width="4" height="1" border="0"></td>
      <td width="10" bgcolor="#000000" valign="top"><img src="/i/clear.gif" width="10" height="1" border="0"><BR>
      </td>
      <td width="25" bgcolor="#000000"><img src="/i/clear.gif" width="25" height="1" border="0"></td>
    </tr>
  </table>
  <jsp:include page="bottom.jsp" />
  </BODY>
</HTML>
