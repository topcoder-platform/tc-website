<%@  page
  language="java"
  import="com.topcoder.web.query.common.Constants"%>
  <jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo" />
<%
    String db = request.getParameter(Constants.DB_PARAM)==null?"":request.getParameter(Constants.DB_PARAM);
    String servletPath = sessionInfo.getServletPath();
    String begin = servletPath+"?"+Constants.TASK_PARAM+"=";
    String end = "&"+Constants.DB_PARAM+"="+db;
%>
        <table width="170" border="0" cellpadding="3" cellspacing="1">
            <tr>
              <td class="statText">
                  <A href="<%=begin+Constants.DB_SELECTION_TASK+end%>" class="statText"><%=Constants.DB_SELECTION_NAME%></A>
              </td>
            </tr>
            <tr>
              <td class="statText">
                  <A href="<%=begin+Constants.COMMAND_LIST_TASK+end%>" class="statText"><%=Constants.COMMAND_LIST_NAME%></A>
              </td>
            </tr>
            <tr>
              <td class="statText">
                  <A href="<%=begin+Constants.QUERY_LIST_TASK+end%>" class="statText"><%=Constants.QUERY_LIST_NAME%></A>
              </td>
            </tr>
            <tr>
              <td class="statText">
                  <A href="<%=begin+Constants.QUERY_SEARCH_TASK+end%>" class="statText"><%=Constants.QUERY_SEARCH_NAME%></A>
              </td>
            </tr>
            <tr>
              <td class="statText">
                  <A href="<%=begin+Constants.MODIFY_COMMAND_TASK+end%>" class="statText">New Command</A>
              </td>
            </tr>
            <tr>
              <td class="statText">
                  <A href="<%=begin+Constants.MODIFY_GROUP_TASK+end%>" class="statText">New Command Group</A>
              </td>
            </tr>
            <tr>
              <td class="statText">
                  <A href="<%=begin+Constants.MODIFY_QUERY_TASK+end%>" class="statText">New Query</A>
              </td>
            </tr>
            <tr>
              <td class="statText">
                  <A href="<%=begin+Constants.MODIFY_INPUT_TASK+end%>" class="statText">New Input</A>
              </td>
            </tr>
        </table>