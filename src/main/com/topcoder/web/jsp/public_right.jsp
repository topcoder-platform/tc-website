<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page language="java" %>

<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
%>

<script type="text/javascript" language="javascript">
<!-- HIDE FROM OLD BROWSERS
function timer(last) {
  var d = document;
  var stuff = [['/i/tournament/tco03/promo_sm_revelation.gif', '/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_revelation'], ['/i/tournament/tco03/promo_sm_northface.gif', '/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_northface'], ['/i/tournament/tco03/promo_sm_artifact.gif', '/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_artifact']];
  curr = (last+1)%stuff.length;
  document.changerImg.src=stuff[curr][0];
  find('changerHref').href=stuff[curr][1];
  setTimeout("timer(curr)", 5000);
}
function find(n) {
  var s = document.anchors;
  for (var i=0; i<s.length; i++) {
    if (s[i].name==n) return s[i];
  }
}
// END HIDING --> 
</script>
<% if ((level1.equals("profile")) | (level1.equals("privatelabel"))) { %>

            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            
            <img src="/i/tournament/tco03/promo_tco_header.gif" alt="2003 TopCoder Open Sponsors" width="170" height="62" border="0" /><br />
            
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />

            <A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_intel"><img src="/i/tournament/tco03/promo_sm_intel.gif" alt="Intel Developer Services" width="171" height="104" border="0" /></A><br />
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            
            <A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_nvidia"><img src="/i/tournament/tco03/promo_sm_nvidia.gif" alt="NVIDIA" width="170" height="95" border="0" /></A><br />
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />

            <A href="" name="changerHref"><img src="" name="changerImg" width="170" height="84" border="0" /></A><br />
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            
            <jsp:include page="../calendar.jsp" />

            <p><br/></p>

<!-- Review Board begins -->
<% } else if (request.getServletPath().indexOf("review_board")>-1) { %>

            <img alt="" width="1" height="10" src="/i/spacer.gif" border="0"><br/>
            <jsp:include page="calendar.jsp"/>
            <img alt="" width="1" height="10" src="/i/spacer.gif" border="0"><br/>
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_sched#online"><img src="/i/promos/tco_promo_third.gif" alt="2003 TopCoder Open" width="170" height="120" border="0"></a><br/>
            <img alt="" width="1" height="10" src="/i/spacer.gif" border="0"><br/>
<!-- Review Board ends -->

    <% } else { %>

                &nbsp;

    <% } %>