<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page language="java" %>

<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
%>

<%--
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
--%>

<!-- Member Profiles, Search Pages, and Private Label Events Pages begins -->
<% if ((level1.equals("profile")) | (level1.equals("search")) | (level1.equals("privatelabel"))) { %>

            <img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
            
            <A href="/i/downloads/tco03_guide.pdf"  target="_blank"><img src="/i/promos/tco_guide_promo_third.gif" alt="The TCO Guide" width="170" height="150" border="0" /></A><br/>

            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            
            <jsp:include page="../calendar.jsp" />

            <p><br/></p>
<!-- Member Profiles, Search Pages, and Private Label Events Pages ends -->

<!-- About Us begins -->
<% } else if (level1.equals("about")) { %>

            <img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
            
            <A href="mailto:tces@topcoder.com?subject=Yes, I'm looking to hire top quality developers"><img src="/i/es/animated_emp_promo.gif" alt="Contact TCES" width="170" height="119" border="0" /></A><br/>

            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            
            <A href="/i/downloads/tco03_guide.pdf"  target="_blank"><img src="/i/promos/tco_guide_promo_third.gif" alt="The TCO Guide" width="170" height="150" border="0" /></A><br/>

            <img alt="" width="1" height="10" src="/i/spacer.gif" border="0"><br/>

            <jsp:include page="calendar.jsp"/>

            <p><br/></p>

<!-- About Us ends -->

<!-- Review Board begins -->
<% } else if (level1.equals("review_board")) { %>

            <img src="/i/clear.gif" alt="" width="170" height="15" border="0"><br/>

            <jsp:include page="calendar.jsp"/>

            <p><br/></p>

<!-- Review Board ends -->

    <% } else { %>

                &nbsp;

    <% } %>