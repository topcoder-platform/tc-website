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
<% if ((level1.equals("profile")) | (level1.equals("search")) | (level1.equals("tournament")) | (level1.equals("privatelabel"))) { %>

          <img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
            
            
            <jsp:include page="../calendar.jsp" />
            
            <p><br/></p>
<!-- Member Profiles, Search Pages, and Private Label Events Pages ends -->

<!-- 2004 TCO begins -->
<% } else if (level1.equals("tco04")) { %>

         <img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
         
         <img src="/i/tournament/tco04/right_header.gif" alt="Great Opportunities are Available from our Sponsors" width="170" height="65" border="0" /><br />
            
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            
            <a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=microsoft"><img src="/i/tournament/tco04/microsoft_right.jpg" alt="Microsoft" width="170" height="90" border="0" /></a><br />
         
         <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            
            <a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=nvidia"><img src="/i/tournament/tco04/nvidia_right.jpg" alt="NVIDIA" width="170" height="80" border="0" /></a><br />
         
         <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />

          <a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=intel"><img src="/i/tournament/tco04/intel_right.jpg" alt="Intel Developer Services" width="170" height="80" border="0" /></a><br />
         
         <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
         
            <a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=yahoo"><img src="/i/tournament/tco04/yahoo_right.gif" alt="Yahoo!" width="170" height="80" border="0" /></a><br />
            
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            
            <jsp:include page="../calendar.jsp" />
            


            <p><br/></p>

<!-- 2004 TCO ends -->


<!-- 2005 TCCC begins -->
<% } else if (level1.equals("tccc05")) { %>

            <img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
         
            <a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=yahoo"><img src="/i/tournament/tccc05/yahoo_right.gif" alt="yahoo" border="0" /></a><br />
            
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            
            <a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=motorola"><img src="/i/tournament/tccc05/motorola_right.gif" alt="Motorola" border="0" /></a><br />
            
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            
            <jsp:include page="../calendar.jsp" />

            <p><br/></p>

<!-- 2005 TCCC ends -->

<!-- Microsoft begins -->
<% } else if (level1.equals("microsoft")) { %>

         <img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
         
         <a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=microsoft&d4=joblisting"><img src="/i/tournament/tco04/mc_animated.gif" alt="Jobs at Microsoft" width="170" height="90" border="0" /></a><br />    
            
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            
            <jsp:include page="../calendar.jsp" />
            
            
            <p><br/></p>

<!-- Microsoft ends -->

<!-- Motorola begins -->
<% } else if (level1.equals("motorola")) { %>

            <img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
         
            <a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=motorola"><img src="/i/tournament/tccc05/motorola_right.gif" alt="Motorola" border="0" /></a><br />
            
            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            
            <jsp:include page="../calendar.jsp" />
            
            <p><br/></p>

<!-- Motorola ends -->

<!-- NVIDIA begins -->
<% } else if (level1.equals("nvidia")) { %>

         <img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
         
         <a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=nvidia&d4=joblisting"><img src="/i/tournament/tco04/nvidia_jobs.gif" alt="NVIDIA" width="170" height="80" border="0" /></a><br />
         
         <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            
            <jsp:include page="../calendar.jsp" />
             
            <p><br/></p>

<!-- NVIDIA ends -->

<!-- Intel begins -->
<% } else if (level1.equals("intel")) { %>

         <img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
         
          <a href="/?RoundId=5856&t=schedule&c=srm"><img src="/i/tournament/tco04/intel_opportunities.jpg" alt="Intel Opportunities" width="170" height="80" border="0" /></a><br />
         
         <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            
            <jsp:include page="../calendar.jsp" />
            
            <p><br/></p>

<!-- Intel ends -->

<!-- Yahoo begins -->
<% } else if (level1.equals("yahoo")) { %>

         <img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
         
            <a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=yahoo"><img src="/i/tournament/tccc05/yahoo_right.gif" alt="yahoo" border="0" /></a><br />
         
         <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
            
            <jsp:include page="../calendar.jsp" />
            
            <p><br/></p>

<!-- Yahoo ends -->

<!-- About Us begins -->
<% } else if (level1.equals("about")) { %>

            <img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
            
            <A href="mailto:tces@topcoder.com?subject=Yes, I'm looking to hire top quality developers"><img src="/i/es/animated_emp_promo.gif" alt="Contact TCES" width="170" height="119" border="0" /></A><br/>

            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />       
            
            <jsp:include page="calendar.jsp"/>

            <p><br/></p>

<!-- About Us ends -->

<% } else if (level1.equals("card")) { %>

            <div class="cardRightTop"><A href="mailto:tces@topcoder.com?subject=Yes, I'm looking to hire top quality developers"><IMG src="/i/es/animated_emp_promo.gif" alt="" width="170" height="119" border="0" /></A></div>
            <div class="cardRight"><a href="/i/corp/downloads/tc_demo_tces.pdf"><img src="/i/corp/promos/tc_demo_tces.gif" alt="Download TCES Demographics" width="170" height="218" border="0"></a></div>

            <p><br/></p>

<!-- Review Board begins -->
<% } else if (level1.equals("review_board")) { %>

            <img src="/i/clear.gif" alt="" width="170" height="15" border="0"><br/>

            <jsp:include page="calendar.jsp"/>

            <p><br/></p>

<!-- Review Board ends -->

    <% } else { %>

                &nbsp;

    <% } %>