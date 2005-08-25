<%@  page
  language="java"
  import= "com.topcoder.web.query.common.*,
           com.topcoder.web.query.request.*"
%>
<%@ taglib uri="query-taglib.tld" prefix="query"%>
<jsp:useBean id="ModifyQuery" scope="request" class="com.topcoder.web.query.request.ModifyQuery" />
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
      <td class="statText" width="100%" bgcolor="#000000" valign="top">
        <table width="60%" border="0" cellpadding="0" cellspacing="0">
          <FORM ACTION="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="post" name="ModQueryForm" >
            <INPUT TYPE="hidden" NAME="<%=Constants.TASK_PARAM%>" VALUE="<%=Constants.MODIFY_QUERY_TASK%>">
            <INPUT TYPE="hidden" NAME="<%=Constants.QUERY_ID_PARAM%>" VALUE="<jsp:getProperty name="ModifyQuery" property="queryId"/>">
            <INPUT TYPE="hidden" NAME="<%=Constants.STEP_PARAM%>" VALUE="<%=Constants.SAVE_STEP%>">
            <INPUT TYPE="hidden" NAME="<%=Constants.DB_PARAM%>" VALUE="<jsp:getProperty name="ModifyQuery" property="db"/>">
            <tr><td class="statTextBig" colspan="2"><%=Constants.MODIFY_QUERY_NAME%></td></tr>
            <% if (!ModifyQuery.isNewQuery()) { %>
              <tr><td colspan="2" ALIGN="center">
                <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_QUERY_INPUT_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="ModifyQuery" property="db"/>&<%=Constants.QUERY_ID_PARAM%>=<jsp:getProperty name="ModifyQuery" property="queryId"/>" class="statText">
                  [edit query input]
                </A>
              </TD</tr>
              <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
            <% } %>
            <tr>
              <td class="statText" ALIGN="right">DB:&#160;</td>
              <td class="statText" ALIGN="left">
                  <jsp:getProperty name="ModifyQuery" property="db"/>
              </td>
            </tr>
            <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
            <tr><td class="errorText" colspan="2"><query:error id="err" name="<%=Constants.QUERY_NAME_PARAM%>"><%=err%></query:error></td></tr>
             <tr>
              <td class="statText" ALIGN="right" width="50%">Name: </td>
              <td class="statText" ALIGN="left" width="50%">
                <input type="text" name="<%=Constants.QUERY_NAME_PARAM%>" value ="<jsp:getProperty name="ModifyQuery" property="name" />" size="30" maxlength="100"/>
              </td>
            </tr>
            <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
            <tr>
              <td class="statText" ALIGN="right">Ranking: </td>
              <td class="statText" ALIGN="left">
                <query:booleanSelect name="<%=Constants.RANKING_PARAM%>" styleClass="bodyText" selectedValue='<%=ModifyQuery.isRanking()?"true":"false"%>'/>
              </td>
            </tr>
            <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
            <tr><td class="errorText" colspan="2"><query:error id="err" name="<%=Constants.COLUMN_INDEX_PARAM%>"><%=err%></query:error></td></tr>
            <tr>
              <td class="statText" ALIGN="right" width="50%">Column Index: </td>
              <td class="statText" ALIGN="left" width="50%">
                <input type="text" name="<%=Constants.COLUMN_INDEX_PARAM%>" value ="<jsp:getProperty name="ModifyQuery" property="columnIndex" />" size="3" maxlength="3"/>
              </td>
            </tr>
            <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
            <tr><td class="errorText" colspan="2"><query:error id="err" name="<%=Constants.QUERY_TEXT_PARAM%>"><%=err%></query:error></td></tr>
            <tr>
              <td class="statText" ALIGN="left" colspan="2">Query Text:<BR/>
                <TEXTAREA COLS="80" ROWS="30" WRAP="off" NAME="<%=Constants.QUERY_TEXT_PARAM%>"><jsp:getProperty name="ModifyQuery" property="text"/></TEXTAREA>
              </td>
            </tr>
            <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
            <tr>
              <td class="statText" ALIGN="center" colspan="2">
                <A href="javascript:void document.ModQueryForm.submit()" class="statText">
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
