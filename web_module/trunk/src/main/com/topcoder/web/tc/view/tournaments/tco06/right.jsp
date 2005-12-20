<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page language="java" %>

<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
%>


<!-- Member Profiles, Search Pages, and Private Label Events Pages begins -->
<% if (level1.equals("all")) { %>

            <img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
            <a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=nsa"><img src="/i/tournament/tco06/nsa_right.gif" alt="NSA" border="0" /></a><br />
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
<%--
            <a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=verisign"><img src="/i/tournament/tco06/verisign_right.gif" alt="VeriSign" border="0" /></a><br />
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            <jsp:include page="/calendar.jsp" />

            <p><br/></p>
--%>

<% } else if (level1.equals("nsa")) { %>

            <img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
            <a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=nsa"><img src="/i/tournament/tco06/nsa_right.gif" alt="NSA" border="0" /></a><br />
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            <jsp:include page="/calendar.jsp" />

            <p><br/></p>

<% } else if (level1.equals("verisign")) { %>

            <img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
            <a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=verisign"><img src="/i/tournament/tco06/verisign_right.gif" alt="VeriSign" border="0" /></a><br />
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            <jsp:include page="/calendar.jsp" />

            <p><br/></p>

<!-- 2006 TCO ends -->


    <% } %>