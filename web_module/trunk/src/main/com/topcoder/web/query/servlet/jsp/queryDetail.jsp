<%@  page
  language="java"
  errorPage="errorPage.jsp"
  import= "com.topcoder.web.query.common.*,
           com.topcoder.web.query.bean.*"
%>
<%@ taglib uri="/query-taglib.tld" prefix="query"%>
<jsp:useBean id="QueryDetailTask" scope="request" class="com.topcoder.web.query.bean.QueryDetailTask" />
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
        <TABLE WIDTH="170" BORDER="0" CELLPADDING="0" CELLSPACING="0">
          <query:linkIterator id="link" list="<%=QueryDetailTask.getNavLinks()%>">
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
      <TD CLASS="statText" WIDTH="100%" BGCOLOR="#000000" VALIGN="top">
        <TABLE WIDTH="80%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
          <TR><TD CLASS="statTextBig" COLSPAN="2"><%=Constants.QUERY_DETAIL_NAME%></TD></TR>
          <TR><TD COLSPAN="2"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
          <TR><TD CLASS="statText" COLSPAN="2" ALIGN="center">
            Query: <jsp:getProperty name="QueryDetailTask" property="QueryName"/>
          </TD></TR>
          <TR><TD CLASS="statText" COLSPAN="2" ALIGN="center">
            <A HREF="<jsp:getProperty name="QueryDetailTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_QUERY_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="QueryDetailTask" property="Db"/>&<%=Constants.QUERY_ID_PARAM%>=<jsp:getProperty name="QueryDetailTask" property="QueryId"/>" class="statText">
              [edit query]
            </A>
            <A HREF="<jsp:getProperty name="QueryDetailTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_QUERY_INPUT_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="QueryDetailTask" property="Db"/>&<%=Constants.QUERY_ID_PARAM%>=<jsp:getProperty name="QueryDetailTask" property="QueryId"/>" class="statText">
              [edit query input]
            </A>
          </TD></TR>
          <TR><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8"></TD></TR>
          <TR>
            <TD VALIGN="top" WIDTH="100%" CLASS="statText">
              <pre><jsp:getProperty name="QueryDetailTask" property="QueryText"/></pre>
            </TD>
          </TR>
          <TR><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8"></TD></TR>
          <TR>
            <TD VALIGN="top" WIDTH="50%">
              <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
                <TR>
                  <TD CLASS="statText"></TD>
                  <TD CLASS="statText" ALIGN="left">Input Code</TD>
                  <TD CLASS="statText" ALIGN="left">Input Description</TD>
                </TR>
                <TR><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8"></TD></TR>
                <query:resultSetRowIterator id="input" list="<%=QueryDetailTask.getInputList()%>">
                  <TR>
                    <TD CLASS="statText" ALIGN="right">
                      <A HREF="<jsp:getProperty name="QueryDetailTask" property="ServletPath"/>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_INPUT_TASK%>&<%=Constants.DB_PARAM%>=<jsp:getProperty name="QueryDetailTask" property="Db"/>&<%=Constants.INPUT_ID_PARAM%>=<query:resultSetItem row="<%=input%>" name="input_id"/>" class="statText">
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
