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
<c:set var="appTesting" value="<%=Home.APPLICATION_TESTING%>"/>
<c:set var="studio" value="<%=Home.STUDIO%>"/>
<c:set var="mm" value="<%=Home.MM%>"/>

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
                                <a href="/tc?module=Static&d1=digital_run&d2=description" class="gMetal">Digital Run</a>
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
                                <a href="http://<%=ApplicationServer.WIKI_SERVER_NAME%>/display/tc/Active+Bug+Races" class="gMetal">Bug Races</a>
                                (${activeContestsSummary[bugs].contestCount})
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${activeContestsSummary[arch].contestCount>0}">

                        <tr>
                            <td class="value">
                                <div class="prizes"><fmt:formatNumber value="${activeContestsSummary[arch].prizeTotal}" pattern="$###,###"/></div>
                                <a href="/tc?module=ViewArchitectureActiveContests" class="gMetal">Architecture</a>
                                (${activeContestsSummary[arch].contestCount})
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${activeContestsSummary[appTesting].contestCount>0}">

                        <tr>
                            <td class="value">
                                <div class="prizes"><fmt:formatNumber value="${activeContestsSummary[appTesting].prizeTotal}" pattern="$###,###"/></div>
                                <a href="/tc?module=ActiveContests&pt=13" class="gMetal">App Testing</a>
                                (${activeContestsSummary[appTesting].contestCount})
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${activeContestsSummary[studio].contestCount>0}">

                        <tr>
                            <td class="value">
                                <div class="prizes"><fmt:formatNumber value="${activeContestsSummary[studio].prizeTotal}" pattern="$###,###"/></div>
                                <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewActiveContests" class="gMetal">Studio</a> (${activeContestsSummary[studio].contestCount})
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
