<%@  page
  language="java"
  errorPage="errorPage.jsp"
  import="com.topcoder.web.query.common.Constants"%>
<%
    String db = request.getParameter(Constants.DB_PARAM)==null?"":request.getParameter(Constants.DB_PARAM);
    String servletPath = request.getParameter(Constants.SERVLET_PATH_PARAM)==null?"":request.getParameter(Constants.SERVLET_PATH_PARAM);
    String begin = servletPath+"?"+Constants.TASK_PARAM+"=";
    String end = "&"+Constants.DB_PARAM+"="+db;
%>
        <TABLE WIDTH="170" BORDER="0" CELLPADDING="0" CELLSPACING="0">
            <TR>
              <TD CLASS="statText">
                  <A HREF="<%=begin+Constants.DB_SELECTION_TASK+end%>" class="statText"><%=Constants.DB_SELECTION_NAME%></A>
              </TD>
            </TR>
            <TR><TD><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
            <TR>
              <TD CLASS="statText">
                  <A HREF="<%=begin+Constants.COMMAND_LIST_TASK+end%>" class="statText"><%=Constants.COMMAND_LIST_NAME%></A>
              </TD>
            </TR>
            <TR><TD><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
            <TR>
              <TD CLASS="statText">
                  <A HREF="<%=begin+Constants.MODIFY_COMMAND_TASK+end%>" class="statText"><%=Constants.MODIFY_COMMAND_NAME%></A>
              </TD>
            </TR>
            <TR><TD><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
            <TR>
              <TD CLASS="statText">
                  <A HREF="<%=begin+Constants.MODIFY_GROUP_TASK+end%>" class="statText"><%=Constants.MODIFY_GROUP_NAME%></A>
              </TD>
            </TR>
            <TR><TD><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
            <TR>
              <TD CLASS="statText">
                  <A HREF="<%=begin+Constants.MODIFY_QUERY_TASK+end%>" class="statText"><%=Constants.MODIFY_QUERY_NAME%></A>
              </TD>
            </TR>
            <TR><TD><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
            <TR>
              <TD CLASS="statText">
                  <A HREF="<%=begin+Constants.MODIFY_INPUT_TASK+end%>" class="statText"><%=Constants.MODIFY_INPUT_NAME%></A>
              </TD>
            </TR>
            <TR><TD><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD></TR>
        </TABLE>