<%@  page
  language="java"
  errorPage="errorPage.jsp"
  import= "com.topcoder.web.query.common.*,
          com.topcoder.web.query.bean.*"
%>
<%@ taglib uri="/query-taglib.tld" prefix="query"%>
<jsp:useBean id="CommandDetailTask" scope="request" class="com.topcoder.web.query.bean.CommandDetailTask" />
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
      </TD>
      <TD WIDTH="4" BGCOLOR="#001935" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD>
      <TD class="statText" width="100%" bgcolor="#001935" valign="top"><img src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
        <TABLE WIDTH="100%" HEIGHT="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
          <TR><TD class="statText" COLSPAN="2">Command Detail</TD></TR>
          <TR><TD class="statTextBig" COLSPAN="2"><jsp:getProperty name="CommandDetailTask" property="CommandDesc"/></TD></TR>
          <TR><TD class="statTextBig" COLSPAN="2"><jsp:getProperty name="CommandDetailTask" property="GroupDesc"/></TD></TR>
          <TR>
            <TD>
              <TABLE WIDTH="100%" HEIGHT="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
                <query:resultSetRowIterator id="query" rowList="<%=CommandDetailTask.getQueryList()%>">
                  <TR>
                    <TD class="statText">
                      <query:resultSetItem row="<%=query%>" name="name"/>
                    </TD>
                    <TD class="statText">
                      <A HREF="<jsp:getProperty name="CommandDetailTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_QUERY_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="CommandDetailTask" property="Db"/>&<%=Constants.QUERY_ID_PARAM%>=<query:resultSetItem row="<%=query%>" name="query_id"/>" class="statText">
                        [edit]
                      </A>
                    </TD>
                  </TR>
                </query:resultSetRowIterator>
                <TR>
                  <TD class="statText">
                    <A HREF="<jsp:getProperty name="CommandDetailTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_QUERY_TASK%>" class="statText">
                      [new]
                    </A>
                  </TD>
                </TR>
              </TABLE>
            </TD>
            <TD>
              <TABLE WIDTH="100%" HEIGHT="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
                <query:resultSetRowIterator id="input" rowList="<%=CommandDetailTask.getInputList()%>">
                  <TR>
                    <TD class="statText">
                      <query:resultSetItem row="<%=input%>" name="input_code"/> - <query:resultSetItem row="<%=input%> name="input_desc"/>
                    </TD>
                    <TD class="statText">
                      <A HREF="<jsp:getProperty name="CommandDetailTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_INPUT_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="CommandDetailTask" property="Db"/>&<%=Constants.INPUT_ID_PARAM%>=<query:resultSetItem row="<%=input%>" name="input_id"/>" class="statText">
                        [edit]
                      </A>
                    </TD>
                  </TR>
                </query:resultSetRowIterator>
                <TR>
                  <TD class="statText">
                    <A HREF="<jsp:getProperty name="CommandDetailTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_INPUT_TASK%>" class="statText">
                      [new]
                    </A>
                  </TD>
                </TR>
              </TABLE>
            </TD>
          </TR>
        </TABLE>
      </TD>
      <TD WIDTH="4" bgcolor="#001935"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"></TD>
      <TD WIDTH="10" bgcolor="#001935" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"><BR>
      </TD>
      <TD WIDTH="25" bgcolor="#001935"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>
    </TR>
  </TABLE>
  </BODY>
</HTML>
