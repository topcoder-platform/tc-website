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

    <section class="get-time" style="margin-bottom:15px">
        <fmt:setLocale value="en_US"/>
        <span class="date"><fmt:formatDate pattern="MMMM dd, yyyy" value="${now}"/></span>
        <a href="javascript:tcTime();">Get Time</a>
    </section>
    <!-- End .get-time -->

    <section class="navigation">
    <ul>
        <li><a href="http://www.topcoder.com/active-challenges/design/">Design</a></li>
        <li>
            <a href="javascript:;">Develop<i></i></a>
            <ul class="hide">
                <li><a id="conceptualization_compete" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&pt=23">Conceptualization</a></li>
                <li><a id="specification_compete" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&pt=6">Specification</a></li>
                <li><a id="architecture_compete" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&pt=7">Architecture</a></li>
                <li><a id="ui_prototype_compete" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&pt=19">UI Prototype</a></li>
                <li><a id="assembly_compete" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&pt=14">Assembly</a></li>
                <li><a id="first2finish_compete" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&pt=38">First2Finish</a></li>
                <li><a id="code_compete" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&pt=39">Code</a></li>
                <li><a id="des_compete" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewActiveContests&ph=112">Component Design</a></li>
                <li><a id="dev_compete" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewActiveContests&ph=113">Component Development</a></li>
                <li><a id="test_suites_compete" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&pt=13">Test Suites</a></li>
                <li><a id="reporting_compete" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&pt=36">Reporting</a></li>
                <li><a id="content_creation_compete" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&pt=35">Content Creation</a></li>
                <li><a id="test_scenarios_compete" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&pt=26">Test Scenarios</a></li>
                <li><a id="bug_hunt_compete" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&pt=9">Bug Hunt</a></li>
            </ul>
        </li>
        <li>
            <a href="javascript:;">Review Opportunities<i></i></a>
            <ul class="hide">
                <li>
                    <dl>
                        <dt>Conceptualization</dt>
                        <dd><a id="conceptualization_review" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewReviewAuctions&pt=23">Review Opportunities</a></dd>
                        <dd><a id="conceptualization_review_border" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ReviewBoard&pt=23">Meet the review board</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>Specification</dt>
                        <dd><a id="specification_review" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewReviewAuctions&pt=6">Review Opportunities</a></dd>
                        <dd><a id="specification_review_board" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ReviewBoard&pt=6">Meet the review board</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>Architecture</dt>
                        <dd><a id="architecture_review" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewReviewAuctions&pt=7">Review Opportunities</a></dd>
                        <dd><a id="architecture_review_board" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ReviewBoard&pt=7">Meet the review board</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>Component Design</dt>
                        <dd><a id="des_review" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewReviewAuctions&pt=1">Review Opportunities</a></dd>
                        <dd><a id="des_review_board" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ReviewBoard&pt=1 ">Meet the review board</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>Component Development</dt>
                        <dd><a id="dev_review" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewReviewAuctions&pt=2">Review Opportunities</a></dd>
                        <dd><a id="dev_review_board" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ReviewBoard&pt=2">Meet the review board</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>Assembly</dt>
                        <dd><a id="assembly_review" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewReviewAuctions&pt=14">Review Opportunities</a></dd>
                        <dd><a id="assembly_review_board" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ReviewBoard&pt=14">Meet the review board</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>First2Finish</dt>
                        <dd><a id="first2finish_review" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewReviewAuctions&pt=38">Review Opportunities</a></dd>
                        <dd><a id="first2finish_review_board" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ReviewBoard&pt=38">Meet the review board</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>Code</dt>
                        <dd><a id="code_review"href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewReviewAuctions&pt=39">Review Opportunities</a></dd>
                        <dd><a id="code_review_board" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ReviewBoard&pt=39">Meet the review board</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>Test Suites</dt>
                        <dd><a id="test_suites_review" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewReviewAuctions&pt=13">Review Opportunities</a></dd>
                        <dd><a id="test_suites_review_board" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ReviewBoard&pt=13">Meet the review board</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>Report</dt>
                        <dd><a id="reporting_review" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewReviewAuctions&pt=36">Review Opportunities</a></dd>
                        <dd><a id="reporting_review_board" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ReviewBoard&pt=36">Meet the review board</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>UI prototype</dt>
                        <dd><a id="ui_prototype_review" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewReviewAuctions&pt=19">Review Opportunities</a></dd>
                        <dd><a id="ui_prototype_review_board" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ReviewBoard&pt=19">Meet the review board</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>RIA Build</dt>
                        <dd><a id="ria_build_review" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewReviewAuctions&pt=24">Review Opportunities</a></dd>
                        <dd><a id="ria_build_review_board" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ReviewBoard&pt=24">Meet the review board</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>Content Creation</dt>
                        <dd><a id="content_creation_review" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewReviewAuctions&pt=35">Review Opportunities</a></dd>
                        <dd><a id="content_creation_review_board" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ReviewBoard&pt=35">Meet the review board</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>Test Scenarios</dt>
                        <dd><a id="test_scenarios_review"  href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewReviewAuctions&pt=26">Review Opportunities</a></dd>
                        <dd><a id="test_scenarios_review_board" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ReviewBoard&pt=26">Meet the review board</a></dd>
                    </dl>
                </li>
                <li>
                    <dl class="last-item">
                        <dt>Bug Hunt</dt>
                        <dd><a id="bug_hunt_review" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewReviewAuctions&pt=9">Review Opportunities</a></dd>
                        <dd><a id="bug_hunt_review_board" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ReviewBoard&pt=9">Meet the review board</a></dd>
                    </dl>
                </li>

            </ul>
        </li>
        <li>
            <a href="javascript:;">Algorithm (SRM)<i></i></a>
            <ul class="hide">
                <li><a href="http://www.topcoder.com/active-challenges/data/">Single Round Matches (SRM)</a></li>
                <li><a id="algo_match_archive" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=MatchList">Match Archive</a></li>
                <li><a id="algo_match_overviews" href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=round_overview">Match Overviews</a></li>
                <li><a id="algo_match_winners" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=SrmDivisionWins">Match Winners</a></li>
                <li><a id="algo_match_results" href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=last_match">Match Results</a></li>
                <li><a href="http://apps.topcoder.com/wiki/display/tc/Algorithm+Problem+Set+Analysis">Match Editorials</a></li>
                <li><a id="algo_problem_archive" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ProblemArchive">Problem Archive</a></li>
                <li><a id="algo_color_changes" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ColorChange&ratid=1">Recent Color Changes</a></li>
                <li><a href="http://apps.topcoder.com/wiki/display/tc/Algorithm+Data+Feeds">Data Feeds</a></li>
                <li><a href="javascript:arena();">Launch Arena</a></li>
            </ul>
        </li>
        <li>
            <a href="javascript:;">Marathon Match<i></i></a>
            <ul class="hide">
                <li><a id="long_compete" href="/longcontest/?module=ViewActiveContests">Challenges</a></li>
                <li><a id="long_match_archive" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/stats/?module=MatchList">Match Archive</a></li>
                <li><a id="long_match_overview" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/stats/?module=ViewOverview">Match Overview</a></li>
                <li><a id="long_match_winners" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/stats/?module=MatchWinners">Match Winners</a></li>
                <li><a id="long_editorials" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=Static&d1=match_editorials&d2=archive">Match Editorials</a></li>
                <li><a id="long_data_feeds" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=Static&d1=support&d2=dataFeed">Data Feeds</a></li>
                <li><a id="long_practice" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=ViewPractice">Practice</a></li>
                <li><a id="long_queue" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=ViewQueue">Queue Status</a></li>
            </ul>
        </li>
        <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/dr">The Digital Run</a></li>
        <li><a href="http://software.topcoder.com/review">Submit &amp; Review</a></li>
        <li>
            <a href="javascript:;">topcoder Networks<i></i></a>
            <ul class="hide">
                <li><a href="http://community.topcoder.com/ntl/">NASA Tournament Lab</a></li>
            </ul>
        </li>
        <li><a href="http://www.topcoder.com/community/events/">Events</a></li>
        <li>
            <a href="javascript:;">Statistics<i></i></a>
            <ul class="hide">
                <li>
                    <dl>
                        <dt>Top Ranked</dt>
                        <dd><a id="top_rated_algo" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=AlgoRank">Algorithm</a></dd>
                        <dd><a id="top_rated_hs" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=HSRank">High School</a></dd>
                        <dd><a id="top_rated_long" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/stats/?module=CoderRank">Marathon Match</a></dd>
                        <dd><a id="top_rated_conceptors" href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=top_conceptors">Conceptualization</a></dd>
                        <dd><a id="top_rated_specificators" href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=top_specificators">Specification</a></dd>
                        <dd><a id="top_rated_architects" href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=top_architects">Architecture</a></dd>
                        <dd><a id="top_rated_des" href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=top_designers">Design</a></dd>
                        <dd><a id="top_rated_dev" href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=top_developers">Development</a></dd>
                        <dd><a id="top_rated_assemblers" href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=top_assemblers">Assembly</a></dd>
                        <dd><a id="top_rated_testers" href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=top_testers">Test Suites</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>Record Book</dt>
                        <dd><a  id="algo_recordbook" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=statistics&d2=recordbook_home">Algorithm</a></dd>
                        <dd><a  id="comp_recordbook" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=compstats&d2=comp_recordbook_home">Component</a></dd>
                        <dd><a  id="long_recordbook" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=Static&d1=stats&d2=recordbook_home">Marathon Match</a></dd>
                    </dl>
                </li>
                <li>
                    <dl class="last-item">
                        <dt>Coder of the Month</dt>
                        <dd><a  id="algo_com" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=COMHistory&achtid=5">Algorithm</a></dd>
                        <dd><a  id="des_com" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=COMHistory&achtid=6">Design</a></dd>
                        <dd><a  id="dev_com" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=COMHistory&achtid=7">Development</a></dd>
                    </dl>
                </li>
            </ul>
        </li>
        <li>
            <a href="javascript:;">Tutorials<i></i></a>
            <ul class="hide">
                <li><a  id="algo_tutorials" href="http://help.topcoder.com/data-science/competing-in-algorithm-challenges/algorithm-tutorials/">Algorithm Tutorials</a></li>
                <li><a id="comp_tutorials" href="http://help.topcoder.com/development/competing-in-development-challenges/development-tutorials/ ">Software Tutorials</a></li>
                <li><a id="mm_tutorials" href="http://help.topcoder.com/data-science/competing-in-algorithm-challenges/marathon-match-tutorials/">Marathon Tutorials</a></li>
            </ul>
        </li>
        <li><a href="https://apps.topcoder.com/forums/" id="forums">Forums</a></li>
        <li><a href="https://<%=ApplicationServer.SERVER_NAME%>/tc?module=MyHome" id="my_topcoder">My topcoder</a></li>
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

</div>
