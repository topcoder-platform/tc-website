<%@  page
  language="java"
  errorPage="errorPage.jsp"
  import= "com.topcoder.web.query.bean.Task,
           com.topcoder.web.query.common.Constants"
%>
<% String servletPath = request.getParameter(Constants.SERVLET_PATH_PARAM); %>
<TABLE WIDTH="170" BORDER="0" CELLPADDING="0" CELLSPACING="0">
  <TR>
    <TD CLASS="statText">
      <A HREF="<%=servletPath%>?<%=Constants.TASK_PARAM%>=<%=Constants.DB_SELECTION_TASK%>" class="statText">
        Select DB
      </A>
    </TD>
  </TR>
  <TR>
    <TD CLASS="statText">
      <A HREF="<%=servletPath%>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_INPUT_TASK%>" class="statText">
        New Input
      </A>
    </TD>
  </TR>
  <TR>
    <TD CLASS="statText">
      <A HREF="<%=servletPath%>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_QUERY_TASK%>" class="statText">
        New Query
      </A>
    </TD>
  </TR>
  <TR>
    <TD CLASS="statText">
      <A HREF="<%=servletPath%>?<%=Constants.TASK_PARAM%>=<%=Constants.MODIFY_COMMAND_TASK%>" class="statText">
        New Command
      </A>
    </TD>
  </TR>
</TABLE>