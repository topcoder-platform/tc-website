<%
   boolean isSummaryhomePage = "true".equals(request.getParameter("isSummaryhomePage"));
   boolean isPhotosPage = "true".equals(request.getParameter("isPhotosPage"));
%>

                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="49%" class="tourney_subnav"><img src="/i/hs/clear.gif" alt="" width="10" height="1" border="0" /></td>

<!-- Summary tab -->
<% if (isSummaryhomePage) { %>
        <td class="tourney_subnav_on" nowrap="nowrap"><a href="?module=Static&d1=tournaments&d2=tchs03_summary_home" class="statText"><strong>Summary</strong></a></td>
<% } else { %>
        <td class="tourney_subnav" nowrap="nowrap"><a href="?module=Static&d1=tournaments&d2=tchs03_summary_home" class="statText"><strong>Summary</strong></a></td>
<%  } %>

<!-- Photos tab -->
 <% if (isPhotosPage) { %>
        <td class="tourney_subnav_on" nowrap="nowrap"><a href="?module=Static&d1=tournaments&d2=tchs03_summary_photos" class="statText"><strong>Photos</strong></a></td>
<% } else { %>
        <td class="tourney_subnav" nowrap="nowrap"><a href="?module=Static&d1=tournaments&d2=tchs03_summary_photos" class="statText"><strong>Photos</strong></a></td>
<%  } %>


                               <td width="49%" class="tourney_subnav"><img src="/i/hs/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>
                        </table>

