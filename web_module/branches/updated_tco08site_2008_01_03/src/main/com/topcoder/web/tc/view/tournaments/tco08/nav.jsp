<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.topcoder.web.common.model.EventType" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%
    String tabLev1 = request.getParameter("tabLev1") == null ? "" : request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2") == null ? "" : request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3") == null ? "" : request.getParameter("tabLev3");
%>

<div id="header">

    <h1><a href="http://www.topcoder.com/tco08" title="2008 TopCoder Open"><img src="/i/tournament/tco08/logo_tco08.png" width="186" height="123" alt="2008 TopCoder Open" /></a></h1>
    
    <%--
    <ul id="switcher">
        <li id="switcher_tournament"><a href="#" class="active"><span>The Tournament</span></a></li>
        <li id="switcher_symposium"><a href="#"><span>The Software Symposium</span></a></li>
    </ul> #switcher --%>
    
    <%---- PRIMARY NAVIGATION ----%>
    <ul id="nav">
        <li id="nav_overview"><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=about" class="active">Tournament Overview</a></li>
        <li id="nav_algo"><a href="#">Algorithm Competition</a></li>
        <li id="nav_comp"><a href="#">Component Competition</a></li>
        <li id="nav_mm"><a href="#">Marathon Competition</a></li>
        <li id="nav_studio"><a href="#">Studio Competition</a></li>
    </ul><%-- #nav --%>

</div><%-- #header --%>

<div id="sidebar">

    <div id="date">
    <h3><tc-webtag:format object="<%=new Date()%>" format="EEEE, MMMM d, yyyy" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/></h3>
    </div>
    
    <ul id="sponsors">
        <li><a href="#"><img src="/i/tournament/tco08/ads.png" alt="Sponsors Name" width="168" height="58" alt="Ads" /></a></li>
        <li><a href="#"><img src="/i/tournament/tco08/ads.png" alt="Sponsors Name" width="168" height="58" alt="Ads" /></a></li>
        <li><a href="#"><img src="/i/tournament/tco08/ads.png" alt="Sponsors Name" width="168" height="58" alt="Ads" /></a></li>
        <li><a href="#"><img src="/i/tournament/tco08/ads.png" alt="Sponsors Name" width="168" height="58" alt="Ads" /></a></li>
        <li><a href="#"><img src="/i/tournament/tco08/ads.png" alt="Sponsors Name" width="168" height="58" alt="Ads" /></a></li>
        <li><a href="#"><img src="/i/tournament/tco08/ads.png" alt="Sponsors Name" width="168" height="58" alt="Ads" /></a></li>
        <li><a href="#"><img src="/i/tournament/tco08/ads.png" alt="Sponsors Name" width="168" height="58" alt="Ads" /></a></li>
        <li><a href="#"><img src="/i/tournament/tco08/ads.png" alt="Sponsors Name" width="168" height="58" alt="Ads" /></a></li>
        <li><a href="#"><img src="/i/tournament/tco08/ads.png" alt="Sponsors Name" width="168" height="58" alt="Ads" /></a></li>
        <li><a href="#"><img src="/i/tournament/tco08/ads.png" alt="Sponsors Name" width="168" height="58" alt="Ads" /></a></li>
    </ul>
        
</div>