<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    String selectedTab = request.getParameter("selectedTab")==null?"":request.getParameter("selectedTab");
%>

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=no,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

<table border="0" cellspacing="0" cellpadding="0" width="100%">
   <tr>
      <td class="bodyText">
      <blockquote>
         <p>Thank you for supporting the TopCoder Charity Challenge benefiting the Christopher Reeve Paralysis Foundation.  Your generous donation will 
         allow CRPF to continue to fund the research of the world's most distinguished neuroscientists and support organizations around the country that 
         improve the quality of life of people living with disabilities.  Every dollar brings them closer to the cure!</p>
         <p>A donation from you will not only go directly to the Foundation, it will also help allow a programmer to compete in this prestigious tournament.  
         Their involvement in this tournament will grant them a chance to attend 'A Magical Evening' as a special guest.  'A Magical Evening' is the annual, 
         star-studded, gala ball in New York City to raise money and awareness for the Christopher Reeve Paralysis Foundation.</p>
         <p><br /></p>
      </blockquote>
      </td>
   </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
        <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>

<!-- Summary tab -->
            <% if (selectedTab.equals("overview")) {%>
                 <td class="statTextBig" width="88"><A href="/tc/?&module=Static&d1=crpf&d2=crpf_overview" class="statTextBig"><img src="/i/tournament/crpf03/tab_overview_on.gif" alt="Overview" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc/?&module=Static&d1=crpf&d2=crpf_overview" class="statTextBig"><img src="/i/tournament/crpf03/tab_overview_off.gif" alt="Overview" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Schedule tab -->
            <% if (selectedTab.equals("schedule")) {%>
                 <td class="statTextBig" width="88"><A href="/tc/?&module=Static&d1=crpf&d2=crpf_sched" class="statTextBig"><img src="/i/tournament/crpf03/tab_schedule_on.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc/?&module=Static&d1=crpf&d2=crpf_sched" class="statTextBig"><img src="/i/tournament/crpf03/tab_schedule_off.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Rules tab -->
            <% if (selectedTab.equals("rules")) {%>
                 <td class="statTextBig" width="88"><A href="/tc/?&module=Static&d1=crpf&d2=crpf_rules_overview" class="statTextBig"><img src="/i/tournament/crpf03/tab_rules_on.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc/?&module=Static&d1=crpf&d2=crpf_rules_overview" class="statTextBig"><img src="/i/tournament/crpf03/tab_rules_off.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Top Fundraisers tab -->
            <% if (selectedTab.equals("fundraisers")) {%>
                 <td class="statTextBig" width="128"><A href="/tc/?&module=CRPFReport" class="statTextBig"><img src="/i/tournament/crpf03/tab_top_fundraisers_on.gif" alt="Fundraisers" width="128" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="128"><A href="/tc/?&module=CRPFReport" class="statTextBig"><img src="/i/tournament/crpf03/tab_top_fundraisers_off.gif" alt="Fundraisers" width="128" height="22" border="0" /></A></td>
            <% } %>

<!-- Donate tab -->
            <% if (selectedTab.equals("donate")) {%>
                 <td class="statTextBig" width="88"><A href="/tc/?&module=Static&d1=crpf&d2=crpf_donate" class="statTextBig"><img src="/i/tournament/crpf03/tab_donate_on.gif" alt="Donate" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc/?&module=Static&d1=crpf&d2=crpf_donate" class="statTextBig"><img src="/i/tournament/crpf03/tab_donate_off.gif" alt="Donate" width="88" height="22" border="0" /></A></td>
            <% } %>

                                
      <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>
   </tr>
</table>
