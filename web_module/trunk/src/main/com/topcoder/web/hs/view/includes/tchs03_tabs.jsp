<%
   boolean isSummaryPage = "true".equals(request.getParameter("isSummaryPage"));
   boolean isSchoolsPage = "true".equals(request.getParameter("isSchoolsPage"));
   boolean isSchedulePage = "true".equals(request.getParameter("isSchedulePage"));
   boolean isRulesPage = "true".equals(request.getParameter("isRulesPage"));
%>

                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                            <tr>
                                <td width="49%"><img src="/i/hs/clear.gif" alt="" width="10" height="10" border="0" /></td>

<!-- Summary tab --> 
<% if (isSummaryPage) { %>
        <td class="statTextBig" nowrap="nowrap"><a href="?module=Static&d1=tournaments&d2=tchs03_summary_home" class="statTextBig"><img src="/i/hs/tournament/tchs03/summary_on.gif" alt="Summary" width="85" height="21" border="0"></a></td>
<% } else { %>
        <td class="statTextBig" nowrap="nowrap"><a href="?module=Static&d1=tournaments&d2=tchs03_summary_home" class="statTextBig"><img src="/i/hs/tournament/tchs03/summary_off.gif" alt="Summary" width="85" height="21" border="0"></a></td>
<%  } %>

<!-- Schools tab -->
<% if (isSchoolsPage) { %>
        <td class="statTextBig" nowrap="nowrap"><a href="?module=Static&d1=tournaments&d2=tchs03_schools" class="statTextBig"><img src="/i/hs/tournament/tchs03/schools_on.gif" alt="Schools" width="154" height="21" border="0"></a></td>
<% } else { %>
        <td class="statTextBig" nowrap="nowrap"><a href="?module=Static&d1=tournaments&d2=tchs03_schools" class="statTextBig"><img src="/i/hs/tournament/tchs03/schools_off.gif" alt="Schools" width="154" height="21" border="0"></a></td>
<%  } %>

<!-- Schedule tab -->
<% if (isSchedulePage) { %>
        <td class="statTextBig" nowrap="nowrap"><a href="?module=Static&d1=tournaments&d2=tchs03_schedule" class="statTextBig"><img src="/i/hs/tournament/tchs03/schedule_on.gif" alt="Schedule" width="85" height="21" border="0"></a></td>
<% } else { %>
        <td class="statTextBig" nowrap="nowrap"><a href="?module=Static&d1=tournaments&d2=tchs03_schedule" class="statTextBig"><img src="/i/hs/tournament/tchs03/schedule_off.gif" alt="Schedule" width="85" height="21" border="0"></a></td>
<%  } %>

<!-- Rules tab -->
<% if (isRulesPage) { %>
        <td class="statTextBig" nowrap="nowrap"><a href="?module=Static&d1=tournaments&d2=tchs03_rules_overview" class="statTextBig"><img src="/i/hs/tournament/tchs03/rules_on.gif" alt="Rules" width="63" height="21" border="0"></a></td>
<% } else { %>
        <td class="statTextBig" nowrap="nowrap"><a href="?module=Static&d1=tournaments&d2=tchs03_rules_overview" class="statTextBig"><img src="/i/hs/tournament/tchs03/rules_off.gif" alt="Rules" width="63" height="21" border="0"></a></td>
<%  } %>

<!-- UConn tab -->
                                <td class="statTextBig" nowrap="nowrap"><a href="http://www.uconn.edu" target="_blank" class="statTextBig"><img src="/i/hs/tournament/tchs03/uconn_off.gif" alt="www.UConn.edu" width="125" height="21" border="0"></a></td>

                                <td width="49%"><img src="/i/hs/clear.gif" alt="" width="10" height="10" border="0" /></td>
                </tr>
            </table>
