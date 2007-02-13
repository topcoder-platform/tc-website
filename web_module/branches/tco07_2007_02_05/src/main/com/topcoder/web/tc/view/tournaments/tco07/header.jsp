<%@ page import="java.util.Date" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<div id="tourneyLogo">
    <a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=about"><img src="/i/tournament/tco07/tco07aollogo.png" alt="2007 TopCoder Open Sponsored by AOL&#174;" /></a>
</div>
<div id="redbar">
    <div id="pageBodyN">&nbsp;</div>
    <div style="margin: 4px 10px 4px 10px;">
        <div style="float: right;">
            <tc-webtag:format object="<%=new Date()%>" format="hh:mm a z" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/>
            <tc-webtag:handle coderId='14882871'/>
            Monday, February 5, 2007
        </div>
        &nbsp;
    </div>
</div>
<img src="/i/tournament/tco07/contentN.png" alt="contentN" style="display: block;" />