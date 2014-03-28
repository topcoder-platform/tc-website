<%@ page language="java"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page import="com.topcoder.web.common.WebConstants"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div style="width: 185px;" class="leftNavWrapper">
    <%
        String nodeName = request.getParameter("node") == null ? "" : request.getParameter("node");
    %>
<input type="hidden" id="nodeName" value="<%= nodeName %>"/>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
<section class="navigation">
    <ul>
        <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/active-challenges/design/">Design</a></li>
        <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/active-challenges/develop/">Develop</a></li>
        <li>
            <a href="javascript:;">Data Science<i></i></a>
            <ul class="hide">
                <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=MatchList">Match Archive</a></li>
                <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=round_overview">Match Overviews</a></li>
                <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=SrmDivisionWins">Match Winners</a></li>
                <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=last_match">Match Results</a></li>
                <li><a href="http://apps.topcoder.com/wiki/display/tc/Algorithm+Problem+Set+Analysis">Match Editorials</a></li>
                <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ProblemArchive">Problem Archive</a></li>
                <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ColorChange&ratid=1">Recent Color Changes</a></li>
                <li><a href="http://apps.topcoder.com/wiki/display/tc/Algorithm+Data+Feeds">Data Feeds</a></li>
                <li><a href="javascript:arena();">Launch Arena</a></li>
            </ul>
        </li>
        <li>
            <a href="javascript:;">Marathon Match<i></i></a>
            <ul class="hide">
                <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=ViewActiveContests">Challenges</a></li>
                <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/stats/?module=MatchList">Match Archive</a></li>
                <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/stats/?module=ViewOverview">Match Overview</a></li>
                <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/stats/?module=MatchWinners">Match Winners</a></li>
                <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=Static&d1=match_editorials&d2=archive">Match Editorials</a></li>
                <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=Static&d1=support&d2=dataFeed">Data Feeds</a></li>
                <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=ViewPractice">Practice</a></li>
                <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=ViewQueue">Queue Status</a></li>
            </ul>
        </li>
        <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/dr">The Digital Run</a></li>
        <li><a href="http://software.topcoder.com/review">Submit &amp; Review</a></li>
        <li>
            <a href="javascript:;">topcoder Networks<i></i></a>
            <ul class="hide">
                <li><a href="http://community.topcoder.com/alcatel/">Alcatel Lucent</a></li>
                <li><a href="http://community.topcoder.com/amdapp/">AMD OpenCL</a></li>
                <li><a href="http://community.topcoder.com/darpacs/">DARPA CS-STEM</a></li>
                <li><a href="http://community.topcoder.com/lifetech-network/">Life Technologies</a></li>
                <li><a href="http://community.topcoder.com/ntl/">NASA Tournament Lab</a></li>
                <li><a href="http://community.topcoder.com/x/">PayPalX</a></li>
            </ul>
        </li>
        <li><a href="javascript:;">Events</a></li>
        <li>
            <a href="javascript:;">Statistics<i></i></a>
            <ul class="hide">
                <li>
                    <dl>
                        <dt>Top Ranked</dt>
                        <dd><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=AlgoRank">Algorithm</a></dd>
                        <dd><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=HSRank">High School</a></dd>
                        <dd><a href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/stats/?module=CoderRank">Marathon Match</a></dd>
                        <dd><a href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=top_conceptors">Conceptualization</a></dd>
                        <dd><a href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=top_specificators">Specification</a></dd>
                        <dd><a href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=top_architects">Architecture</a></dd>
                        <dd><a href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=top_designers">Design</a></dd>
                        <dd><a href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=top_developers">Development</a></dd>
                        <dd><a href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=top_assemblers">Assembly</a></dd>
                        <dd><a href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=top_testers">Test Suites</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>Record Book</dt>
                        <dd><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=statistics&d2=recordbook_home">Algorithm</a></dd>
                        <dd><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=compstats&d2=comp_recordbook_home">Component</a></dd>
                        <dd><a href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=Static&d1=stats&d2=recordbook_home">Marathon Match</a></dd>
                    </dl>
                </li>
                <li>
                    <dl class="last-item">
                        <dt>Coder of the Month</dt>
                        <dd><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=COMHistory&achtid=5">Algorithm</a></dd>
                        <dd><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=COMHistory&achtid=6">Design</a></dd>
                        <dd><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=COMHistory&achtid=7">Development</a></dd>
                    </dl>
                </li>
            </ul>
        </li>
        <li>
            <a href="javascript:;">Tutorials<i></i></a>
            <ul class="hide">
                <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=education&d2=overview">Overview</a></li>
                <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tutorials&d2=alg_index">Algorithm Tutorials</a></li>
                <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tutorials&d2=software_index">Software Tutorials</a></li>
                <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tutorials&d2=mm_index">Marathon Tutorials</a></li>
            </ul>
        </li>
        <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/forums/" id="forums">Forums</a></li>
        <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=MyHome" id="my_topcoder">My topcoder</a></li>
    </ul>
</section>
<!-- End .navigation -->
<section class="member-search">
    <h3>Member Search</h3>
    <div class="form">
        <form action="http://community.topcoder.com/tc" method="get" name="simpleSearchForm" class="noSpace" id="simpleSearchForm">
            <input class="noSpace" type="hidden" name="module" value="SimpleSearch" />
            <input class="noSpace" type="text" name="<%=WebConstants.HANDLE%>" value="Handle:" size="12" maxlength="15" onfocus="javascript: if (document.simpleSearchForm.<%=WebConstants.HANDLE%>.value=='Handle:') document.simpleSearchForm.<%=WebConstants.HANDLE%>.value = '';" onblur="javascript:if (document.simpleSearchForm.<%=WebConstants.HANDLE%>.value == '')document.simpleSearchForm.<%=WebConstants.HANDLE%>.value = 'Handle:';" />
            <a href="javascript:javascript:void document.simpleSearchForm.submit();" class="btn btn-search-member"><i>SEARCH</i></a>
        </form>
    </div>
</section>
<c:set var="now" value="<%=new java.util.Date()%>" />
<!-- End .member-search -->
<section class="get-time">
    <fmt:setLocale value="en_US" />
    <span class="date"><fmt:formatDate pattern="MMMM dd, yyyy" value="${now}" /></span>
    <a href="javascript:tcTime();">Get Time</a>
</section>
<!-- End .get-time -->
</div>