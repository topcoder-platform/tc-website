<%@  page
  language="java"
  errorPage="errorPage.jsp"
  import= "com.topcoder.web.query.common.*,
          com.topcoder.web.query.bean.task.*"
%>
<%@ taglib uri="/query-taglib.tld" prefix="query"%>
<jsp:useBean id="CommandDetailTask" scope="request" class="com.topcoder.web.query.bean.task.CommandDetailTask" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>Query Tool</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
  </HEAD>
  <BODY BGCOLOR="#000000" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0"">
  <jsp:include page="top.jsp" />
  <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR><TD COLSPAN="6"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="16"></TD></TR>
    <TR>
      <TD WIDTH="170" bgcolor="#000000" VALIGN="top">
        <jsp:include page="left.jsp" flush="true">
          <jsp:param name="<%=Constants.DB_PARAM%>" value="<%=CommandDetailTask.getDb()%>"/>
          <jsp:param name="<%=Constants.SERVLET_PATH_PARAM%>" value="<%=CommandDetailTask.getServletPath()%>"/>
        </jsp:include>      </TD>
      <TD WIDTH="4" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD>
      <TD CLASS="statText" WIDTH="100%" BGCOLOR="#000000" VALIGN="top">
        <TABLE WIDTH="70%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
          <TR><TD CLASS="statTextBig" COLSPAN="2"><%=Constants.COMMAND_DETAIL_NAME%></TD></TR>
          <TR><TD COLSPAN="2"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
          <TR>
            <TD CLASS="statText" ALIGN="right">DB:&#160;</TD>
            <TD CLASS="statText" ALIGN="left">
              <jsp:getProperty name="CommandDetailTask" property="Db"/>
            </TD>
          </TR>
          <TR><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8"></TD></TR>
          <TR><TD CLASS="statText" COLSPAN="2" ALIGN="center">Command: <jsp:getProperty name="CommandDetailTask" property="CommandDesc"/></TD></TR>
          <TR><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8"></TD></TR>
            <TR><TD CLASS="statText" COLSPAN="2" ALIGN="center">
              <A HREF="<jsp:getProperty name="CommandDetailTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_COMMAND_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="CommandDetailTask" property="Db"/>&<%=Constants.COMMAND_ID_PARAM%>=<jsp:getProperty name="CommandDetailTask" property="CommandId"/>" class="statText">
                [edit command]
              </A>
              <A HREF="<jsp:getProperty name="CommandDetailTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_COMMAND_QUERY_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="CommandDetailTask" property="Db"/>&<%=Constants.COMMAND_ID_PARAM%>=<jsp:getProperty name="CommandDetailTask" property="CommandId"/>" class="statText">
                [edit command query]
              </A>
            </TD></TR>
          <TR><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8"></TD></TR>
          <TR><TD CLASS="statText" COLSPAN="2" ALIGN="center">
            <A HREF="<jsp:getProperty name="CommandDetailTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_GROUP_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="CommandDetailTask" property="Db"/>&<%=Constants.GROUP_ID_PARAM%>=<jsp:getProperty name="CommandDetailTask" property="GroupId"/>" class="statText">
              [edit]
            </A>
            Group: <jsp:getProperty name="CommandDetailTask" property="GroupDesc"/>
          </TD></TR>
          <TR><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8"></TD></TR>
          <TR>
            <TD VALIGN="top" WIDTH="50%">
              <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
                <TR BGCOLOR="#333333">
                  <TD CLASS="statText"></TD>
                  <TD CLASS="statTextBig" ALIGN="left">Query Name</TD>
                </TR>
                <TR><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8"></TD></TR>
                <query:resultSetRowIterator id="query" list="<%=CommandDetailTask.getQueryList()%>">
                  <TR>
                    <TD CLASS="statText" ALIGN="right">
                      <A HREF="<jsp:getProperty name="CommandDetailTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_QUERY_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="CommandDetailTask" property="Db"/>&<%=Constants.QUERY_ID_PARAM%>=<query:resultSetItem row="<%=query%>" name="query_id"/>" class="statText">
                        [edit]
                      </A>
                      &#160;&#160;
                    </TD>
                    <TD CLASS="statText" ALIGN="left">
                      <A HREF="<jsp:getProperty name="CommandDetailTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.QUERY_DETAIL_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="CommandDetailTask" property="Db"/>&<%=Constants.QUERY_ID_PARAM%>=<query:resultSetItem row="<%=query%>" name="query_id"/>" class="statText">
                        <query:resultSetItem row="<%=query%>" name="name"/>
                      </A>
                    </TD>
                  </TR>
                </query:resultSetRowIterator>
                <TR><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8"></TD></TR>
              </TABLE>
            </TD>
            <TD VALIGN="top" WIDTH="50%">
              <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
                <TR BGCOLOR="#333333">
                  <TD CLASS="statText"></TD>
                  <TD CLASS="statTextBig" ALIGN="left">Input Code</TD>
                  <TD CLASS="statTextBig" ALIGN="left">Input Description</TD>
                </TR>
                <TR><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8"></TD></TR>
                <query:resultSetRowIterator id="input" list="<%=CommandDetailTask.getInputList()%>">
                  <TR>
                    <TD CLASS="statText" ALIGN="right">
                      <A HREF="<jsp:getProperty name="CommandDetailTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_INPUT_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="CommandDetailTask" property="Db"/>&<%=Constants.INPUT_ID_PARAM%>=<query:resultSetItem row="<%=input%>" name="input_id"/>" class="statText">
                        [edit]
                      </A>
                      &#160;&#160;
                    </TD>
                    <TD CLASS="statText" ALIGN="left">
                      <query:resultSetItem row="<%=input%>" name="input_code"/>
                    </TD>
                    <TD CLASS="statText" ALIGN="left">
                      <query:resultSetItem row="<%=input%>" name="input_desc"/>
                    </TD>
                  </TR>
                </query:resultSetRowIterator>
                <TR><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8"></TD></TR>
              </TABLE>
            </TD>
          </TR>
        </TABLE>
      </TD>
      <TD WIDTH="4" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"></TD>
      <TD WIDTH="10" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"><BR>
      </TD>
      <TD WIDTH="25" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>
    </TR>
  </TABLE>
  <jsp:include page="bottom.jsp" />
  </BODY>
</HTML>
