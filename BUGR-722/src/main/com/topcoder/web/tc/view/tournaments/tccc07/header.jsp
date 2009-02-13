<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.Date" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<div style="margin-bottom:-60px; position:relative;">
    <div id="sponsorNtclogo">
        <div align="left" style="padding-left:30px; padding-top:10px; width:313px; height:162px;">
            <a href="/"><img src="/i/tournament/tccc07/sponsorlogo.png" alt="Sponsor Logo" /></a>
        </div>
        <div id="tclogo">
            <a href="/"><img src="/i/tournament/tccc07/topcoderlogo.png" alt="TopCoder&#174;" /></a>
        </div>
    </div>
    
    <div style="margin-top:0px;">
        <jsp:include page="nav.jsp" />
    </div>
    
    <div style="position:absolute; top:400px; right:7%;">
        <tc-webtag:format object="<%=new Date()%>" format="EEEE, MMMM d, yyyy" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/>
        <div id="sponsors">
            <jsp:include page="sponsors.jsp" />
        </div>
    </div>
</div>