<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.Date" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<div id="tourneyLogo">
    <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=about"><img src="/i/tournament/tco07/tco07aollogo.png" alt="2007 TopCoder Open Sponsored by AOL&#174;"/></a>
</div>

    <%-- fri --%>
<div style="position: absolute; left: 400px; top: 30px;">
    <map name="headerLinks">
    <area shape="rect" alt="" coords="120,17, 150,77" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=algoFinals" />
    <area shape="rect" alt="" coords="153,17, 183,77" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=component&amp;d4=desSummary" />
    <area shape="rect" alt="" coords="186,17, 216,77" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=component&amp;d4=devSummary" />
    <area shape="rect" alt="" coords="219,17, 249,77" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=marathon&amp;d4=summary" />
    <area shape="rect" alt="" coords="252,17, 282,77" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=studio&amp;d4=summary" />
    <area shape="rect" alt="" coords="3,83, 112,97" href="/pdfs/tournaments/TCO07_Program_View.pdf" />
    <area shape="rect" alt="" coords="124,83, 210,97" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=movies" />
    <area shape="rect" alt="" coords="224,83, 309,97" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=photos" />
    <area shape="rect" alt="" coords="323,83, 394,97" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=blogs&amp;d4=overview" />
    </map>
    <img src="/i/tournament/tco07/headerLinksFinal.png" alt="" usemap="#headerLinks" />
</div>
    
<div id="redBar">
    <div id="pageBodyN">&nbsp;</div>
    <div style="margin: 4px 10px 4px 10px;">
        <div style="float: right;">
            <tc-webtag:format object="<%=new Date()%>" format="EEEE, MMMM d, yyyy" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/>
        </div>
        &nbsp;
    </div>
</div>

<img src="/i/tournament/tco07/contentN.png" alt="contentN" style="display: block;"/>