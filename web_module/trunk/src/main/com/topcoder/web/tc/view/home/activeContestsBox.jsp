<%@ page import="com.topcoder.web.tc.controller.request.Home" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="dr" value="<%=Home.DR%>"/>
<c:set var="design" value="<%=Home.DESIGN%>"/>
<c:set var="dev" value="<%=Home.DEVELOPMENT%>"/>
<c:set var="assembly" value="<%=Home.ASSEMBLY%>"/>
<c:set var="bugs" value="<%=Home.BUGS%>"/>
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
                <tr>
                    <td class="value">
                        <div class="prizes">50,000 pts</div>
                        <a href="/tc?module=Static&d1=digital_run&d2=description" class="gMetal">Digital Run</a> (32)
                    </td>
                </tr>
                <tr>
                    <td class="value">
                        <div class="prizes"><fmt:formatNumber value="${activeContestsSummary[design].prizeTotal}" pattern="$###,###.00"/></div>
                        <a href="/tc?module=ViewActiveContests&ph=112" class="gMetal">Comp Design</a> (${activeContestsSummary[design].contestCount})
                    </td>
                </tr>
                <tr>
                    <td class="value">
                        <div class="prizes">$20,000</div>
                        <a href="/tc?module=ViewActiveContests&ph=113" class="gMetal">Comp Development</a> (15)
                    </td>
                </tr>
                <tr>
                    <td class="value">
                        <div class="prizes">$5,000</div>
                        <a href="/tc?module=ViewAssemblyActiveContests" class="gMetal">Assembly</a> (2)
                    </td>
                </tr>
                <tr>
                    <td class="value">
                        <div class="prizes">$1,000</div>
                        <a href="/wiki/display/tc/Active+Bug+Races" class="gMetal">Bug Races</a> (10)
                    </td>
                </tr>
                <tr>
                    <td class="value">
                        <div class="prizes">$5,000</div>
                        <a href="/tc?module=ViewArchitectureActiveContests" class="gMetal">Architecture</a> (1)
                    </td>
                </tr>
                <tr>
                    <td class="value">
                        <div class="prizes">$5,000</div>
                        <a href="/tc?module=ActiveContests&pt=13" class="gMetal">App Testing</a> (4)
                    </td>
                </tr>
                <tr>
                    <td class="value">
                        <div class="prizes">$5,000</div>
                        <a href="" class="gMetal">Studio</a> (4)
                    </td>
                </tr>
                <tr>
                    <td class="value">
                        <div class="prizes">$5,000</div>
                        <a href="/longcontest/?module=ViewActiveContests" class="gMetal">Marathon Matches</a> (1)
                    </td>
                </tr>
                <tr>
                    <td class="value">
                        <div class="prizes">May 10, 9PM</div>
                        <a href="" class="gMetal">Next Algo SRM</a>
                    </td>
                </tr>
            </tbody>
            </table>
        </div>
    </div>
</div>
<div style="margin-bottom: 20px;">
    <img src="/i/interface/rightNavBottom.png" alt="" style="display: block;" />
</div>
