<%@  page
  language="java"
  import= "com.topcoder.web.query.common.*,
           com.topcoder.web.query.request.*"
%>
<%@ taglib uri="query-taglib.tld" prefix="query"%>
<jsp:useBean id="ModifyCommandQuery" scope="request" class="com.topcoder.web.query.request.ModifyCommandQuery" />
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

  <table bgcolor="#000000" width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr><td colspan="6"><img src="/i/clear.gif" width="4" height="16"></td></tr>
    <tr>
      <td width="170" valign="top">
        <jsp:include page="left.jsp"/>
              </td>
      <td width="4" bgcolor="#000000" valign="top"><img src="/i/clear.gif" width="4" height="8"></td>
      <td class="statText" width="100%" valign="top" ALIGN="left">
        <table width="80%" border="0" cellpadding="0" cellspacing="0">
          <FORM ACTION="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="post" name="ModifyCommandQueryForm" >
            <INPUT TYPE="hidden" NAME="<%=Constants.TASK_PARAM%>" VALUE="<%=Constants.MODIFY_COMMAND_QUERY_TASK%>">
            <INPUT TYPE="hidden" NAME="<%=Constants.COMMAND_ID_PARAM%>" VALUE="<jsp:getProperty name="ModifyCommandQuery" property="commandId"/>">
            <INPUT TYPE="hidden" NAME="<%=Constants.STEP_PARAM%>" VALUE="<%=Constants.SAVE_STEP%>">
            <INPUT TYPE="hidden" NAME="<%=Constants.DB_PARAM%>" VALUE="<jsp:getProperty name="ModifyCommandQuery" property="db"/>">
            <tr><td class="statTextBig" colspan="2"><%=Constants.MODIFY_COMMAND_QUERY_NAME%></td></tr>
            <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
            <tr><td class="statTextBig" colspan="2" ALIGN="center">Command: <jsp:getProperty name="ModifyCommandQuery" property="commandDesc"/></td></tr>
            <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
            <tr>
              <td class="statText" ALIGN="center" colspan="2">DB: <jsp:getProperty name="ModifyCommandQuery" property="db"/></td>
            </tr>
            <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
            <tr><td class="errorText" colspan="2"><query:error id="err" name="<%=Constants.COMMAND_ID_PARAM%>"><%=err%></query:error></td></tr>
            <tr>
              <td colspan="2">
                <table width="100%" bgcolor="#000000" border="0" cellpadding="0" cellspacing="0">
                  <tr bgcolor="#333333">
                    <td class="statTextBig"></td>
                    <td class="statTextBig">Query</td>
                    <td class="statTextBig">Sort Order</td>
                    <td class="statTextBig"></td>
                  </tr>
                  <tr><td colspan="4"><img src="/i/clear.gif" width="4" height="8"></td></tr>
                  <query:commandQueryIterator id="commandQuery" list="<%=ModifyCommandQuery.getCurrentQueryList()%>">
                    <tr><td class="errorText" colspan="4"><query:error id="err" name="<%=Constants.SORT_ORDER_PARAM+commandQuery.getQueryId()%>"><%=err%></query:error></td></tr>
                    <tr>
                      <td class="statTextBig">
                        <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_QUERY_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="ModifyCommandQuery" property="db"/>&<%=Constants.QUERY_ID_PARAM%>=<jsp:getProperty name="commandQuery" property="queryId"/>" class="statText">
                          [edit]
                        </A>
                      </td>
                      <td class="statTextBig"><jsp:getProperty name="commandQuery" property="queryName"/></td>
                      <td class="statTextBig">
                        <input type="text" name="<%=Constants.SORT_ORDER_PARAM+commandQuery.getQueryId()%>" value ="<jsp:getProperty name="commandQuery" property="sortOrder"/>" size="3" maxlength="3"/>
                      </td>
                      <td class="statTextBig">
                        <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_COMMAND_QUERY_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="ModifyCommandQuery" property="db"/>&<%=Constants.COMMAND_ID_PARAM%>=<jsp:getProperty name="ModifyCommandQuery" property="commandId"/>&<%=Constants.QUERY_ID_PARAM%>=<jsp:getProperty name="commandQuery" property="queryId"/>&<%=Constants.STEP_PARAM%>=<%=Constants.REMOVE_STEP%>" class="statText">
                          [remove]
                        </A>
                      </td>
                    </tr>
                  <tr><td colspan="4"><img src="/i/clear.gif" width="4" height="8"></td></tr>
                  </query:commandQueryIterator>
                  <tr>
                    <td class="statTextBig" colspan="7" ALIGN="center">
                        <A href="javascript: void document.ModifyCommandQueryForm.submit()" class="statText">
                          [save]
                        </A>
                    </td>
                  </tr>
                  <tr><td colspan="4"><img src="/i/clear.gif" width="4" height="8"></td></tr>
                </table>
              </td>
            </tr>
           <tr><td class="errorText" colspan="2"><query:error id="err" name="<%=Constants.QUERY_ID_PARAM%>"><%=err%></query:error></td></tr>
           <tr>
             <td class="statTextBig" colspan="2" ALIGN="center">
               <query:querySelect name="<%=Constants.QUERY_ID_PARAM%>" styleClass="dropdown" list="<%=ModifyCommandQuery.getOtherQueryList()%>" size="30" multiple="false"/>
             </td>
           </tr>
           <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
           <tr>
             <td class="statTextBig" colspan="2" ALIGN="center">
               <A href="javascript: document.ModifyCommandQueryForm.<%=Constants.STEP_PARAM%>.value='<%=Constants.NEW_STEP%>';void document.ModifyCommandQueryForm.submit();" class="statText">
                 [add]
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
