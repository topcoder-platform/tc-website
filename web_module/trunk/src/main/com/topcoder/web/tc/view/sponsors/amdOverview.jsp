<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder Sponsor</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="long_amd_fest"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">
           
        <div align="center"><img src="/i/sponsor/amd_logo.png" border="0px" alt="AMD Logo" /></div>
        <br /><br />
        <%--
        <div style="float: right;">
        <h3 style="border-bottom: 1px solid #999999;">Chat Session Transcripts</h3>
            <strong>
                <a style="text-decoration:none;" href="/tc?module=Static&amp;d1=sponsors&amp;d2=btChat20070721">SRM 359</a>
            </strong>
        </div>
        <br /><br />
        --%>

        <p align="center">
            Overview&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=sponsors&amp;d2=amdInstructions">How to Compete</a>&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=sponsors&amp;d2=amdRules">Rules</a>&#160;&#160;|&#160;&#160;
            <a href="/longcontest/?module=ViewActiveContests">Active Contests</a>
        </p>
        
        <span class="bigTitle">Overview</span>
        <p><a target="_blank" href="<tc-webtag:linkTracking link='http://developer.amd.com/' refer='amd_threadfest' />">AMD Developer Central</a> is pleased to host a series of online multithreading coding competitions with TopCoder!  We are excited to be part of the creative genius shown by TopCoder competitors and can't wait to see what you come up with.  And of course this wouldn't be a competition without cash prizes!  Mark your calendars for March 12th 2008 to enter in the first of the four competitions.</p>
        <p>Software development is at a key juncture with <a target="_blank" href="<tc-webtag:linkTracking link='http://developer.amd.com/tools/barcelona/Pages/default.aspx' refer='amd_threadfest' />">multi-core microprocessors</a> breaking their way into the mainstream. It is a constant challenge to stay ahead of the game, and the name of the game today is parallel programming.  <a target="_blank" href="<tc-webtag:linkTracking link='http://developer.amd.com/' refer='amd_threadfest' />">Developer.amd.com</a> is here to offer platform optimization guidance, resources and tools you need to succeed.</p>
        <p>AMD recommends that all contestants do the following:</p>
        <ol>
            <li>Register at <a target="_blank" href="<tc-webtag:linkTracking link='http://developer.amd.com/' refer='amd_threadfest' />">developer.amd.com</a></li>
            <li>Learn about multithreading best practices and platform optimizations by reading developer.amd.com materials such as <a target="_blank" href="<tc-webtag:linkTracking link='http://msevents.microsoft.com/CUI/WebCastEventDetails.aspx?culture=en-IN&EventID=1032366903&CountryCode=IN' refer='amd_threadfest' />">Multi Core is Here! But How Do You Resolve Data Bottlenecks in Native Code?</a>, <a target="_blank" href="<tc-webtag:linkTracking link='http://developer.amd.com/pages/222007121_2.aspx' refer='amd_threadfest' />">Tips For Multithreaded, Multicore Game Development</a> and <a target="_blank" href="<tc-webtag:linkTracking link='http://developer.amd.com/TechnicalArticles/Articles/Pages/default.aspx' refer='amd_threadfest' />">more</a></li>
            <li>Download and try out <a target="_blank" href="<tc-webtag:linkTracking link='http://developer.amd.com/tools/codeanalystwindows/Pages/default.aspx' refer='amd_threadfest' />">CodeAnalyst&trade; Performance Analyzer</a> and familiarize yourself with <a target="_blank" href="<tc-webtag:linkTracking link='http://developer.amd.com/tools/acml/Pages/default.aspx' refer='amd_threadfest' />">AMD Core Math Library</a> and AMD sponsored <a target="_blank" href="<tc-webtag:linkTracking link='http://developer.amd.com/tools/libraries/framewave/Pages/default.aspx' refer='amd_threadfest' />">Framewave</a> library</li>
        </ol>
        <p>&nbsp;</p>

            </div>
        </td>
<%-- Center Column Ends --%>
       
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
       
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>