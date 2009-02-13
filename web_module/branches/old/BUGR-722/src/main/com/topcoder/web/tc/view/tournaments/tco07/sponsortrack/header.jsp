<%@ page import="java.util.Date" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<div id="tourneyLogo">
    <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsortrack&amp;d4=description"><img src="/i/tournament/tco07/tco07aollogo.png" alt="2007 TopCoder Open Sponsored by AOL&#174;" /></a>
</div>
<div style="position: absolute; left: 480px; top: 30px;">
    <a href="/tc?module=TCO07ViewSponsorRegistration&eid=9"><img src="/i/tournament/tco07/sponsorRegisterNow.png" alt="Register Now for the TCO07 Sponsor Track" /></a>
</div>
<div id="redbar">
    <div id="pageBodyN">&nbsp;</div>
    <div style="margin: 4px 10px 4px 10px;">
        <div style="float: right;">
            <tc-webtag:format object="<%=new Date()%>" format="EEEE, MMMM d, yyyy" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/>
        </div>
        &nbsp;
    </div>
</div>
<img src="/i/tournament/tco07/contentN.png" alt="contentN" style="display: block;" />