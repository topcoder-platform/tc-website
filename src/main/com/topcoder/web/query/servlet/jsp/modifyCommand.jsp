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
    <TITLE>Query Tool</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
  </HEAD>
  <BODY BGCOLOR="#333333" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0"">
  <jsp:include page="top.jsp" />

  <TABLE WIDTH="100%" HEIGHT="50%" BORDER="1" CELLPADDING="0" CELLSPACING="0">
    <TR>
      <TD WIDTH="170" bgcolor="#000000" VALIGN="top">
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
      <TD WIDTH="4" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD>
      <TD CLASS="statText" WIDTH="100%" BGCOLOR="#000000" VALIGN="top" ALIGN="left">
        <TABLE WIDTH="60%" BORDER="1" CELLPADDING="0" CELLSPACING="0">
          <FORM ACTION="<jsp:getProperty name="ModifyCommandTask" property="ServletPath"/>" method="post" name="ModCommandForm" >
            <INPUT TYPE="hidden" NAME="<%=Constants.TASK_PARAM%>" VALUE="<%=Constants.MODIFY_COMMAND_TASK%>">
            <INPUT TYPE="hidden" NAME="<%=Constants.COMMAND_ID_PARAM%>" VALUE="<jsp:getProperty name="ModifyCommandTask" property="CommandId"/>">
            <INPUT TYPE="hidden" NAME="<%=Constants.STEP_PARAM%>" VALUE="<%=Constants.SAVE_STEP%>">
            <TR><TD CLASS="statTextBig" COLSPAN="2"><%=Constants.MODIFY_COMMAND_NAME%></TD></TR>
            <TR><TD CLASS="errorText" COLSPAN="2"><query:error task="<%=ModifyCommandTask%>" key="<%=Constants.COMMAND_ID_PARAM%>"/></TD></TR>
            <TR><TD CLASS="errorText" COLSPAN="2"><query:error task="<%=ModifyCommandTask%>" key="<%=Constants.COMMAND_DESC_PARAM%>"/></TD></TR>
            <TR>
              <TD CLASS="statText" ALIGN="right" WIDTH="50%">Name: </TD>
              <TD CLASS="statText" ALIGN="left" WIDTH="50%">
                <input type="text" name="<%=Constants.COMMAND_DESC_PARAM%>" value ="<jsp:getProperty name="ModifyCommandTask" property="CommandDesc" />" size="30" maxlength="100"/>
              </TD>
            </TR>
            <TR><TD CLASS="errorText" COLSPAN="2"><query:error task="<%=ModifyCommandTask%>" key="<%=Constants.GROUP_ID_PARAM%>"/></TD></TR>
            <TR>
              <TD CLASS="statText" ALIGN="right">Group: </TD>
              <TD CLASS="statText" ALIGN="left">
                <query:commandGroupSelect name="<%=Constants.GROUP_ID_PARAM%>" class="dropdown" list="<%=ModifyCommandTask.getGroups()%>" selectedValue='<%=""+ModifyCommandTask.getGroupId()%>'/>
              </TD>
            </TR>
            <TR>
              <TD CLASS="statText" ALIGN="right">DB: </TD>
              <TD CLASS="statText" ALIGN="left">
                <% if (ModifyCommandTask.isNewCommand()) { %>
                  <query:dbSelect name="<%=Constants.DB_PARAM%>" class="dropdown" list="<%=Constants.DB_LIST%>" selectedValue="<%=ModifyCommandTask.getDb()%>"/>
                <% } else { %>
                  <INPUT TYPE="hidden" NAME="<%=Constants.DB_PARAM%>" VALUE="<jsp:getProperty name="ModifyCommandTask" property="Db"/>">
                  <jsp:getProperty name="ModifyCommandTask" property="Db"/>
                <% } %>
              </TD>
            </TR>
            <TR>
              <TD CLASS="statText" ALIGN="center" COLSPAN="2">
                <A HREF="javascript:void document.ModCommandForm.submit()" CLASS="statText">
                  [save]
                </A>
              </TD>
            </TR>
          <FORM>
        </TABLE>
      </TD>
      <TD WIDTH="4" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"></TD>
      <TD WIDTH="10" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"><BR>
      </TD>
      <TD WIDTH="25" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>
    </TR>
  </TABLE>
  </BODY>
</HTML>
