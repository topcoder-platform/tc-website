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
  <BODY BGCOLOR="#43515E" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0"">
  <jsp:include page="top.jsp" />

  <TABLE WIDTH="100%" HEIGHT="50%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR>
      <TD WIDTH="170" bgcolor="#001935" VALIGN="top">
        <TABLE WIDTH="170" BORDER="0" CELLPADDING="0" CELLSPACING="0">
          <query:linkIterator id="link" list="<%=ModifyQueryInputTask.getNavLinks()%>">
            <TR>
              <TD CLASS="statText">
                  <A HREF="<jsp:getProperty name="link" property="href"/>" class="statText"><jsp:getProperty name="link" property="name"/></A>
              </TD>
            </TR>
          </query:linkIterator>
        </TABLE>
      </TD>
      <TD WIDTH="4" BGCOLOR="#001935" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD>
      <TD CLASS="statText" WIDTH="100%" BGCOLOR="#001935" VALIGN="top" ALIGN="left">
        <TABLE WIDTH="60%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
          <FORM ACTION="<jsp:getProperty name="ModifyQueryInputTask" property="ServletPath"/>" method="post" name="ModQueryInputForm" >
            <INPUT TYPE="hidden" NAME="<%=Constants.TASK_PARAM%>" VALUE="<%=Constants.MODIFY_QUERY_INPUT_TASK%>">
            <INPUT TYPE="hidden" NAME="<%=Constants.QUERY_ID_PARAM%>" VALUE="<jsp:getProperty name="ModifyQueryInputTask" property="QueryId"/>">
            <INPUT TYPE="hidden" NAME="<%=Constants.STEP_PARAM%>" VALUE="<%=Constants.SAVE_STEP%>">
            <TR><TD CLASS="statTextBig" COLSPAN="2"><%=Constants.MODIFY_QUERY_INPUT_NAME%></TD></TR>
            <TR><TD CLASS="statTextBig" COLSPAN="2" ALIGN="center">Query: <jsp:getProperty name="ModifyQueryInputTask" property="QueryName"/></TD></TR>
            <TR>
              <TD COLSPAN="2">
                <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
                  <TR>
                    <TD CLASS="statTextBig"></TD>
                    <TD CLASS="statTextBig">Input Code</TD>
                    <TD CLASS="statTextBig">Input Desc</TD>
                    <TD CLASS="statTextBig">Sort</TD>
                    <TD CLASS="statTextBig">Optional?</TD>
                    <TD CLASS="statTextBig">Default Value</TD>
                    <TD CLASS="statTextBig"></TD>
                  </TR>
                  <query:queryInputIterator id="queryInput" list="<%=ModifyQueryInputTask.getCurrentInputList()%>">
                    <TR>
                      <TD CLASS="statTextBig">
                        <A HREF="<jsp:getProperty name="ModifyQueryInputTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_INPUT_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="ModifyQueryInputTask" property="Db"/>&<%=Constants.INPUT_ID_PARAM%>=<jsp:getProperty name="queryInput" property="InputId"/>" class="statText">
                          [edit]
                        </A>
                      </TD>
                      <TD CLASS="statTextBig"><jsp:getProperty name="queryInput" property="InputCode"/></TD>
                      <TD CLASS="statTextBig"><jsp:getProperty name="queryInput" property="InputDesc"/></TD>
                      <TD CLASS="statTextBig">
                        <input type="text" name="<%=Constants.SORT_ORDER_PARAM%>" value ="<jsp:getProperty name="queryInput" property="SortOrder"/>" size="3" maxlength="3"/>
                      </TD>
                      <TD CLASS="statTextBig">
                        <input type="checkbox" name="<%=Constants.OPTIONAL_PARAM%>" class="bodyText" <%=input.isOptional()?"checked":""%>/>
                      <TD CLASS="statTextBig">
                        <input type="text" name="<%=Constants.DEFAULT_VALUE_PARAM%>" value ="<jsp:getProperty name="queryInput" property="DefaultValue"/>" size="30" maxlength="100"/>
                      </TD>
                      <TD CLASS="statTextBig">
                        <A HREF="<jsp:getProperty name="ModifyQueryInputTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_INPUT_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="ModifyQueryInputTask" property="Db"/>&<%=Constants.INPUT_ID_PARAM%>=<jsp:getProperty name="queryInput" property="InputId"/>&<%=Constants.QUERY_ID_PARAM%>=<jsp:getProperty name="ModifyQueryInputTask" property="QueryId"/>&<%=Constants.STEP_PARAM%>=<%=Constants.REMOVE_STEP%>" class="statText">
                          [remove]
                        </A>
                      </TD>
                    </TR>
                  </query:queryInputIterator>
                  <TR>
                    <TD CLASS="statTextBig" COLSPAN="7">
                        <A HREF="javascript: void document.ModQueryInputForm.submit()" class="statText">
                          [save]
                        </A>
                    </TD>
                  </TR>
                </TABLE>
              </TD>
            </TR>
          <FORM>
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
