<%@  page
  language="java"
  import= "com.topcoder.web.query.common.*,
           com.topcoder.web.query.request.*"
%>
<%@ taglib uri="/query-taglib.tld" prefix="query"%>
<jsp:useBean id="ModifyQueryInput" scope="request" class="com.topcoder.web.query.request.ModifyQueryInput" />
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
    <tr><td colspan="6"><img src="/i/clear.gif" width="4" height="16"></td></tr>    <tr>
      <td width="170" valign="top">
        <jsp:include page="left.jsp" flush="true">
          <jsp:param name="<%=Constants.DB_PARAM%>" value="<%=ModifyQueryInput.getDb()%>"/>
          <jsp:param name="<%=Constants.SERVLET_PATH_PARAM%>" value="<%=sessionInfo.getServletPath()%>"/>
        </jsp:include>      </td>
      <td width="4" bgcolor="#000000" valign="top"><img src="/i/clear.gif" width="4" height="8"></td>
      <td class="statText" width="100%" valign="top" ALIGN="left">
        <table width="80%" border="0" cellpadding="0" cellspacing="0">
          <FORM ACTION="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="post" name="ModQueryInputForm" >
            <INPUT TYPE="hidden" NAME="<%=Constants.TASK_PARAM%>" VALUE="<%=Constants.MODIFY_QUERY_INPUT_TASK%>">
            <INPUT TYPE="hidden" NAME="<%=Constants.QUERY_ID_PARAM%>" VALUE="<jsp:getProperty name="ModifyQueryInput" property="QueryId"/>">
            <INPUT TYPE="hidden" NAME="<%=Constants.STEP_PARAM%>" VALUE="<%=Constants.SAVE_STEP%>">
            <INPUT TYPE="hidden" NAME="<%=Constants.DB_PARAM%>" VALUE="<jsp:getProperty name="ModifyQueryInput" property="Db"/>">
            <tr><td class="statTextBig" colspan="2"><%=Constants.MODIFY_QUERY_INPUT_NAME%></td></tr>
            <tr><td class="errorText" colspan="2"><query:error id="err" name="<%=Constants.INPUT_ID_PARAM%>"><%=err%></query:error></td></tr>
            <tr><td class="errorText" colspan="2"><query:error id="err" name="<%=Constants.QUERY_ID_PARAM%>"><%=err%></query:error></td></tr>
            <tr><td class="statTextBig" colspan="2" ALIGN="center">Query: <jsp:getProperty name="ModifyQueryInput" property="QueryName"/></td></tr>
            <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
            <tr>
              <td class="statText" ALIGN="center" colspan="2">DB: <jsp:getProperty name="ModifyQueryInput" property="Db"/></td>
            </tr>
            <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
            <tr>
              <td colspan="2">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr bgcolor="#333333">
                    <td class="statTextBig"></td>
                    <td class="statTextBig">Input Code</td>
                    <td class="statTextBig">Input Desc</td>
                    <td class="statTextBig">Sort</td>
                    <td class="statTextBig">Optional?</td>
                    <td class="statTextBig">Default Value</td>
                    <td class="statTextBig"></td>
                  </tr>
                  <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
                  <query:queryInputIterator id="queryInput" list="<%=ModifyQueryInput.getCurrentInputList()%>">
                    <tr><td class="errorText" colspan="7"><query:error id="err" name="<%=Constants.SORT_ORDER_PARAM+queryInput.getInputId()%>"><%=err%></query:error></td></tr>
                    <tr><td class="errorText" colspan="7"><query:error id="err" name="<%=Constants.OPTIONAL_PARAM+queryInput.getInputId()%>"><%=err%></query:error></td></tr>
                    <tr><td class="errorText" colspan="7"><query:error id="err" name="<%=Constants.DEFAULT_VALUE_PARAM+queryInput.getInputId()%>"><%=err%></query:error></td></tr>
                    <tr>
                      <td class="statTextBig">
                        <A href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_INPUT_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="ModifyQueryInput" property="Db"/>&<%=Constants.INPUT_ID_PARAM%>=<jsp:getProperty name="queryInput" property="InputId"/>" class="statText">
                          [edit]
                        </A>
                      </td>
                      <td class="statTextBig"><jsp:getProperty name="queryInput" property="InputCode"/></td>
                      <td class="statTextBig"><jsp:getProperty name="queryInput" property="InputDesc"/></td>
                      <td class="statTextBig">
                        <input type="text" name="<%=Constants.SORT_ORDER_PARAM+queryInput.getInputId()%>" value ="<jsp:getProperty name="queryInput" property="SortOrder"/>" size="3" maxlength="3"/>
                      </td>
                      <td class="statTextBig">
                        <query:booleanSelect name="<%=Constants.OPTIONAL_PARAM+queryInput.getInputId()%>" class="dropdown" selectedValue='<%=queryInput.isOptional()?"true":"false"%>'/>
                      <td class="statTextBig">
                        <input type="text" name="<%=Constants.DEFAULT_VALUE_PARAM+queryInput.getInputId()%>" value ="<jsp:getProperty name="queryInput" property="DefaultValue"/>" size="30" maxlength="100"/>
                      </td>
                      <td class="statTextBig">
                        <A href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_QUERY_INPUT_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="ModifyQueryInput" property="Db"/>&<%=Constants.INPUT_ID_PARAM%>=<jsp:getProperty name="queryInput" property="InputId"/>&<%=Constants.QUERY_ID_PARAM%>=<jsp:getProperty name="ModifyQueryInput" property="QueryId"/>&<%=Constants.STEP_PARAM%>=<%=Constants.REMOVE_STEP%>" class="statText">
                          [remove]
                        </A>
                      </td>
                    </tr>
                    <tr><td colspan="7"><img src="/i/clear.gif" width="4" height="8"></td></tr>
                  </query:queryInputIterator>
                  <tr>
                    <td class="statTextBig" colspan="7" ALIGN="center">
                        <A href="javascript: void document.ModQueryInputForm.submit()" class="statText">
                          [save]
                        </A>
                    </td>
                  </tr>
                  <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
                </table>
              </td>
           </tr>
           <tr>
             <td class="statTextBig" colspan="2" ALIGN="center">
               <query:inputSelect name="<%=Constants.INPUT_ID_PARAM%>" class="dropdown" list="<%=ModifyQueryInput.getOtherInputList()%>" size="30" multiple="false"/>
             </td>
           </tr>
           <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
           <tr>
             <td class="statTextBig" colspan="2" ALIGN="center">
               <A href="javascript: document.ModQueryInputForm.<%=Constants.STEP_PARAM%>.value='<%=Constants.NEW_STEP%>';void document.ModQueryInputForm.submit();" class="statText">
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
