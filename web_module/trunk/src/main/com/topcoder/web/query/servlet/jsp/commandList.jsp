<%@  page
  language="java"
  errorPage="errorPage.jsp"
  import= "com.topcoder.web.query.common.*,
          com.topcoder.web.query.bean.*"
%>
<%@ taglib uri="/query-taglib.tld" prefix="query"%>
<jsp:useBean id="CommandListTask" scope="request" class="com.topcoder.web.query.bean.CommandListTask" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>Query Tool</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
  </HEAD>
  <BODY BGCOLOR="#333333" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0"">
  <jsp:include page="top.jsp" />

  <TABLE WIDTH="100%" HEIGHT="50%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR>
      <TD WIDTH="170" BGCOLOR="#000000" VALIGN="top">
        <TABLE WIDTH="170" BORDER="0" CELLPADDING="0" CELLSPACING="0">
          <query:linkIterator id="link" list="<%=CommandListTask.getNavLinks()%>">
            <TR>
              <TD CLASS="statText">
                  <A HREF="<jsp:getProperty name="link" property="href"/>" class="statText"><jsp:getProperty name="link" property="name"/></A>
              </TD>
            </TR>
          </query:linkIterator>
        </TABLE>
      </TD>
      <TD WIDTH="4" BGCOLOR="#333333" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD>
      <TD CLASS="statText" WIDTH="100%" BGCOLOR="#000000" VALIGN="top"><ING SRC="/i/clear.gif" WIDTH="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
        <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
          <TR><TD CLASS="statText" COLSPAN="2"><%=Constants.COMMAND_LIST_NAME%></TD></TR>
          <TR><TD COLSPAN="2"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
          <TD CLASS="statTextBig">Group Name</TD>
          <TD CLASS="statTextBig">Command Name</TD>
          <query:resultSetRowIterator id="command" list="<%=CommandListTask.getCommandList()%>">
            <TR>
              <TD CLASS="statText">
                <query:resultSetItem row="<%=command%>" name="command_group_name"/>
              </TD>
              <TD CLASS="statText">
                <A HREF="<jsp:getProperty name="CommandListTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_COMMAND_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="CommandListTask" property="Db"/>&<%=Constants.COMMAND_ID_PARAM%>=<query:resultSetItem row="<%=command%>" name="command_id"/>" CLASS="statText">
                  [edit]
                </A>
                <A HREF="<jsp:getProperty name="CommandListTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.COMMAND_DETAIL_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="CommandListTask" property="Db"/>&<%=Constants.COMMAND_ID_PARAM%>=<query:resultSetItem row="<%=command%>" name="command_id"/>" CLASS="statText">
                  <query:resultSetItem row="<%=command%>" name="command_desc"/>
                </A>
              </TD>
            </TR>
          </query:resultSetRowIterator>
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
