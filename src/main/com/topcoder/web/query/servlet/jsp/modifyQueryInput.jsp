<%@  page
  language="java"
  errorPage="errorPage.jsp"
  import= "com.topcoder.web.query.common.*,
           com.topcoder.web.query.bean.*"
%>
<%@ taglib uri="/query-taglib.tld" prefix="query"%>
<jsp:useBean id="ModifyQueryInputTask" scope="request" class="com.topcoder.web.query.bean.ModifyQueryInputTask" />
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
    <TR><TD COLSPAN="6"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="16"></TD></TR>    <TR>
      <TD WIDTH="170" VALIGN="top">
        <jsp:include page="left.jsp" flush="true">
          <jsp:param name="<%=Constants.DB_PARAM%>" value="<%=ModifyQueryInputTask.getDb()%>"/>
          <jsp:param name="<%=Constants.SERVLET_PATH_PARAM%>" value="<%=ModifyQueryInputTask.getServletPath()%>"/>
        </jsp:include>      </TD>
      <TD WIDTH="4" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD>
      <TD CLASS="statText" WIDTH="100%" VALIGN="top" ALIGN="left">
        <TABLE WIDTH="80%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
          <FORM ACTION="<jsp:getProperty name="ModifyQueryInputTask" property="ServletPath"/>" method="post" name="ModQueryInputForm" >
            <INPUT TYPE="hidden" NAME="<%=Constants.TASK_PARAM%>" VALUE="<%=Constants.MODIFY_QUERY_INPUT_TASK%>">
            <INPUT TYPE="hidden" NAME="<%=Constants.QUERY_ID_PARAM%>" VALUE="<jsp:getProperty name="ModifyQueryInputTask" property="QueryId"/>">
            <INPUT TYPE="hidden" NAME="<%=Constants.STEP_PARAM%>" VALUE="<%=Constants.SAVE_STEP%>">
            <INPUT TYPE="hidden" NAME="<%=Constants.DB_PARAM%>" VALUE="<jsp:getProperty name="ModifyQueryInputTask" property="Db"/>">
            <TR><TD CLASS="statTextBig" COLSPAN="2"><%=Constants.MODIFY_QUERY_INPUT_NAME%></TD></TR>
            <TR><TD CLASS="errorText" COLSPAN="2"><query:error task="<%=ModifyQueryInputTask%>" key="<%=Constants.INPUT_ID_PARAM%>"/></TD></TR>
            <TR><TD CLASS="errorText" COLSPAN="2"><query:error task="<%=ModifyQueryInputTask%>" key="<%=Constants.QUERY_ID_PARAM%>"/></TD></TR>
            <TR><TD CLASS="statTextBig" COLSPAN="2" ALIGN="center">Query: <jsp:getProperty name="ModifyQueryInputTask" property="QueryName"/></TD></TR>
            <TR><TD COLSPAN="2"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
            <TR>
              <TD CLASS="statText" ALIGN="center" COLSPAN="2">DB: <jsp:getProperty name="ModifyQueryInputTask" property="Db"/></TD>
            </TR>
            <TR><TD COLSPAN="2"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
            <TR>
              <TD COLSPAN="2">
                <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
                  <TR BGCOLOR="#333333">
                    <TD CLASS="statTextBig"></TD>
                    <TD CLASS="statTextBig">Input Code</TD>
                    <TD CLASS="statTextBig">Input Desc</TD>
                    <TD CLASS="statTextBig">Sort</TD>
                    <TD CLASS="statTextBig">Optional?</TD>
                    <TD CLASS="statTextBig">Default Value</TD>
                    <TD CLASS="statTextBig"></TD>
                  </TR>
                  <TR><TD COLSPAN="2"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
                  <query:queryInputIterator id="queryInput" list="<%=ModifyQueryInputTask.getCurrentInputList()%>">
                    <TR><TD CLASS="errorText" COLSPAN="7"><query:error task="<%=ModifyQueryInputTask%>" key="<%=Constants.SORT_ORDER_PARAM+queryInput.getInputId()%>"/></TD></TR>
                    <TR><TD CLASS="errorText" COLSPAN="7"><query:error task="<%=ModifyQueryInputTask%>" key="<%=Constants.OPTIONAL_PARAM+queryInput.getInputId()%>"/></TD></TR>
                    <TR><TD CLASS="errorText" COLSPAN="7"><query:error task="<%=ModifyQueryInputTask%>" key="<%=Constants.DEFAULT_VALUE_PARAM+queryInput.getInputId()%>"/></TD></TR>
                    <TR>
                      <TD CLASS="statTextBig">
                        <A HREF="<jsp:getProperty name="ModifyQueryInputTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_INPUT_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="ModifyQueryInputTask" property="Db"/>&<%=Constants.INPUT_ID_PARAM%>=<jsp:getProperty name="queryInput" property="InputId"/>" class="statText">
                          [edit]
                        </A>
                      </TD>
                      <TD CLASS="statTextBig"><jsp:getProperty name="queryInput" property="InputCode"/></TD>
                      <TD CLASS="statTextBig"><jsp:getProperty name="queryInput" property="InputDesc"/></TD>
                      <TD CLASS="statTextBig">
                        <input type="text" name="<%=Constants.SORT_ORDER_PARAM+queryInput.getInputId()%>" value ="<jsp:getProperty name="queryInput" property="SortOrder"/>" size="3" maxlength="3"/>
                      </TD>
                      <TD CLASS="statTextBig">
                        <query:booleanSelect name="<%=Constants.OPTIONAL_PARAM+queryInput.getInputId()%>" class="dropdown" selectedValue='<%=queryInput.isOptional()?"true":"false"%>'/>
                      <TD CLASS="statTextBig">
                        <input type="text" name="<%=Constants.DEFAULT_VALUE_PARAM+queryInput.getInputId()%>" value ="<jsp:getProperty name="queryInput" property="DefaultValue"/>" size="30" maxlength="100"/>
                      </TD>
                      <TD CLASS="statTextBig">
                        <A HREF="<jsp:getProperty name="ModifyQueryInputTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_QUERY_INPUT_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="ModifyQueryInputTask" property="Db"/>&<%=Constants.INPUT_ID_PARAM%>=<jsp:getProperty name="queryInput" property="InputId"/>&<%=Constants.QUERY_ID_PARAM%>=<jsp:getProperty name="ModifyQueryInputTask" property="QueryId"/>&<%=Constants.STEP_PARAM%>=<%=Constants.REMOVE_STEP%>" class="statText">
                          [remove]
                        </A>
                      </TD>
                    </TR>
                    <TR><TD COLSPAN="7"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
                  </query:queryInputIterator>
                  <TR>
                    <TD CLASS="statTextBig" COLSPAN="7" ALIGN="center">
                        <A HREF="javascript: void document.ModQueryInputForm.submit()" class="statText">
                          [save]
                        </A>
                    </TD>
                  </TR>
                  <TR><TD COLSPAN="2"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
                </TABLE>
              </TD>
           </TR>
           <TR>
             <TD CLASS="statTextBig" COLSPAN="2" ALIGN="center">
               <query:inputSelect name="<%=Constants.INPUT_ID_PARAM%>" class="dropdown" list="<%=ModifyQueryInputTask.getOtherInputList()%>" size="10" multiple="false"/>
             </TD>
           </TR>
           <TR><TD COLSPAN="2"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
           <TR>
             <TD CLASS="statTextBig" COLSPAN="2" ALIGN="center">
               <A HREF="javascript: document.ModQueryInputForm.<%=Constants.STEP_PARAM%>.value='<%=Constants.NEW_STEP%>';void document.ModQueryInputForm.submit();" class="statText">
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
