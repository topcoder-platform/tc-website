<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page language="java" %>

<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
%>


<!-- Member Profiles, Search Pages, and Private Label Events Pages begins -->
<% if (level1.equals("all")) { %>

            <img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
            <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=aol"><img src="/i/tournament/tccc06/aol_right.gif" alt="AOL" border="0" /></a><br />

            <img src="/i/clear.gif" alt="" width="170" height="10" border="0" /><br />
            <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=nsa"><img src="/i/tournament/tccc06/nsa_right.gif" alt="NSA" border="0" /></a><br />
           
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=bloomberg"><img src="/i/tournament/tccc06/bloomberg_right.gif" alt="Bloomberg" border="0" /></a><br />
            
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=ubs"><img src="/i/tournament/tccc06/ubs_right.gif" alt="UBS" border="0" /></a><br />
           
           <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            <div align="center" class="bodyText"><strong><A href="/tc?module=Static&d1=calendar&d2=thisMonth">More TopCoder Events</A></strong></div>

            <p><br/></p>

<% } else if (level1.equals("aol")) { %>

            <img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
            <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=aol"><img src="/i/tournament/tccc06/aol_right.gif" alt="AOL" border="0" /></a><br />
             <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            <div align="center" class="bodyText"><strong><A href="/tc?module=Static&d1=calendar&d2=thisMonth">More TopCoder Events</A></strong></div>

            <p><br/></p>

<% } else if (level1.equals("nsa")) { %>

            <img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
            <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=nsa"><img src="/i/tournament/tccc06/nsa_right.gif" alt="NSA" border="0" /></a><br />
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            <div align="center" class="bodyText"><strong><A href="/tc?module=Static&d1=calendar&d2=thisMonth">More TopCoder Events</A></strong></div>

            <p><br/></p>

<% } else if (level1.equals("bloomberg")) { %>

            <img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
            <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=bloomberg"><img src="/i/tournament/tccc06/bloomberg_right.gif" alt="Bloomberg" border="0" /></a><br />
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            <div align="center" class="bodyText"><strong><A href="/tc?module=Static&d1=calendar&d2=thisMonth">More TopCoder Events</A></strong></div>

            <p><br/></p>

<% } else if (level1.equals("ubs")) { %>

            <img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
            <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=ubs"><img src="/i/tournament/tccc06/ubs_right.gif" alt="UBS" border="0" /></a><br />
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            <div align="center" class="bodyText"><strong><A href="/tc?module=Static&d1=calendar&d2=thisMonth">More TopCoder Events</A></strong></div>


<!-- 2006 TCCC ends -->


    <% } %>