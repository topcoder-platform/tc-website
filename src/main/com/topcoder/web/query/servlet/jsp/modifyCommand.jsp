<%@  page
  language="java"
  errorPage="errorPage.jsp"
  import= "com.topcoder.web.query.common.*,
           com.topcoder.web.query.bean.*"
%>
<%@ taglib uri="/query-taglib.tld" prefix="query"%>
<jsp:useBean id="ModifyCommandTask" scope="request" class="com.topcoder.web.query.bean.ModifyCommandTask" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder Employment Services</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
  </HEAD>
  <BODY BGCOLOR="#43515E" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0"">
  <jsp:include page="top.jsp" />

  <TABLE WIDTH="100%" HEIGHT="50%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR>
      <TD WIDTH="170" bgcolor="#001935" VALIGN="top">
        <TABLE WIDTH="170" BORDER="0" CELLPADDING="0" CELLSPACING="0">
          <query:linkIterator id="link" list="<%=ModifyCommandTask.getNavLinks()%>">
            <TR>
              <TD CLASS="statText">
                  <A HREF="<jsp:getProperty name="link" property="href"/>" class="statText"><jsp:getProperty name="link" property="name"/></A>
              </TD>
            </TR>
          </query:linkIterator>
        </TABLE>
      </TD>
      <TD WIDTH="4" BGCOLOR="#001935" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD>
      <TD CLASS="statText" WIDTH="100%" BGCOLOR="#001935" VALIGN="top">
        <TABLE WIDTH="60%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
          <TR><TD CLASS="statTextBig" COLSPAN="2"><%=Constants.MODIFY_COMMAND_NAME%></TD></TR>
          <TR>
            <TD CLASS="statText" ALIGN="right">Name: </TD>
            <TD CLASS="statText" ALIGN="left">
              <input type="text" name="<%=Constants.COMMAND_DESC_PARAM%>" value ="<jsp:getProperty name="ModifyCommandTask" property="CommandDesc" />" size="30" maxlength="100">
            </TD>
          </TR>
          <TR>
            <TD CLASS="statText" ALIGN="right">Group: </TD>
            <TD CLASS="statText" ALIGN="left">
              <query:commandGroupSelect name="<%=Constants.GROUP_ID_PARAM%>" class="dropdown" list="<%=ModifyCommandTask.getGroups()%>" selectedValue='<%=""+ModifyCommandTask.getGroupId()%>'/>
            </TD>
          </TR>
          <TR>
            <TD CLASS="statText" ALIGN="right">Group: </TD>
            <TD CLASS="statText" ALIGN="left">
              <select name="<%=Constants.

              <query:commandGroupSelect name="<%=Constants.GROUP_ID_PARAM%>" class="dropdown" list="<%=ModifyCommandTask.getGroups()%>" selectedValue='<%=""+ModifyCommandTask.getGroupId()%>'/>
            </TD>
          </TR>

        </TABLE>
      </TD>
      <TD WIDTH="4" BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"></TD>
      <TD WIDTH="10" BGCOLOR="#001935" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"><BR>
      </TD>
      <TD WIDTH="25" BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>
    </TR>
  </TABLE>
  </BODY>
</HTML>
