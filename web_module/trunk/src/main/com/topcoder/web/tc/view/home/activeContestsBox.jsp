<%--
  - Author: pulky, FireIce, lmmortal, TCSASSEMBLER
  - Version: 1.5
  - Copyright (C) 2004 - 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the home page's active contest box.
  -
  - Version 1.1 (Testing Competition Split Release Assembly 1.0) changes: Updated Application Testing to Test Suites
  - and added support for new Test Scenarios competitions.
  -
  - Version 1.2 (Copilot Selection Contest Online Review and TC Site Integration Assembly 1.0) changes:
  - Added support for new Copilot Posting to display copilot posting number (no prize).
  -
  - Version 1.3 (Content Creation Contest Online Review and TC Site Integration Assembly 1.0) changes:
  - Added support for new Content Creation.
  -
  - Version 1.4 (Add Reporting Contest Type) changes:
  - Added support for new Reporting competitions.
  -
  - Version 1.5 (Release Assembly - TopCoder BugHunt Competition Integration) changes:
  - Added support for new Bug Hunt competitions.
--%>
<%@ page import="com.topcoder.web.tc.controller.request.Home" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="dr" value="<%=Home.DR%>"/>
<c:set var="design" value="<%=Home.DESIGN%>"/>
<c:set var="dev" value="<%=Home.DEVELOPMENT%>"/>
<c:set var="assembly" value="<%=Home.ASSEMBLY%>"/>
<c:set var="bugs" value="<%=Home.BUGS%>"/>
<c:set var="arch" value="<%=Home.ARCHITECTURE%>"/>
<c:set var="concept" value="<%=Home.CONCEPTUALIZATION%>"/>
<c:set var="spec" value="<%=Home.SPECIFICATION%>"/>
<c:set var="testSuites" value="<%=Home.TEST_SUITES%>"/>
<c:set var="testScenarios" value="<%=Home.TEST_SCENARIOS%>"/>
<c:set var="studio" value="<%=Home.STUDIO%>"/>
<c:set var="mm" value="<%=Home.MM%>"/>
<c:set var="uiprototype" value="<%=Home.UI_PROTOTYPE%>"/>
<c:set var="riabuild" value="<%=Home.RIA_BUILD%>"/>
<c:set var="riacomponent" value="<%=Home.RIA_COMPONENT%>"/>
<c:set var="copilotposting" value="<%=Home.COPILOT_POSTING%>"/>
<c:set var="contentcreation" value="<%=Home.CONTENT_CREATION%>"/>
<c:set var="reporting" value="<%=Home.REPORTING%>"/>
<c:set var="bughunt" value="<%=Home.BUG_HUNT%>"/>

<div>
    <img src="/i/interface/rightNavTop.png" alt="" style="display: block;"/>
