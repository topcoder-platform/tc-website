<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.onsite.Constants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
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
        <table width="100%" border="0" cellpadding="0" cellspacing="5">
            <% if (currentCompetitions != null && currentCompetitions.size() > 0) {%>
                <% if (wagerHistory != null && wagerHistory.size() > 0) {%>
                    <tr valign="top">
                        <td colspan="3">
                            You have already waggered on the following competitions:
                        </td>
                    </tr>
                    <tr valign="top">
                        <td>
                            <table border="2">
                                <tr valign="top">
                                    <td>
                                        Contest
                                    </td>
                                    <td align="right">
                                        Wager amount
                                    </td>
                                </tr>
                                <rsc:iterator list="<%=wagerHistory%>" id="resultRow">
                                    <tr valign="top">
                                        <td>
                                            <rsc:item name="contest_name" row="<%=resultRow%>"/>
                                        </td>
                                        <td align="right">
                                            <rsc:item name="wager_amount" row="<%=resultRow%>"/>
                                        </td>
                                    </tr>
                                </rsc:iterator>
                            </table>
                        </td>
                    </tr>
                <% } else {%>
                    <tr valign="top">
                        <td>
                            This is the first competition you are waggering on.
                        </td>
                    </tr>
                <% } %>
                <table border="0" cellpadding="0" cellspacing="5">
                    <tr valign="top">
                        <td>
                            Please enter your wager for:
                        </td>
                        <td>
                            <b>
                                <rsc:item set="<%=currentCompetitions%>" name="contest_name"/>
                            </b>
                        </td>
                    </tr>
                </table>
                <tr>
                    <form method="post" name="frmWager" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
                        <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= nextpage %>">
                        <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="SubmitWager">
                        <input type="hidden" name="<%=Constants.PROJECT_ID_KEY%>" value="<rsc:item set="<%=currentCompetitions%>" name="project_id"/>">
                        <td class="bodyText">
                            <table border="0" cellpadding="3" cellspacing="0">
                                <tr valign="middle">
                                    <td nowrap class="bodyText" align="right">Amount:</td>
                                    <td colspan="2" align="left"><input type="text" name="<%=Constants.WAGER_AMOUNT_KEY%>" value="" maxlength="2" size="2" onkeypress="submitEnter(event)"></td>
                                    <td nowrap class="bodyText">&#160;&#160;<a href="JavaScript:document.frmWager.submit()" class="bodyText">Wager&#160;&gt;</a></td>
                                </tr>
                            </table>
                            <p><br/></p>
                            <script>
                                document.frmWager.<%=Constants.WAGER_AMOUNT_KEY%>.focus();
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
