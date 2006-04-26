<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.onsite.Constants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
  String nextpage = (String)request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getParameter(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getHeader("Referer");
  if(nextpage==null) nextpage = "http://"+request.getServerName();
  String minWagerAmount = (String)request.getAttribute(Constants.MIN_WAGER_AMOUNT_KEY);
  String maxWagerAmount = (String)request.getAttribute(Constants.MAX_WAGER_AMOUNT_KEY);
%>

<html>
    <% ResultSetContainer currentCompetitions = (ResultSetContainer) request.getAttribute(Constants.CURRENT_COMPETITION_RESULT_KEY);
        ResultSetContainer wagerHistory = (ResultSetContainer) request.getAttribute(Constants.WAGER_HISTORY_KEY);%>
<head>
<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="http://<%=ApplicationServer.SERVER_NAME%>/css/TCO06style.css"/>
<link type="text/css" rel="stylesheet" href="http://<%=ApplicationServer.SERVER_NAME%>/css/coders.css"/>
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

<div style="float:right;">
<a href="http://<%=ApplicationServer.SERVER_NAME%>/"><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/tc_logo.gif" border=0/></a>
</div>
<A href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tournaments&d2=tco06&d3=about"><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/tco06_logo_AMDgrn.gif" border=0/></A>

<div style="padding: 20px 40px 200px 40px;" align="center">
   <div style="width: 500px;" align="center" class="bodyText">

   <span class="bigTitle">Component Competition Wager System</span>
   <br><br>
   
            <% if (currentCompetitions != null && currentCompetitions.size() > 0) {%>
                <% if (wagerHistory != null && wagerHistory.size() > 0) {%>
                You have already wagered on the following competitions:
               <br><br>
               <table width="400" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                    <tr valign="top">
                        <td class="sidebarTitle">
                            Contest
                        </td>
                        <td class="sidebarTitle" align="right">
                            Wager amount
                        </td>
                    </tr>
                    <rsc:iterator list="<%=wagerHistory%>" id="resultRow">
                        <tr valign="top">
                            <td class="sidebarText">
                                <rsc:item name="contest_name" row="<%=resultRow%>"/>
                            </td>
                            <td class="sidebarText" align="right">
                                <rsc:item name="wager_amount" row="<%=resultRow%>"/>
                            </td>
                        </tr>
                    </rsc:iterator>
                </table>
                <% } else {%>
                This is the first competition you are wagering on.
                <% } %>
               <br><br>
               Please enter your wager for:
               <strong>
               <rsc:item set="<%=currentCompetitions%>" name="contest_name"/>
               </strong><br>
               You may wager between <strong><%=minWagerAmount%></strong> and <strong><%=maxWagerAmount%></strong>
              <form method="post" name="frmWager" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
                  <tc-webtag:hiddenInput name="<%=Constants.PROJECT_ID_KEY%>"/>
                  <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>"/>
                      <table border="0" cellpadding="3" cellspacing="0">
                          <tr valign="middle">
                              <td nowrap class="bodyText" align="right">Amount:</td>
                              <td colspan="2" align="left"><input type="text" name="<%=Constants.WAGER_AMOUNT_KEY%>" value="" maxlength="2" size="2" onkeypress="submitEnter(event)"></td>
                              <td nowrap class="bodyText">&#160;&#160;<a href="JavaScript:document.frmWager.submit()">Wager&#160;&gt;</a></td>
                          </tr>
                      </table>
                      <script>
                          document.frmWager.<%=Constants.WAGER_AMOUNT_KEY%>.focus();
                      </script>
              </form>
            <% } else {%>
               You do not have current competitions to wager on.
               <br><br>
               <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>">Go back to menu<a/>
            <% } %>

   </div>
</div>

</body>
</html>
