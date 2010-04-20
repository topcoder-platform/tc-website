<%@ include file="../includes/taglibs.jsp" %>

<c:set var="isDescription" value="${requestScope.MENU eq 'description'}"/>
<c:set var="isSchedule" value="${requestScope.MENU eq 'schedule'}"/>
<c:set var="isRules" value="${requestScope.MENU eq 'rules'}"/>
<c:set var="isLeaderboard" value="${requestScope.MENU eq 'leaderboard'}"/>
<c:set var="isFinalResults" value="${requestScope.MENU eq 'finalResults'}"/>

<c:set var="descriptionClass" value="${isDescription ? 'actived' : ''}"/>
<c:set var="scheduleClass" value="${isSchedule ? 'actived' : ''}"/>
<c:set var="rulesClass" value="${isRules ? 'actived' : ''}"/>
<c:set var="leaderboardClass" value="${isLeaderboard ? 'actived' : ''}"/>
<c:set var="finalResultsClass" value="${isFinalResults ? 'actived' : ''}"/>

<div class="subMenu">
    <ul class="secondaryNav overviewNav"><!-- orange secondary navigation -->
        <li class="${descriptionClass}"><!-- first item -->
            <tco10:developmentStaticPageLink page="description">
                <span class="left"></span>
                <span class="text">Description</span>
                <span class="right"></span>
            </tco10:developmentStaticPageLink>
        </li>
        <li class="${scheduleClass}"><!--  item -->
            <tco10:developmentStaticPageLink styleClass="tertiaryNavBT competitionRulesBT" page="schedule">
                <span class="left"></span>
                <span class="text">Schedule</span>
                <span class="right"></span>
            </tco10:developmentStaticPageLink>
        </li>
        <li class="${rulesClass}"><!-- second item -->
            <tco10:developmentStaticPageLink styleClass="tertiaryNavBT competitionRulesBT" page="rules">
                <span class="left"></span>
                <span class="text">Rules</span>
                <span class="right"></span>
            </tco10:developmentStaticPageLink>
        </li>
        <li class="${leaderboardClass}"><!-- third item-->
            <tco10:developmentStaticPageLink page="leaderboard">
                <span class="left"></span>
                <span class="text">Leaderboard</span>
                <span class="right"></span>
            </tco10:developmentStaticPageLink>
        </li>
        <li class="${finalResultsClass}"><!-- four item -->
            <tco10:developmentStaticPageLink styleClass="tertiaryNavBT SponsorsBT" page="finalResults">
                <span class="left"></span>
                <span class="text">Final Results</span>
                <span class="right"></span>
            </tco10:developmentStaticPageLink>
        </li>
    </ul>
    <div class="clear"></div>

    <div class="tertiaryNav">
        <div class="clear"></div>
    </div>
    <!--End .tertiaryNav-->
    <div class="clear"></div>
</div><!--End .subMenu-->
