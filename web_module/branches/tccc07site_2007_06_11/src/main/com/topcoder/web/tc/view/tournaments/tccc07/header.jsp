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
    
    <div style="margin-top:60px;">
        <jsp:include page="navH.jsp" />
    </div>
    
    <div style="position:absolute; top:475px; right:7%;">
        <tc-webtag:format object="<%=new Date()%>" format="EEEE, MMMM d, yyyy" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/>
    </div>
</div>

<!--
<div style="position:absolute; top:450px; right:50px;">
    <tc-webtag:format object="<%=new Date()%>" format="EEEE, MMMM d, yyyy" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/>
</div> -->
<%--
<div id="redbar">
    <div id="pageBodyN">&nbsp;</div>
    <div style="margin: 4px 10px 4px 10px;">
        <div style="float: right;">
            <tc-webtag:format object="<%=new Date()%>" format="EEEE, MMMM d, yyyy" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/>
        </div>
        &nbsp;
    </div>
</div>
<img src="/i/tournament/tco07/contentN.png" alt="contentN" style="display: block;"/>
----%>