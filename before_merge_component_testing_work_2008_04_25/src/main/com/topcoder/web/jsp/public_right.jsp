<%@ page language="java" %>

<%
    String level1 = request.getParameter("level1") == null ? "" : request.getParameter("level1");
%>

<script type="text/javascript" language="javascript">
<%-- HIDE FROM OLD BROWSERS
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
// END HIDING --%>
</script>

<%-- Member Profiles, Search Pages, and Private Label Events Pages begins --%>
<% if ((level1.equals("default")) | (level1.equals("profile")) | (level1.equals("search")) | (level1.equals("tournament")) | (level1.equals("privatelabel"))) { %>

    <div style="width:150px;">
        &nbsp;
    </div>

<% } else if (level1.equals("branded")) { %>

    <div align="center">
<%-- NSA 
        <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=nsa"><img src="/i/tournament/tco08/right_nsa.png" alt="NSA" /></a>
--%>
<%-- Lilly 
        <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=lilly"><img src="/i/tournament/tco08/right_lilly.png" alt="Lilly" /></a>
--%>
<%-- AOL 
        <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=aol"><img src="/i/tournament/tco08/right_aol.png" alt="AOL" /></a>
--%>
&nbsp;

    </div>

<%-- 2004 TCO begins --%>
<% } else if (level1.equals("tco04")) { %>

<img src="/i/clear.gif" alt="" width="170" height="15" border="0"/><br/>

<img src="/i/tournament/tco04/right_header.gif" alt="Great Opportunities are Available from our Sponsors" width="170" height="65" border="0"/>
<br/>

<img src="/i/clear.gif" alt="" width="10" height="10" border="0"/><br/>

<a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=microsoft"><img src="/i/tournament/tco04/microsoft_right.jpg" alt="Microsoft" width="170" height="90" border="0"/></a>
<br/>

<img src="/i/clear.gif" alt="" width="10" height="10" border="0"/><br/>

<a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=nvidia"><img src="/i/tournament/tco04/nvidia_right.jpg" alt="NVIDIA" width="170" height="80" border="0"/></a>
<br/>

<img src="/i/clear.gif" alt="" width="10" height="10" border="0"/><br/>

<a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=intel"><img src="/i/tournament/tco04/intel_right.jpg" alt="Intel Developer Services" width="170" height="80" border="0"/></a>
<br/>

<img src="/i/clear.gif" alt="" width="10" height="10" border="0"/><br/>

<a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=yahoo"><img src="/i/tournament/tco04/yahoo_right.gif" alt="Yahoo!" width="170" height="80" border="0"/></a>
<br/>

<img src="/i/clear.gif" alt="" width="10" height="10" border="0"/><br/>


<div align="center" class="bodyText"><strong><a href="/tc?module=Static&d1=calendar&d2=thisMonth">More TopCoder
    Events</a></strong></div>


<p><br/></p>

<%-- 2004 TCO ends --%>


<%-- 2005 TCCC begins --%>
<% } else if (level1.equals("tccc05")) { %>

<img src="/i/clear.gif" alt="" width="170" height="15" border="0"/><br/>

<a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=yahoo"><img src="/i/tournament/tccc05/yahoo_right.gif" alt="yahoo" border="0"/></a>
<br/>

<img src="/i/clear.gif" alt="" width="10" height="10" border="0"/><br/>

<a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=motorola"><img src="/i/tournament/tccc05/motorola_right.gif" alt="Motorola" border="0"/></a>
<br/>

<img src="/i/clear.gif" alt="" width="10" height="10" border="0"/><br/>

<a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=nvidia"><img src="/i/tournament/tccc05/nvidia_right.gif" alt="nvidia" border="0"/></a>
<br/>

<img src="/i/clear.gif" alt="" width="10" height="10" border="0"/><br/>


<div align="center" class="bodyText"><strong><a href="/tc?module=Static&d1=calendar&d2=thisMonth">More TopCoder
    Events</a></strong></div>

<p><br/></p>

<%-- 2005 TCCC ends --%>

<%-- 2005 TCO begins --%>
<% } else if (level1.equals("tco05")) { %>

<img src="/i/clear.gif" alt="" width="170" height="15" border="0"/><br/>
<a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun"><img src="/i/tournament/tco05/sun_right.gif" alt="Sun" border="0"/></a>
<br/>
<img src="/i/clear.gif" alt="" width="10" height="10" border="0"/><br/>
<a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=nsa"><img src="/i/tournament/tco05/nsa_right.gif" alt="NSA" border="0"/></a>
<br/>
<img src="/i/clear.gif" alt="" width="10" height="10" border="0"/><br/>
<a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=yahoo"><img src="/i/tournament/tco05/yahoo_right.gif" alt="Yahoo" border="0"/></a>
<br/>
<img src="/i/clear.gif" alt="" width="10" height="10" border="0"/><br/>
<a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=verisign"><img src="/i/tournament/tco05/verisign_right.gif" alt="Verisign" border="0"/></a>
<br/>
<img src="/i/clear.gif" alt="" width="10" height="10" border="0"/><br/>

<div align="center" class="bodyText"><strong><a href="/tc?module=Static&d1=calendar&d2=thisMonth">More TopCoder
    Events</a></strong></div>

<p><br/></p>

<%-- 2005 TCI ends --%>

<%-- Microsoft begins --%>
<% } else if (level1.equals("microsoft")) { %>

<img src="/i/clear.gif" alt="" width="170" height="15" border="0"/><br/>

<a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=microsoft&d4=joblisting"><img src="/i/tournament/tco04/mc_animated.gif" alt="Jobs at Microsoft" width="170" height="90" border="0"/></a>
<br/>

<img src="/i/clear.gif" alt="" width="10" height="10" border="0"/><br/>


<div align="center" class="bodyText"><strong><a href="/tc?module=Static&d1=calendar&d2=thisMonth">More TopCoder
    Events</a></strong></div>

<p><br/></p>

<%-- Microsoft ends --%>

<%-- Motorola begins --%>
<% } else if (level1.equals("motorola")) { %>

<img src="/i/clear.gif" alt="" width="170" height="15" border="0"/><br/>

<a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=motorola"><img src="/i/tournament/tccc05/motorola_right.gif" alt="Motorola" border="0"/></a>
<br/>

<img src="/i/clear.gif" alt="" width="10" height="10" border="0"/><br/>


<div align="center" class="bodyText"><strong><a href="/tc?module=Static&d1=calendar&d2=thisMonth">More TopCoder
    Events</a></strong></div>

<p><br/></p>

<%-- Motorola ends --%>

<%-- NVIDIA begins --%>
<% } else if (level1.equals("nvidia")) { %>

<img src="/i/clear.gif" alt="" width="170" height="15" border="0"/><br/>

<a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=nvidia"><img src="/i/tournament/tccc05/nvidia_right.gif" alt="NVIDIA" border="0"/></a>
<br/>

<img src="/i/clear.gif" alt="" width="10" height="10" border="0"/><br/>


<div align="center" class="bodyText"><strong><a href="/tc?module=Static&d1=calendar&d2=thisMonth">More TopCoder
    Events</a></strong></div>

<p><br/></p>

<%-- NVIDIA ends --%>

<%-- Intel begins --%>
<% } else if (level1.equals("intel")) { %>

<img src="/i/clear.gif" alt="" width="170" height="15" border="0"/><br/>

<a href="/tc?module=MatchDetails&amp;rd=5856"><img src="/i/tournament/tco04/intel_opportunities.jpg" alt="Intel Opportunities" width="170" height="80" border="0"/></a>
<br/>

<img src="/i/clear.gif" alt="" width="10" height="10" border="0"/><br/>


<div align="center" class="bodyText"><strong><a href="/tc?module=Static&d1=calendar&d2=thisMonth">More TopCoder
    Events</a></strong></div>

<p><br/></p>

<%-- Intel ends --%>

<%-- Yahoo begins --%>
<% } else if (level1.equals("yahoo")) { %>

<img src="/i/clear.gif" alt="" width="170" height="15" border="0"/><br/>

<a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=yahoo"><img src="/i/tournament/tccc05/yahoo_right.gif" alt="yahoo" border="0"/></a>
<br/>

<img src="/i/clear.gif" alt="" width="10" height="10" border="0"/><br/>


<div align="center" class="bodyText"><strong><a href="/tc?module=Static&d1=calendar&d2=thisMonth">More TopCoder
    Events</a></strong></div>

<p><br/></p>

<%-- Yahoo ends --%>

<%-- About Us begins --%>
<% } else if (level1.equals("about")) { %>


<div class="rightColContent">
    <br /><br />
</div>

<%-- About Us ends --%>

<% } else if (level1.equals("card")) { %>

<div class="cardRightTop">
    <a href="mailto:tces@topcoder.com?subject=Yes, I'm looking to hire top quality developers"><IMG src="/i/es/animated_emp_promo.gif" alt="" width="170" height="119" border="0"/></a>
</div>

<div class="cardRight">
    <a href="/i/corp/downloads/tc_demo_tces.pdf"><img src="/i/corp/promos/tc_demo_tces.gif" alt="Download TCES Demographics" width="170" height="218" border="0"></a>
</div>

<p><br/></p>

<%-- Review Board begins --%>
<% } else if (level1.equals("review_board")) { %>


<div class="rightColContent">
    <br /><br />
</div>

<%-- Review Board ends --%>

<%-- Employment Opportunities begins --%>
<% } else if (level1.equals("employmentOpps")) { %>


<div class="rightColContent">
    <br /><br />
</div>

<%-- TCHS ends --%>

<% } else if (level1.equals("tchs")) { %>

<div class="rightColContent">
    <br /><br />
</div>

<%-- Employment Opportunities ends --%>

<% } else { %>
<div class="rightColContent">
    <br /><br />
</div>

<% } %>