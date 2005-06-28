<%@  page
  language="java"
  import= "com.topcoder.web.query.common.*,
           com.topcoder.web.query.request.*"
%>
<%@ taglib uri="query-taglib.tld" prefix="query"%>
<jsp:useBean id="ModifyInput" scope="request" class="com.topcoder.web.query.request.ModifyInput" />
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
        <jsp:include page="left.jsp"/>
        </td>
      <td width="4" bgcolor="#000000" valign="top"><img src="/i/clear.gif" width="4" height="8"></td>
      <td class="statText" width="100%" bgcolor="#000000" valign="top" ALIGN="left">
        <table width="60%" border="0" cellpadding="0" cellspacing="0">
          <FORM ACTION="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="post" name="ModInputForm" >
            <INPUT TYPE="hidden" NAME="<%=Constants.TASK_PARAM%>" VALUE="<%=Constants.MODIFY_INPUT_TASK%>">
            <INPUT TYPE="hidden" NAME="<%=Constants.INPUT_ID_PARAM%>" VALUE="<jsp:getProperty name="ModifyInput" property="inputId"/>">
            <INPUT TYPE="hidden" NAME="<%=Constants.STEP_PARAM%>" VALUE="<%=Constants.SAVE_STEP%>">
            <INPUT TYPE="hidden" NAME="<%=Constants.DB_PARAM%>" VALUE="<jsp:getProperty name="ModifyInput" property="db"/>">
            <tr><td class="statTextBig" colspan="2"><%=Constants.MODIFY_INPUT_NAME%></td></tr>
            <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
            <tr>
              <td class="statText" ALIGN="right">DB:&#160;</td>
              <td class="statText" ALIGN="left">
                  <jsp:getProperty name="ModifyInput" property="db"/>
              </td>
            </tr>
            <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
            <tr><td class="errorText" colspan="2"><query:error id="err" name="<%=Constants.INPUT_ID_PARAM%>"><%=err%></query:error></td></tr>
            <tr><td class="errorText" colspan="2"><query:error id="err" name="<%=Constants.INPUT_DESC_PARAM%>"><%=err%></query:error></td></tr>
            <tr>
              <td class="statText" ALIGN="right" width="50%">Description: </td>
              <td class="statText" ALIGN="left" width="50%">
                <input type="text" name="<%=Constants.INPUT_DESC_PARAM%>" value ="<jsp:getProperty name="ModifyInput" property="inputDesc" />" size="30" maxlength="100">
              </td>
            </tr>
            <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
            <tr><td class="errorText" colspan="2"><query:error id="err" name="<%=Constants.INPUT_CODE_PARAM%>"><%=err%></query:error></td></tr>
            <tr>
              <td class="statText" ALIGN="right">Code: </td>
              <td class="statText" ALIGN="left">
                <input type="text" name="<%=Constants.INPUT_CODE_PARAM%>" value ="<jsp:getProperty name="ModifyInput" property="inputCode" />" size="10" maxlength="30">
              </td>
            </tr>
            <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
            <tr><td class="errorText" colspan="2"><query:error id="err" name="<%=Constants.DATA_TYPE_ID_PARAM%>"><%=err%></query:error></td></tr>
            <tr>
              <td class="statText" ALIGN="right">Data Type: </td>
              <td class="statText" ALIGN="left">
                <query:dataTypeSelect name="<%=Constants.DATA_TYPE_ID_PARAM%>" styleClass="dropdown" selectedValue='<%=""+ModifyInput.getDataTypeId()%>'/>
              </td>
            </tr>
            <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
            <tr>
              <td class="statText" ALIGN="center" colspan="2">
                <A href="javascript:void document.ModInputForm.submit()" class="statText">
                  [save]
                </A>
              </td>
            </tr>
          <FORM>
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
