<%@  page
  language="java"
  import="com.topcoder.web.query.common.Constants"%>
<%
    String db = request.getParameter(Constants.DB_PARAM)==null?"":request.getParameter(Constants.DB_PARAM);
    String servletPath = request.getParameter(Constants.SERVLET_PATH_PARAM)==null?"":request.getParameter(Constants.SERVLET_PATH_PARAM);
    String begin = servletPath+"?"+Constants.TASK_PARAM+"=";
    String end = "&"+Constants.DB_PARAM+"="+db;
%>
        <table width="170" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td class="statText">
                  <A href="<%=begin+Constants.DB_SELECTION_TASK+end%>" class="statText"><%=Constants.DB_SELECTION_NAME%></A>
              </td>
            </TR>
            <tr><td><img src="/i/clear.gif" width="4" height="8"></td></TR>
            <tr>
              <td class="statText">
                  <A href="<%=begin+Constants.COMMAND_LIST_TASK+end%>" class="statText"><%=Constants.COMMAND_LIST_NAME%></A>
              </td>
            </TR>
            <tr><td><img src="/i/clear.gif" width="4" height="8"></td></TR>
            <tr>
              <td class="statText">
                  <A href="<%=begin+Constants.QUERY_LIST_TASK+end%>" class="statText"><%=Constants.QUERY_LIST_NAME%></A>
              </td>
            </TR>
            <tr><td><img src="/i/clear.gif" width="4" height="8"></td></TR>
            <tr>
              <td class="statText">
                  <A href="<%=begin+Constants.MODIFY_COMMAND_TASK+end%>" class="statText">New Command</A>
              </td>
            </TR>
            <tr><td><img src="/i/clear.gif" width="4" height="8"></td></TR>
            <tr>
              <td class="statText">
                  <A href="<%=begin+Constants.MODIFY_GROUP_TASK+end%>" class="statText">New Command Group</A>
              </td>
            </TR>
            <tr><td><img src="/i/clear.gif" width="4" height="8"></td></TR>
            <tr>
              <td class="statText">
                  <A href="<%=begin+Constants.MODIFY_QUERY_TASK+end%>" class="statText">New Query</A>
              </td>
            </TR>
            <tr><td><img src="/i/clear.gif" width="4" height="8"></td></TR>
            <tr>
              <td class="statText">
                  <A href="<%=begin+Constants.MODIFY_INPUT_TASK+end%>" class="statText">New Input</A>
              </td>
            </TR>
            <tr><td><img src="/i/clear.gif" width="4" height="8"></td></TR>
        </table>