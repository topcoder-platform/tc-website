<%@  page
  language="java"
  import= "com.topcoder.web.query.common.*,
           com.topcoder.web.query.request.*"
%>
<%@ taglib uri="/query-taglib.tld" prefix="query"%>
<jsp:useBean id="QueryDetail" scope="request" class="com.topcoder.web.query.request.QueryDetail" />
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
          <jsp:param name="<%=Constants.DB_PARAM%>" value="<%=QueryDetail.getDb()%>"/>
          <jsp:param name="<%=Constants.SERVLET_PATH_PARAM%>" value="<%=SessionInfo.getServletPath()%>"/>
        </jsp:include>      </td>
      <td width="4" bgcolor="#000000" valign="top"><img src="/i/clear.gif" width="4" height="8"></td>
      <td class="statText" width="100%" bgcolor="#000000" valign="top">
        <table width="80%" border="0" cellpadding="0" cellspacing="0">
          <tr><td class="statTextBig" colspan="2"><%=Constants.QUERY_DETAIL_NAME%></td></TR>
          <tr><td colspan="2"><img src="/i/clear.gif" width="4" height="8"></td></TR>
          <tr>
            <td class="statText" ALIGN="right" width="50%">DB:&#160;</td>
            <td class="statText" ALIGN="left" width="50%">
              <jsp:getProperty name="QueryDetail" property="Db"/>
            </td>
          </TR>
          <tr><td colspan="2"><img src="/i/clear.gif" width="1" height="8"></td></TR>
          <tr><td class="statText" colspan="2" ALIGN="center">
            Query: <jsp:getProperty name="QueryDetail" property="QueryName"/>
          </td></TR>
          <tr><td colspan="2"><img src="/i/clear.gif" width="1" height="8"></td></TR>
          <tr><td class="statText" colspan="2" ALIGN="center">
            <A href="<jsp:getProperty name="SessionInfo" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_QUERY_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="QueryDetail" property="Db"/>&<%=Constants.QUERY_ID_PARAM%>=<jsp:getProperty name="QueryDetail" property="QueryId"/>" class="statText">
              [edit query]
            </A>
            <A href="<jsp:getProperty name="SessionInfo" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_QUERY_INPUT_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="QueryDetail" property="Db"/>&<%=Constants.QUERY_ID_PARAM%>=<jsp:getProperty name="QueryDetail" property="QueryId"/>" class="statText">
              [edit query input]
            </A>
          </td></TR>
          <tr><td colspan="2"><img src="/i/clear.gif" width="1" height="8"></td></TR>
          <tr bgcolor="#333333">
            <td class="statTextBig" colspan="2">Query Text</td>
          </TR>
          <tr><td colspan="2"><img src="/i/clear.gif" width="1" height="8"></td></TR>
          <tr>
            <td valign="top" width="100%" class="statText" colspan="2">
              <pre><jsp:getProperty name="QueryDetail" property="QueryText"/></pre>
            </td>
          </TR>
          <tr><td colspan="2"><img src="/i/clear.gif" width="1" height="8"></td></TR>
          <tr>
            <td valign="top" width="50%" colspan="2">
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr bgcolor="#333333">
                  <td></td>
                  <td class="statTextBig" ALIGN="left">Input Code</td>
                  <td class="statTextBig" ALIGN="left">Input Description</td>
                </TR>
                <tr><td><img src="/i/clear.gif" width="1" height="8"></td></TR>
                <query:resultSetRowIterator id="input" list="<%=QueryDetail.getInputList()%>">
                  <tr>
                    <td class="statText" ALIGN="right">
                      <A href="<jsp:getProperty name="SessionInfo" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_INPUT_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="QueryDetail" property="Db"/>&<%=Constants.INPUT_ID_PARAM%>=<query:resultSetItem row="<%=input%>" name="input_id"/>" class="statText">
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
