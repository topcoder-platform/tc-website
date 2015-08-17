<%@ include file="../includes/taglibs.jsp" %>

<c:set var="isDescription" value="${requestScope.MENU eq 'description'}"/>
<c:set var="isSchedule" value="${requestScope.MENU eq 'schedule'}"/>
<c:set var="isRules" value="${requestScope.MENU eq 'rules'}"/>
<c:set var="isAdvancers" value="${requestScope.MENU eq 'advancers'}"/>
<c:set var="isFinalResults" value="${requestScope.MENU eq 'finalResults'}"/>

<c:set var="descriptionClass" value="${isDescription ? 'actived' : ''}"/>
<c:set var="scheduleClass" value="${isSchedule ? 'actived' : ''}"/>
<c:set var="rulesClass" value="${isRules ? 'actived' : ''}"/>
<c:set var="advancersClass" value="${isAdvancers ? 'actived' : ''}"/>
<c:set var="finalResultsClass" value="${isFinalResults ? 'actived' : ''}"/>

<div class="subMenu">
    <ul class="secondaryNav overviewNav"><!-- orange secondary navigation -->
        <li class="${descriptionClass}"><!-- first item -->
            <tco10:studioStaticPageLink page="description">
                <span class="left"></span>
                <span class="text">Description</span>
                <span class="right"></span>
            </tco10:studioStaticPageLink>
        </li>
        <li class="${scheduleClass}"><!--  item -->
            <tco10:studioStaticPageLink styleClass="tertiaryNavBT competitionRulesBT" page="schedule">
                <span class="left"></span>
                <span class="text">Schedule</span>
                <span class="right"></span>
            </tco10:studioStaticPageLink>
        </li>
        <li class="${rulesClass}"><!-- second item -->
            <tco10:studioStaticPageLink styleClass="tertiaryNavBT competitionRulesBT" page="rules">
                <span class="left"></span>
                <span class="text">Rules</span>
                <span class="right"></span>
            </tco10:studioStaticPageLink>
        </li>
        <li class="${advancersClass}"><!-- third item-->
            <tco10:studioStaticPageLink page="leaderboard">
                <span class="left"></span>
                <span class="text">Advancers</span>
                <span class="right"></span>
            </tco10:studioStaticPageLink>
        </li>
        <li class="${finalResultsClass}"><!-- four item -->
            <tco10:studioStaticPageLink styleClass="tertiaryNavBT SponsorsBT" page="finalResults">
                <span class="left"></span>
                <span class="text">Final Results</span>
                <span class="right"></span>
            </tco10:studioStaticPageLink>
        </li>
    </ul>
    <div class="clear"></div>

    <div class="tertiaryNav">
        <c:choose>
            <c:when test="${isAdvancers}">
                <c:set var="isLeaderboard" value="${requestScope.SUB_MENU eq 'leaderboard'}"/>
                <c:set var="isBracket" value="${requestScope.SUB_MENU eq 'bracket'}"/>
                <c:set var="isJudges" value="${requestScope.SUB_MENU eq 'judges'}"/>
              	<c:set var="leaderboardClass" value="${isLeaderboard ? 'actived' : ''}"/>
                <c:set var="bracketClass" value="${isBracket ? 'actived' : ''}"/>
                <c:set var="judgesClass" value="${isJudges ? 'actived' : ''}"/>
          <ul class="advancers">
                    <li class="${leaderboardClass}">
                        <tco10:studioStaticPageLink page="leaderboard">Leaderboard</tco10:studioStaticPageLink>
                    </li>
                    <li class="${bracketClass}">
                        <tco10:studioStaticPageLink page="bracket">Bracket</tco10:studioStaticPageLink>
                    </li>
                    <li class="${judgesClass}">
                        <tco10:studioStaticPageLink page="judges">Guest Judges</tco10:studioStaticPageLink>
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
