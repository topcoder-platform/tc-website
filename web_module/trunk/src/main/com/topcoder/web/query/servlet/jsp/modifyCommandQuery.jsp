<%@  page
  language="java"
  errorPage="errorPage.jsp"
  import= "com.topcoder.web.query.common.*,
           com.topcoder.web.query.bean.*"
%>
<%@ taglib uri="/query-taglib.tld" prefix="query"%>
<jsp:useBean id="ModifyCommandQueryTask" scope="request" class="com.topcoder.web.query.bean.task.ModifyCommandQueryTask" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>Query Tool</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
  </HEAD>
  <BODY BGCOLOR="#000000" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0"">
  <jsp:include page="top.jsp" />

  <TABLE BGCOLOR="#000000" WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR><TD COLSPAN="6"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="16"></TD></TR>
    <TR>
      <TD WIDTH="170" VALIGN="top">
        <jsp:include page="left.jsp" flush="true">
          <jsp:param name="<%=Constants.DB_PARAM%>" value="<%=ModifyCommandQueryTask.getDb()%>"/>
          <jsp:param name="<%=Constants.SERVLET_PATH_PARAM%>" value="<%=ModifyCommandQueryTask.getServletPath()%>"/>
        </jsp:include>      </TD>
      <TD WIDTH="4" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD>
      <TD CLASS="statText" WIDTH="100%" VALIGN="top" ALIGN="left">
        <TABLE WIDTH="80%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
          <FORM ACTION="<jsp:getProperty name="ModifyCommandQueryTask" property="ServletPath"/>" method="post" name="ModifyCommandQueryForm" >
            <INPUT TYPE="hidden" NAME="<%=Constants.TASK_PARAM%>" VALUE="<%=Constants.MODIFY_COMMAND_QUERY_TASK%>">
            <INPUT TYPE="hidden" NAME="<%=Constants.COMMAND_ID_PARAM%>" VALUE="<jsp:getProperty name="ModifyCommandQueryTask" property="CommandId"/>">
            <INPUT TYPE="hidden" NAME="<%=Constants.STEP_PARAM%>" VALUE="<%=Constants.SAVE_STEP%>">
            <INPUT TYPE="hidden" NAME="<%=Constants.DB_PARAM%>" VALUE="<jsp:getProperty name="ModifyCommandQueryTask" property="Db"/>">
            <TR><TD CLASS="statTextBig" COLSPAN="2"><%=Constants.MODIFY_COMMAND_QUERY_NAME%></TD></TR>
            <TR><TD COLSPAN="2"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
            <TR><TD CLASS="statTextBig" COLSPAN="2" ALIGN="center">Command: <jsp:getProperty name="ModifyCommandQueryTask" property="CommandDesc"/></TD></TR>
            <TR><TD COLSPAN="2"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
            <TR>
              <TD CLASS="statText" ALIGN="center" COLSPAN="2">DB: <jsp:getProperty name="ModifyCommandQueryTask" property="Db"/></TD>
            </TR>
            <TR><TD COLSPAN="2"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
            <TR><TD CLASS="errorText" COLSPAN="2"><query:error task="<%=ModifyCommandQueryTask%>" key="<%=Constants.COMMAND_ID_PARAM%>"/></TD></TR>
            <TR>
              <TD COLSPAN="2">
                <TABLE WIDTH="100%" BGCOLOR="#000000" BORDER="0" CELLPADDING="0" CELLSPACING="0">
                  <TR BGCOLOR="#333333">
                    <TD CLASS="statTextBig"></TD>
                    <TD CLASS="statTextBig">Query</TD>
                    <TD CLASS="statTextBig">Sort Order</TD>
                    <TD CLASS="statTextBig"></TD>
                  </TR>
                  <TR><TD COLSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
                  <query:commandQueryIterator id="commandQuery" list="<%=ModifyCommandQueryTask.getCurrentQueryList()%>">
                    <TR><TD CLASS="errorText" COLSPAN="4"><query:error task="<%=ModifyCommandQueryTask%>" key="<%=Constants.SORT_ORDER_PARAM+commandQuery.getQueryId()%>"/></TD></TR>
                    <TR>
                      <TD CLASS="statTextBig">
                        <A HREF="<jsp:getProperty name="ModifyCommandQueryTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_QUERY_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="ModifyCommandQueryTask" property="Db"/>&<%=Constants.QUERY_ID_PARAM%>=<jsp:getProperty name="commandQuery" property="QueryId"/>" class="statText">
                          [edit]
                        </A>
                      </TD>
                      <TD CLASS="statTextBig"><jsp:getProperty name="commandQuery" property="QueryName"/></TD>
                      <TD CLASS="statTextBig">
                        <input type="text" name="<%=Constants.SORT_ORDER_PARAM+commandQuery.getQueryId()%>" value ="<jsp:getProperty name="commandQuery" property="SortOrder"/>" size="3" maxlength="3"/>
                      </TD>
                      <TD CLASS="statTextBig">
                        <A HREF="<jsp:getProperty name="ModifyCommandQueryTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_COMMAND_QUERY_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="ModifyCommandQueryTask" property="Db"/>&<%=Constants.COMMAND_ID_PARAM%>=<jsp:getProperty name="ModifyCommandQueryTask" property="commandId"/>&<%=Constants.QUERY_ID_PARAM%>=<jsp:getProperty name="commandQuery" property="QueryId"/>&<%=Constants.STEP_PARAM%>=<%=Constants.REMOVE_STEP%>" class="statText">
                          [remove]
                        </A>
                      </TD>
                    </TR>
                  <TR><TD COLSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
                  </query:commandQueryIterator>
                  <TR>
                    <TD CLASS="statTextBig" COLSPAN="7" ALIGN="center">
                        <A HREF="javascript: void document.ModifyCommandQueryForm.submit()" class="statText">
                          [save]
                        </A>
                    </TD>
                  </TR>
                  <TR><TD COLSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
                </TABLE>
              </TD>
            </TR>
           <TR><TD CLASS="errorText" COLSPAN="2"><query:error task="<%=ModifyCommandQueryTask%>" key="<%=Constants.QUERY_ID_PARAM%>"/></TD></TR>
           <TR>
             <TD CLASS="statTextBig" COLSPAN="2" ALIGN="center">
               <query:querySelect name="<%=Constants.QUERY_ID_PARAM%>" class="dropdown" list="<%=ModifyCommandQueryTask.getOtherQueryList()%>" size="10" multiple="false"/>
             </TD>
           </TR>
           <TR><TD COLSPAN="2"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
           <TR>
             <TD CLASS="statTextBig" COLSPAN="2" ALIGN="center">
               <A HREF="javascript: document.ModifyCommandQueryForm.<%=Constants.STEP_PARAM%>.value='<%=Constants.NEW_STEP%>';void document.ModifyCommandQueryForm.submit();" class="statText">
                 [add]
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
  <jsp:include page="bottom.jsp" />
  </BODY>
</HTML>
