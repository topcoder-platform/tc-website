<%@  page
  language="java"
  import= "com.topcoder.web.query.common.*,
           com.topcoder.web.query.request.*"
%>
<%@ taglib uri="/query-taglib.tld" prefix="query"%>
<jsp:useBean id="QueryList" scope="request" class="com.topcoder.web.query.request.QueryList" />
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
          <jsp:param name="<%=Constants.DB_PARAM%>" value="<%=QueryList.getDb()%>"/>
          <jsp:param name="<%=Constants.SERVLET_PATH_PARAM%>" value="<%=sessionInfo.getServletPath()%>"/>
        </jsp:include>
      </td>
      <td width="4" bgcolor="#000000" valign="top"><img src="/i/clear.gif" width="4" height="8"></td>
      <td class="statText" width="100%" bgcolor="#000000" valign="top">
        <table width="60%" border="0" cellpadding="0" cellspacing="0">
          <tr><td class="statTextBig" colspan="2"><%=Constants.QUERY_LIST_NAME%></td></tr>
          <tr>
            <td class="statText" ALIGN="right">DB:&#160;</td>
            <td class="statText" ALIGN="left">
              <jsp:getProperty name="QueryList" property="Db"/>
            </td>
          </tr>
          <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
          <tr bgcolor="#333333">
            <td></td>
            <td class="statTextBig">Query Name</td>
          </tr>
          <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></tr>
          <query:resultSetRowIterator id="query" list="<%=QueryList.getQueryList()%>">
            <tr>
              <td class="statText" ALIGN="right">
                <A href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_QUERY_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="QueryList" property="Db"/>&<%=Constants.QUERY_ID_PARAM%>=<query:resultSetItem row="<%=query%>" name="query_id"/>" class="statText">
                  [edit]
                </A>
                &#160;&#160;
              </td>
              <td class="statText">
                <A href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.QUERY_DETAIL_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="QueryList" property="Db"/>&<%=Constants.QUERY_ID_PARAM%>=<query:resultSetItem row="<%=query%>" name="query_id"/>" class="statText">
                  <query:resultSetItem row="<%=query%>" name="name"/>
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