</div>
<div class="rightNav">
    <div class="setWidth">
        <div class="contain">
            <table cellpadding="0" cellspacing="0" class="rightNav" style="width: 100%;">
                <tbody>
                    <tr>
                        <td class="title">Active Contests</td>
                    </tr>
                    <c:if test="${activeContestsSummary[dr].contestCount>0}">
                        <tr>
                            <td class="value">
                                <div class="prizes"><fmt:formatNumber value="${activeContestsSummary[dr].prizeTotal}" pattern="#,###,###"/> pts</div>
                                <a href="/dr" class="gMetal">Digital Run</a>
                                (${activeContestsSummary[dr].contestCount})
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${activeContestsSummary[design].contestCount>0}">
                        <tr>
                            <td class="value">
                                <div class="prizes">
                                    <fmt:formatNumber value="${activeContestsSummary[design].prizeTotal}" pattern="$###,###"/></div>
                                <a href="/tc?module=ViewActiveContests&ph=112" class="gMetal">Comp Design</a>
                                (${activeContestsSummary[design].contestCount})
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${activeContestsSummary[dev].contestCount>0}">
                        <tr>
                            <td class="value">
                                <div class="prizes">
                                    <fmt:formatNumber value="${activeContestsSummary[dev].prizeTotal}" pattern="$###,###"/></div>
                                <a href="/tc?module=ViewActiveContests&ph=113" class="gMetal">Comp Development</a>
                                (${activeContestsSummary[dev].contestCount})
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${activeContestsSummary[assembly].contestCount>0}">

                        <tr>
                            <td class="value">
                                <div class="prizes"><fmt:formatNumber value="${activeContestsSummary[assembly].prizeTotal}" pattern="$###,###"/></div>
                                <a href="/tc?module=ViewAssemblyActiveContests" class="gMetal">Assembly</a>
                                (${activeContestsSummary[assembly].contestCount})
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${activeContestsSummary[bugs].contestCount>0}">

                        <tr>
                            <td class="value">
                                <div class="prizes"><fmt:formatNumber value="${activeContestsSummary[bugs].prizeTotal}" pattern="$###,###"/></div>
                                <a href="http://<%=ApplicationServer.WIKI_SERVER_NAME%>/display/tc/Active+Bug+Race+Competitions" class="gMetal">Bug Races</a>
                                (${activeContestsSummary[bugs].contestCount})
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${activeContestsSummary[arch].contestCount>0}">

                        <tr>
                            <td class="value">
                                <div class="prizes"><fmt:formatNumber value="${activeContestsSummary[arch].prizeTotal}" pattern="$###,###"/></div>
                                <a href="/tc?module=ActiveContests&pt=7" class="gMetal">Architecture</a>
                                (${activeContestsSummary[arch].contestCount})
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${activeContestsSummary[concept].contestCount>0}">

                        <tr>
                            <td class="value">
                                <div class="prizes"><fmt:formatNumber value="${activeContestsSummary[concept].prizeTotal}" pattern="$###,###"/></div>
                                <a href="/tc?module=ActiveContests&pt=23" class="gMetal">Conceptualization</a>
                                (${activeContestsSummary[concept].contestCount})
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${activeContestsSummary[spec].contestCount>0}">

                        <tr>
                            <td class="value">
                                <div class="prizes"><fmt:formatNumber value="${activeContestsSummary[spec].prizeTotal}" pattern="$###,###"/></div>
                                <a href="/tc?module=ActiveContests&pt=6" class="gMetal">Specification</a>
                                (${activeContestsSummary[spec].contestCount})
                            </td>
                        </tr>
                    </c:if>

                    <c:if test="${activeContestsSummary[contentcreation].contestCount>0}">

                        <tr>
                            <td class="value">
                                <div class="prizes"><fmt:formatNumber value="${activeContestsSummary[contentcreation].prizeTotal}" pattern="$###,###"/></div>
                                <a href="/tc?module=ActiveContests&pt=35" class="gMetal">Content Creation</a>
                                (${activeContestsSummary[contentcreation].contestCount})
                            </td>
                        </tr>
                    </c:if>

                    <c:if test="${activeContestsSummary[reporting].contestCount>0}">

                        <tr>
                            <td class="value">
                                <div class="prizes"><fmt:formatNumber value="${activeContestsSummary[reporting].prizeTotal}" pattern="$###,###"/></div>
                                <a href="/tc?module=ActiveContests&pt=36" class="gMetal">Reporting</a>
                                (${activeContestsSummary[reporting].contestCount})
                            </td>
                        </tr>
                    </c:if>

                    <c:if test="${activeContestsSummary[testScenarios].contestCount>0}">

                        <tr>
                            <td class="value">
                                <div class="prizes"><fmt:formatNumber value="${activeContestsSummary[testScenarios].prizeTotal}" pattern="$###,###"/></div>
                                <a href="/tc?module=ActiveContests&pt=26" class="gMetal">Test Scenarios</a>
                                (${activeContestsSummary[testScenarios].contestCount})
                            </td>
                        </tr>
                    </c:if>

                    <c:if test="${activeContestsSummary[bughunt].contestCount>0}">

                        <tr>
                            <td class="value">
                                <div class="prizes"><fmt:formatNumber
                                        value="${activeContestsSummary[bughunt].prizeTotal}"
                                        pattern="$###,###"/></div>
                                <a href="/tc?module=ActiveContests&pt=9" class="gMetal">Bug Hunt</a>
                                (${activeContestsSummary[bughunt].contestCount})
                            </td>
                        </tr>
                    </c:if>

                    <c:if test="${activeContestsSummary[testSuites].contestCount>0}">

                        <tr>
                            <td class="value">
                                <div class="prizes"><fmt:formatNumber value="${activeContestsSummary[testSuites].prizeTotal}" pattern="$###,###"/></div>
                                <a href="/tc?module=ActiveContests&pt=13" class="gMetal">Test Suites</a>
                                (${activeContestsSummary[testSuites].contestCount})
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${activeContestsSummary[uiprototype].contestCount>0}">

                        <tr>
                            <td class="value">
                                <div class="prizes"><fmt:formatNumber value="${activeContestsSummary[uiprototype].prizeTotal}" pattern="$###,###"/></div>
                                <a href="/tc?module=ActiveContests&pt=19" class="gMetal">UI Prototype</a>
                                (${activeContestsSummary[uiprototype].contestCount})
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${activeContestsSummary[riabuild].contestCount>0}">

                        <tr>
                            <td class="value">
                                <div class="prizes"><fmt:formatNumber value="${activeContestsSummary[riabuild].prizeTotal}" pattern="$###,###"/></div>
                                <a href="/tc?module=ActiveContests&pt=24" class="gMetal">RIA Build</a>
                                (${activeContestsSummary[riabuild].contestCount})
                            </td>
                        </tr>
                    </c:if>
                    <%-- Hidden for now
                    <c:if test="${activeContestsSummary[riacomponent].contestCount>0}">

                        <tr>
                            <td class="value">
                                <div class="prizes"><fmt:formatNumber value="${activeContestsSummary[riacomponent].prizeTotal}" pattern="$###,###"/></div>
                                <a href="/tc?module=ActiveContests&pt=25" class="gMetal">RIA Component</a>
                                (${activeContestsSummary[riacomponent].contestCount})
                            </td>
                        </tr>
                    </c:if>
                    --%>
                    <c:if test="${activeContestsSummary[studio].contestCount>0}">

                        <tr>
                            <td class="value">
                                <div class="prizes"><fmt:formatNumber value="${activeContestsSummary[studio].prizeTotal}" pattern="$###,###"/></div>
                                <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewActiveContests" class="gMetal">Studio</a> (${activeContestsSummary[studio].contestCount})
                            </td>
                        </tr>
                    </c:if>

                    <c:if test="${activeContestsSummary[copilotposting].contestCount>0}">

                        <tr>
                            <td class="value">
                                <div class="prizes"><%-- don't have payment for copilot posting for now <fmt:formatNumber value="${activeContestsSummary[gameplan].prizeTotal}" pattern="$###,###"/>--%></div>
                                <a href="/tc?module=ActiveContests&pt=29" class="gMetal">Copilot Posting</a>
                                (${activeContestsSummary[copilotposting].contestCount})
                            </td>
                        </tr>
                    </c:if>

                    <c:if test="${activeContestsSummary[mm].contestCount>0}">

                        <tr>
                            <td class="value">
                                <div class="prizes"><%-- we don't have MM money in the db <fmt:formatNumber value="${activeContestsSummary[mm].prizeTotal}" pattern="$###,###"/>--%></div>
                                <a href="/longcontest/?module=ViewActiveContests" class="gMetal">Marathon Matches</a>
                                (${activeContestsSummary[mm].contestCount})
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${not empty Next_SRM and fn:length(Next_SRM)>0}">
                        <tr>
                            <td class="value">
                                <% ResultSetContainer nextSRM= (ResultSetContainer)request.getAttribute("Next_SRM");%>
                                <div class="prizes"><rsc:item set="<%=nextSRM%>" name="coding_start" format="MMM dd, HH:mm z"/></div>
                                <a href="/tc?module=MatchDetails&amp;rd=<rsc:item set="<%=nextSRM%>" name="round_id"/>" class="gMetal">Next SRM</a>
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div style="margin-bottom: 20px;">
    <img src="/i/interface/rightNavBottom.png" alt="" style="display: block;"/>
</div>
