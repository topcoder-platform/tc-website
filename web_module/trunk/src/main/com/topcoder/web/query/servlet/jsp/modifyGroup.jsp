<%@  page
  language="java"
  import= "com.topcoder.web.query.common.*,
           com.topcoder.web.query.request.*"
%>
<%@ taglib uri="/query-taglib.tld" prefix="query"%>
<jsp:useBean id="ModifyGroup" scope="request" class="com.topcoder.web.query.request.ModifyGroup" />
<jsp:useBean id="SessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo" />
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
    <tr><td colspan="6"><img src="/i/clear.gif" width="4" height="16"></td></TR>
    <tr>
      <td width="170" bgcolor="#000000" valign="top">
        <jsp:include page="left.jsp" flush="true">
          <jsp:param name="<%=Constants.DB_PARAM%>" value="<%=ModifyGroup.getDb()%>"/>
          <jsp:param name="<%=Constants.SERVLET_PATH_PARAM%>" value="<%=SessionInfo.getServletPath()%>"/>
        </jsp:include>      </td>
      <td width="4" bgcolor="#000000" valign="top"><img src="/i/clear.gif" width="4" height="8"></td>
      <td class="statText" width="100%" bgcolor="#000000" valign="top" ALIGN="left">
        <table width="40%" border="0" cellpadding="0" cellspacing="0">
          <FORM ACTION="<jsp:getProperty name="SessionInfo" property="ServletPath"/>" method="post" name="ModGroupForm" >
            <INPUT TYPE="hidden" NAME="<%=Constants.TASK_PARAM%>" VALUE="<%=Constants.MODIFY_GROUP_TASK%>">
            <INPUT TYPE="hidden" NAME="<%=Constants.GROUP_ID_PARAM%>" VALUE="<jsp:getProperty name="ModifyGroup" property="GroupId"/>">
            <INPUT TYPE="hidden" NAME="<%=Constants.STEP_PARAM%>" VALUE="<%=Constants.SAVE_STEP%>">
            <INPUT TYPE="hidden" NAME="<%=Constants.DB_PARAM%>" VALUE="<jsp:getProperty name="ModifyGroup" property="Db"/>">
            <tr><td class="statTextBig" colspan="2"><%=Constants.MODIFY_GROUP_NAME%></td></TR>
            <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></TR>
            <tr>
              <td class="statText" ALIGN="right">DB:&#160;</td>
              <td class="statText" ALIGN="left">
                  <jsp:getProperty name="ModifyGroup" property="Db"/>
              </td>
            </TR>
            <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></TR>
            <tr><td class="errorText" colspan="2"><query:error task="<%=ModifyGroup%>" key="<%=Constants.GROUP_ID_PARAM%>"/></td></TR>
            <tr><td class="errorText" colspan="2"><query:error task="<%=ModifyGroup%>" key="<%=Constants.GROUP_DESC_PARAM%>"/></td></TR>
            <tr>
              <td class="statText" ALIGN="right" width="50%">Name: </td>
              <td class="statText" ALIGN="left" width="50%">
                <input type="text" name="<%=Constants.GROUP_DESC_PARAM%>" value ="<jsp:getProperty name="ModifyGroup" property="GroupDesc" />" size="30" maxlength="100">
              </td>
            </TR>
            <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></TR>
            <tr>
              <td class="statText" ALIGN="center" colspan="2">
                <A href="javascript:void document.ModGroupForm.submit()" class="statText">
                  [save]
                </A>
              </td>
            </TR>
          <FORM>
        </table>
      </td>
      <td width="4" bgcolor="#000000"><img src="/i/clear.gif" width="4" height="1" border="0"></td>
      <td width="10" bgcolor="#000000" valign="top"><img src="/i/clear.gif" width="10" height="1" border="0"><BR>
      </td>
      <td width="25" bgcolor="#000000"><img src="/i/clear.gif" width="25" height="1" border="0"></td>
    </TR>
  </table>
  <jsp:include page="bottom.jsp" />
  </BODY>
</HTML>
