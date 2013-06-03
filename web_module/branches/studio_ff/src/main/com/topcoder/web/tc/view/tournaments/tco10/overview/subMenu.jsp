<%@ include file="../includes/taglibs.jsp" %>

<c:set var="isDescription" value="${requestScope.MENU eq 'happenings'}"/>
<c:set var="isSchedule" value="${requestScope.MENU eq 'onsite'}"/>
<c:set var="isRules" value="${requestScope.MENU eq 'rules'}"/>
<c:set var="isLeaderboard" value="${requestScope.MENU eq 'patron'}"/>
<c:set var="isSponsors" value="${requestScope.MENU eq 'sponsors'}"/>
<c:set var="isRegistrants" value="${requestScope.MENU eq 'registrants'}"/>

<c:set var="descriptionClass" value="${isDescription ? 'actived' : ''}"/>
<c:set var="scheduleClass" value="${isSchedule ? 'actived' : ''}"/>
<c:set var="rulesClass" value="${isRules ? 'actived' : ''}"/>
<c:set var="leaderboardClass" value="${isLeaderboard ? 'actived' : ''}"/>
<c:set var="finalResultsClass" value="${isSponsors ? 'actived' : ''}"/>
<c:set var="registrantsClass" value="${isRegistrants ? 'actived' : ''}"/>

<div class="subMenu">
    <ul class="secondaryNav overviewNav"><!-- orange secondary navigation -->
        <li class="${descriptionClass}"><!-- first item -->
            <tco10:overviewStaticPageLink page="overview">
                <span class="left"></span>
                <span class="text">Latest Happenings</span>
                <span class="right"></span>
            </tco10:overviewStaticPageLink>
        </li>
        <li class="${scheduleClass}"><!--  item -->
            <tco10:overviewStaticPageLink styleClass="tertiaryNavBT competitionRulesBT" page="schedule">
                <span class="left"></span>
                <span class="text">Onsite at the TCO</span>
                <span class="right"></span>
            </tco10:overviewStaticPageLink>
        </li>
        <li class="${rulesClass}"><!-- second item -->
            <tco10:overviewStaticPageLink styleClass="tertiaryNavBT competitionRulesBT" page="rules">
                <span class="left"></span>
                <span class="text">TCO10 Rules</span>
                <span class="right"></span>
            </tco10:overviewStaticPageLink>
        </li>
        <li class="${leaderboardClass}"><!-- third item-->
            <tco10:overviewStaticPageLink page="patron">
                <span class="left"></span>
                <span class="text">Event Patron</span>
                <span class="right"></span>
            </tco10:overviewStaticPageLink>
        </li>
        <li class="${finalResultsClass}"><!-- four item -->
            <tco10:overviewStaticPageLink styleClass="tertiaryNavBT SponsorsBT" page="sponsor1">
                <span class="left"></span>
                <span class="text">Sponsors</span>
                <span class="right"></span>
            </tco10:overviewStaticPageLink>
        </li>
        <li class="${registrantsClass}"><!--five item -->
            <tco10:overviewStaticPageLink page="registrants">
                <span class="left"></span>
                <span class="text">Registrants</span>
                <span class="right"></span>
            </tco10:overviewStaticPageLink>
        </li>
    </ul>
    <div class="clear"></div>

    <div class="tertiaryNav">
        <c:choose>
            <c:when test="${isSchedule}">
                <c:set var="isSchedule" value="${requestScope.SUB_MENU eq 'schedule'}"/>
                <c:set var="isLeaderboard" value="${requestScope.SUB_MENU eq 'travel'}"/>
                <c:set var="scheduleClass" value="${isSchedule ? 'actived' : ''}"/>
                <c:set var="leaderboardClass" value="${isLeaderboard ? 'actived' : ''}"/>
                <ul class="competitionRules">
                    <li class="${scheduleClass}">
                        <tco10:overviewStaticPageLink page="schedule">Event Schedule</tco10:overviewStaticPageLink>
                    </li>
                    <li class="${leaderboardClass}">
                        <tco10:overviewStaticPageLink page="travelInfo">Travel Info</tco10:overviewStaticPageLink>
                    </li>
                    <li>
                        <a href="http://www.topcoder.com/wiki/display/tc/Getting+your+Visa+and+Getting+it+Early">
                            Getting Your Visa</a>
                    </li>
                </ul>
            </c:when>
            <c:when test="${isSponsors}">
                <c:set var="isSponsor1" value="${requestScope.SUB_MENU eq 'sponsor1'}"/>
                <c:set var="isSponsor2" value="${requestScope.SUB_MENU eq 'sponsor2'}"/>
                <c:set var="isSponsor3" value="${requestScope.SUB_MENU eq 'sponsor3'}"/>
                <c:set var="sponsor1Class" value="${isSponsor1 ? 'actived' : ''}"/>
                <c:set var="sponsor2Class" value="${isSponsor2 ? 'actived' : ''}"/>
                <c:set var="sponsor3Class" value="${isSponsor3 ? 'actived' : ''}"/>
                <ul class="competitionRules">
                    <li class="${sponsor1Class}">
                        <tco10:overviewStaticPageLink page="sponsor1">Yandex</tco10:overviewStaticPageLink>
                    </li>
                    <li class="${sponsor2Class}">
                        <tco10:overviewStaticPageLink page="sponsor2">Facebook</tco10:overviewStaticPageLink>
                    </li>
                    <li class="${sponsor3Class}">
                        <tco10:overviewStaticPageLink page="sponsor3">PayPal X Developer Network</tco10:overviewStaticPageLink>
                    </li>
                </ul>
            </c:when>
            <c:otherwise>
                <div class="clear"></div>
            </c:otherwise>
        </c:choose>
    </div>
    <!--End .tertiaryNav-->
    <div class="clear"></div>
</div><!--End .subMenu-->
