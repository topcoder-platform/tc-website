<%@  page
  language="java"
  import= "com.topcoder.web.query.common.*,
           com.topcoder.web.query.request.*,
           com.topcoder.web.common.SessionInfo"
%>
<%@ taglib uri="/query-taglib.tld" prefix="query"%>
<jsp:useBean id="CommandDetail" scope="request" class="com.topcoder.web.query.request.CommandDetail" />
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
          <jsp:param name="<%=Constants.DB_PARAM%>" value="<%=CommandDetail.getDb()%>"/>
          <jsp:param name="<%=Constants.SERVLET_PATH_PARAM%>" value="<%=SessionInfo.getServletPath()%>"/>
        </jsp:include>      </td>
      <td width="4" bgcolor="#000000" valign="top"><img src="/i/clear.gif" width="4" height="8"></td>
      <td class="statText" width="100%" bgcolor="#000000" valign="top">
        <table width="70%" border="0" cellpadding="0" cellspacing="0">
          <tr><td class="statTextBig" colspan="2"><%=Constants.COMMAND_DETAIL_NAME%></td></TR>
          <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></TR>
          <tr>
            <td class="statText" ALIGN="right">DB:&#160;</td>
            <td class="statText" ALIGN="left">
              <jsp:getProperty name="CommandDetail" property="Db"/>
            </td>
          </TR>
          <tr><td><img src="/i/clear.gif" width="1" height="8"></td></TR>
          <tr><td class="statText" colspan="2" ALIGN="center">Command: <jsp:getProperty name="CommandDetail" property="CommandDesc"/></td></TR>
          <tr><td><img src="/i/clear.gif" width="1" height="8"></td></TR>
            <tr><td class="statText" colspan="2" ALIGN="center">
              <A href="<jsp:getProperty name="SessionInfo" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_COMMAND_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="CommandDetail" property="Db"/>&<%=Constants.COMMAND_ID_PARAM%>=<jsp:getProperty name="CommandDetail" property="CommandId"/>" class="statText">
                [edit command]
              </A>
              <A href="<jsp:getProperty name="SessionInfo" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_COMMAND_QUERY_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="CommandDetail" property="Db"/>&<%=Constants.COMMAND_ID_PARAM%>=<jsp:getProperty name="CommandDetail" property="CommandId"/>" class="statText">
                [edit command query]
              </A>
            </td></TR>
          <tr><td><img src="/i/clear.gif" width="1" height="8"></td></TR>
          <tr><td class="statText" colspan="2" ALIGN="center">
            <A href="<jsp:getProperty name="SessionInfo" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_GROUP_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="CommandDetail" property="Db"/>&<%=Constants.GROUP_ID_PARAM%>=<jsp:getProperty name="CommandDetail" property="GroupId"/>" class="statText">
              [edit]
            </A>
            Group: <jsp:getProperty name="CommandDetail" property="GroupDesc"/>
          </td></TR>
          <tr><td><img src="/i/clear.gif" width="1" height="8"></td></TR>
          <tr>
            <td valign="top" width="50%">
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr bgcolor="#333333">
                  <td class="statText"></td>
                  <td class="statTextBig" ALIGN="left">Query Name</td>
                </TR>
                <tr><td><img src="/i/clear.gif" width="1" height="8"></td></TR>
                <query:resultSetRowIterator id="query" list="<%=CommandDetail.getQueryList()%>">
                  <tr>
                    <td class="statText" ALIGN="right">
                      <A href="<jsp:getProperty name="SessionInfo" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_QUERY_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="CommandDetail" property="Db"/>&<%=Constants.QUERY_ID_PARAM%>=<query:resultSetItem row="<%=query%>" name="query_id"/>" class="statText">
                        [edit]
                      </A>
                      &#160;&#160;
                    </td>
                    <td class="statText" ALIGN="left">
                      <A href="<jsp:getProperty name="SessionInfo" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.QUERY_DETAIL_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="CommandDetail" property="Db"/>&<%=Constants.QUERY_ID_PARAM%>=<query:resultSetItem row="<%=query%>" name="query_id"/>" class="statText">
                        <query:resultSetItem row="<%=query%>" name="name"/>
                      </A>
                    </td>
                  </TR>
                </query:resultSetRowIterator>
                <tr><td><img src="/i/clear.gif" width="1" height="8"></td></TR>
              </table>
            </td>
            <td valign="top" width="50%">
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr bgcolor="#333333">
                  <td class="statText"></td>
                  <td class="statTextBig" ALIGN="left">Input Code</td>
                  <td class="statTextBig" ALIGN="left">Input Description</td>
                </TR>
                <tr><td><img src="/i/clear.gif" width="1" height="8"></td></TR>
                <query:resultSetRowIterator id="input" list="<%=CommandDetail.getInputList()%>">
                  <tr>
                    <td class="statText" ALIGN="right">
                      <A href="<jsp:getProperty name="SessionInfo" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_INPUT_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="CommandDetail" property="Db"/>&<%=Constants.INPUT_ID_PARAM%>=<query:resultSetItem row="<%=input%>" name="input_id"/>" class="statText">
                        [edit]
                      </A>
                      &#160;&#160;
                    </td>
                    <td class="statText" ALIGN="left">
                      <query:resultSetItem row="<%=input%>" name="input_code"/>
                    </td>
                    <td class="statText" ALIGN="left">
                      <query:resultSetItem row="<%=input%>" name="input_desc"/>
                    </td>
                  </TR>
                </query:resultSetRowIterator>
                <tr><td><img src="/i/clear.gif" width="1" height="8"></td></TR>
              </table>
            </td>
          </TR>
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
