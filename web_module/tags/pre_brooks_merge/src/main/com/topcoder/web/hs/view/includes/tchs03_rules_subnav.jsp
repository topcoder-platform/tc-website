<%
   boolean isOverviewPage = "true".equals(request.getParameter("isOverviewPage"));
   boolean isConditionsPage = "true".equals(request.getParameter("isConditionsPage"));
   boolean isStructurePage = "true".equals(request.getParameter("isStructurePage"));
   boolean isOnlinePage = "true".equals(request.getParameter("isOnlinePage"));
%>

                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="49%" class="tourney_subnav"><img src="/i/hs/clear.gif" alt="" width="10" height="1" border="0" /></td>

<!-- Overview tab -->
<% if (isOverviewPage) { %>
        <td class="tourney_subnav_on" nowrap="nowrap"><a href="?module=Static&d1=tournaments&d2=tchs03_rules_overview" class="statText"><strong>Overview</strong></a></td>
<% } else { %>
        <td class="tourney_subnav" nowrap="nowrap"><a href="?module=Static&d1=tournaments&d2=tchs03_rules_overview" class="statText"><strong>Overview</strong></a></td>
<%  } %>

<!-- Conditions tab -->
<% if (isConditionsPage) { %>
        <td class="tourney_subnav_on" nowrap="nowrap"><a href="?module=Static&d1=tournaments&d2=tchs03_rules_conditions" class="statText"><strong>Conditions</strong></a></td>
<% } else { %>
        <td class="tourney_subnav" nowrap="nowrap"><a href="?module=Static&d1=tournaments&d2=tchs03_rules_conditions" class="statText"><strong>Conditions</strong></a></td>
<%  } %>

<!-- Round Structure tab -->
<% if (isStructurePage) { %>
        <td class="tourney_subnav_on" nowrap="nowrap"><a href="?module=Static&d1=tournaments&d2=tchs03_rules_structure" class="statText"><strong>Round Structure</strong></a></td>
<% } else { %>
        <td class="tourney_subnav" nowrap="nowrap"><a href="?module=Static&d1=tournaments&d2=tchs03_rules_structure" class="statText"><strong>Round Structure</strong></a></td>
<%  } %>

<!-- Online/Onsite Rounds tab -->
<% if (isOnlinePage) { %>
        <td class="tourney_subnav_on" nowrap="nowrap"><a href="?module=Static&d1=tournaments&d2=tchs03_rules_online" class="statText"><strong>Final Round</strong></a></td>
<% } else { %>
        <td class="tourney_subnav" nowrap="nowrap"><a href="?module=Static&d1=tournaments&d2=tchs03_rules_online" class="statText"><strong>Final Round</strong></a></td>
<%  } %>

                               <td width="49%" class="tourney_subnav"><img src="/i/hs/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>
                        </table>

