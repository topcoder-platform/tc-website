<%@  page
  language="java"
  errorPage="errorPage.jsp"
  import= "com.topcoder.web.query.common.*,
           com.topcoder.web.query.bean.*"
%>
<%@ taglib uri="/query-taglib.tld" prefix="query"%>
<jsp:useBean id="DBSelectionTask" scope="request" class="com.topcoder.web.query.bean.DBSelectionTask" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>Query Tool</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
  </HEAD>
  <BODY BGCOLOR="#333333" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0"">
  <jsp:include page="top.jsp" />

  <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR><TD COLSPAN="6"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="16"></TD></TR>
    <TR>
      <TD WIDTH="170" bgcolor="#000000" VALIGN="top">
        <TABLE WIDTH="170" BORDER="0" CELLPADDING="0" CELLSPACING="0">
          <query:linkIterator id="link" list="<%=DBSelectionTask.getNavLinks()%>">
            <TR>
              <TD CLASS="statText">
                  <A HREF="<jsp:getProperty name="link" property="href"/>" class="statText"><jsp:getProperty name="link" property="name"/></A>
              </TD>
            </TR>
            <TR><TD><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
          </query:linkIterator>
        </TABLE>
      </TD>
      <TD WIDTH="4" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD>
      <TD CLASS="statText" WIDTH="100%" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
        <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
          <TR><TD CLASS="statText"><%=Constants.DB_SELECTION_NAME%></TD></TR>
          <TR><TD COLSPAN="2"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="16"></TD></TR>
          <query:DBIterator id="db" list="<%=Constants.DB_LIST%>">
            <TR><TD>
             <A HREF="<jsp:getProperty name="DBSelectionTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.COMMAND_LIST_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="db" property="value"/>" class="statText">
                <jsp:getProperty name="db" property="DisplayName"/>
              </A>
            </TD></TR>
          </query:DBIterator>
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
