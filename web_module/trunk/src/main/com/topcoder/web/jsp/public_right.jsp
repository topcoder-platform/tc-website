<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page language="java" %>

<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
%>

<% if (level1.equals("profile")) { %>

            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />


<!-- Save until Premier Sponsors come online -->
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            
            <img src="/i/tournament/tco03/promo_tco_header.gif" alt="2003 TopCoder Open Sponsors" width="170" height="62" border="0" /><br />
            
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />

            <A href="/?t=tournaments&amp;c=tco03_intel"><img src="/i/tournament/tco03/promo_sm_intel.gif" alt="Intel Developer Services" width="171" height="104" border="0" /></A><br />
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            
            <A href="/?t=tournaments&amp;c=tco03_revelation"><img src="/i/tournament/tco03/promo_sm_revelation.gif" alt="Revelation Software" width="170" height="84" border="0" /></A><br/>
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            
            <A href="/corp/?module=Static&amp;d1=corp&amp;d2=spon_prog&amp;d3=tourny_index"><img src="/i/tournament/tco03/promo_sponsor_tco.gif" alt="Sponsor the TCO" width="170" height="115" border="0" /></A><br />

            <img alt="" width="1" height="10" src="/i/clear.gif" border="0"/><br/>

            <jsp:include page="../calendar.jsp" />

            <p><br/></p>

<!-- Review Board begins -->
<% } else if (request.getServletPath().indexOf("review_board")>-1) { %>

            <jsp:include page="calendar.jsp"/>
            <img alt="" width="1" height="10" src="/i/spacer.gif" border="0"><br>
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/?t=tournaments&c=tco03_overview"><img src="/i/promos/tco03/promo_2003_open_small.gif" alt="2003 TopCoder Open" width="170" height="117" border="0"></a><br>
            <img alt="" width="1" height="10" src="/i/spacer.gif" border="0"><br>
<!-- Review Board ends -->

    <% } else { %>

                &nbsp;

    <% } %>