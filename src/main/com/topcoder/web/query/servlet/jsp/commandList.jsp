<%@  page
  language="java"
  import= "com.topcoder.web.query.common.*,
           com.topcoder.web.query.request.*"
%>
<%@ taglib uri="/query-taglib.tld" prefix="query"%>
<jsp:useBean id="CommandList" scope="request" class="com.topcoder.web.query.request.CommandList" />
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
        <jsp:include page="left.jsp" flush="true">
          <jsp:param name="<%=Constants.DB_PARAM%>" value="<%=CommandList.getDb()%>"/>
          <jsp:param name="<%=Constants.SERVLET_PATH_PARAM%>" value="<%=sessionInfo.getServletPath()%>"/>
        </jsp:include>
      </td>
      <td width="4" bgcolor="#000000" valign="top"><img src="/i/clear.gif" width="4" height="8"></td>
      <td class="statText" width="100%" bgcolor="#000000" valign="top">
        <table width="60%" border="0" cellpadding="0" cellspacing="0">
          <tr><td class="errorText" colspan="4"><query:error id="err" name="<%=Constants.GROUP_ID_PARAM%>"><%=err%></query:error></td></tr>
          <tr>
            <td class="statTextBig" colspan="2"><%=Constants.COMMAND_LIST_NAME%></td>
            <td colspan="2">
              <form action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="get" name="CommandListForm" >
                <input type="hidden" name="<%=Constants.TASK_PARAM%>" VALUE="<%=Constants.COMMAND_LIST_TASK%>">
                <input type="hidden" name="<%=Constants.DB_PARAM%>" VALUE="<jsp:getProperty name="CommandList" property="Db"/>">
                <query:commandGroupSelect name="<%=Constants.GROUP_ID_PARAM%>" class="dropdown" list="<%=CommandList.getCommandGroupList()%>" selectedValue='<%=""+CommandList.getCommandGroupId()%>' topValue="0" topText="All Groups" onChange="javascript: void CommandListForm.submit();"/>
              </form>
            </td>
          </tr>
          <tr><td colspan="4"><img src="/i/clear.gif" width="4" height="8"></td></tr>
          <tr>
            <td class="statText" ALIGN="right" colspan="2">DB:&#160;</td>
            <td class="statText" ALIGN="left" colspan="2">
              <jsp:getProperty name="CommandList" property="Db"/>
            </td>
          </tr>
          <tr><td colspan="4"><img src="/i/clear.gif" width="4" height="8"></td></tr>
          <tr bgcolor="#333333">
            <td></td>
            <td class="statTextBig">Group Name</td>
            <td></td>
            <td class="statTextBig">Command Name</td>
          </tr>
          <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
          <query:resultSetRowIterator id="command" list="<%=CommandList.getCommandList()%>">
            <tr>
              <td class="statText" ALIGN="right">
                <A href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_GROUP_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="CommandList" property="Db"/>&<%=Constants.GROUP_ID_PARAM%>=<query:resultSetItem row="<%=command%>" name="command_group_id"/>" class="statText">
                  [edit]
                </A>
                &#160;&#160;
              </td>
              <td class="statText">
                <query:resultSetItem row="<%=command%>" name="command_group_name"/>
              </td>
              <td class="statText" ALIGN="right">
                <A href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_COMMAND_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="CommandList" property="Db"/>&<%=Constants.COMMAND_ID_PARAM%>=<query:resultSetItem row="<%=command%>" name="command_id"/>" class="statText">
                  [edit]
                </A>
                &#160;&#160;
              </td>
              <td class="statText">
                <A href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.COMMAND_DETAIL_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="CommandList" property="Db"/>&<%=Constants.COMMAND_ID_PARAM%>=<query:resultSetItem row="<%=command%>" name="command_id"/>" class="statText">
                  <query:resultSetItem row="<%=command%>" name="command_desc"/>
                </A>
              </td>
            </tr>
          </query:resultSetRowIterator>
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
