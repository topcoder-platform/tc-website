<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.onsite.controller.request.SubmitWager,
                 com.topcoder.web.onsite.Constants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
  String nextpage = (String)request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getParameter(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getHeader("Referer");
  if(nextpage==null) nextpage = "http://"+request.getServerName();
  String message = (String)request.getAttribute("message");
  if(message==null) message = "";
%>

<html>
    <% ResultSetContainer currentCompetitions = (ResultSetContainer) request.getAttribute(Constants.CURRENT_COMPETITION_RESULT_KEY);
        ResultSetContainer wagerHistory = (ResultSetContainer) request.getAttribute(Constants.WAGER_HISTORY_KEY);%>
    <head>
        <title>TopCoder | View Competitions</title>
        <SCRIPT type="text/javascript">
        function submitEnter(e) {
            var keycode;
            if (window.event) keycode = window.event.keyCode;
            else if (e) keycode = e.which;
            else return true;
            if (keycode == 13) {
             document.frmWager.submit();
             return false;
            } else return true;
          }
        </SCRIPT>
    </head>
    
    <body>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <% if (currentCompetitions != null && currentCompetitions.size() > 0) {%>
                <tr valign="top">
                    <% if (wagerHistory != null && wagerHistory.size() > 0) {%>
                        <td>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <% for (int i=0; i < wagerHistory.size(); i++) {%>
                                    <tr valign="top">
                                        <!--td>
                                            <%= wagerHistory.getStringItem(i, Constants.CREATE_DATE_COL) %>
                                        </td-->
                                        <td>
                                            <%= wagerHistory.getStringItem(i, Constants.CONTEST_NAME_COL) %>
                                        </td>
                                        <td>
                                            <%= wagerHistory.getIntItem(i, Constants.WAGER_AMOUNT_COL) %>
                                        </td>
                                    </tr>
                                <% } %>
                            </table>
                        </td>
                    <% } else {%>
                        <td>
                            This is the first competition you are waggering on.
                        </td>
                    <% } %>
                </tr>
                <tr valign="top">
                    <td>
                        Please enter your wager for:
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>
                            <%= currentCompetitions.getStringItem(0, Constants.CONTEST_NAME_COL) %>
                        </p>
                    </td>
                </tr>
                <tr>
                      <form method="post" name="frmWager" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
                        <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= nextpage %>">
                        <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="SubmitWager">
                        <input type="hidden" name="<%=Constants.PROJECT_ID_KEY%>" value="<%=currentCompetitions.getStringItem(0, Constants.PROJECT_ID_COL)%>">
                        <td class="bodyText">
                            <table border="0" cellpadding="3" cellspacing="0">
                               <tr><td colspan="3"><img src="/i/clear.gif" width="10" height="3" alt="" border="0"></td></tr>
                                <tr valign="top">
                                    <td class="errorText" colspan="3">
                                        <p><%= message %></p>
                                    </td>
                                </tr>
    
                                <tr valign="middle">
                                    <td nowrap class="bodyText" align="right">Amount:</td>
                                    <td colspan="2" align="left"><input type="text" name="<%=Constants.WAGER_AMOUNT%>" value="" maxlength="2" size="2" onkeypress="submitEnter(event)"></td>
                                    <td nowrap class="bodyText">&#160;&#160;<a href="JavaScript:document.frmWager.submit()" class="bodyText">Wager&#160;&gt;</a></td>
                                </tr>
    
                               <tr><td colspan="3"><img src="/i/clear.gif" width="10" height="3" alt="" border="0"></td></tr>
                            </table>
                            <p><br/></p>
    
                        <script>
                          document.frmWager.<%=Constants.WAGER_AMOUNT%>.focus();
                        </script>
    
                        </td>
                      </form>
                </tr>
            <% } else {%>
                <tr>
                    <td>
                        <p>
                            You do not have current competitions to wager on.
                        </p>
                        <p>
                        <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>">Go back to menu<a/>
                        </p>
                    </td>
                </tr>
            <% } %>
        </table>
    </body>
</html>

