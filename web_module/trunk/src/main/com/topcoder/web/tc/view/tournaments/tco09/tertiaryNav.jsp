<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 *
 * This JSP handles tertiary navigation bar.
 *
 * This JSP is included by the rest of the pages in this minisite. Taking into consideration the three
 * levels of navigation menues, it renders the corresponding tertiary nav and highlights the selected option.
 *
 * Version 1.1 (2009 TopCoder Open Site Integration 1.1) changes: Replaced links for all leaderboard pages.
 *
 * Version 1.2 (2009 TopCoder Open Site Integration 1.1.1) changes: Replaced link for Studio leaderboard page.
 *
 * Author TCSDEVELOPER
 * Version 1.2
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="<%=request.getParameter("mainTab")%>" var="mainTab"/>
<c:set value="<%=request.getParameter("secondaryTab")%>" var="secondaryTab"/>
<c:set value="<%=request.getParameter("tertiaryTab")%>" var="tertiaryTab"/>


    <div id="tertiaryNav">
        <div>
            <ul class="tertNav">
                <c:choose>
                    <c:when test="${mainTab == 'overview' && secondaryTab == 'onsite'}">
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=onsite&d5=schedule" class="${tertiaryTab == 'schedule' ? 'on' : ''}">Schedule of Onsite Events</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=onsite&d5=newInVegas" class="${tertiaryTab == 'newInVegas' ? 'on' : ''}">New In Vegas</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=onsite&d5=travelInfo" class="${tertiaryTab == 'travelInfo' ? 'on' : ''}">Travel Info</a></li>
                        <li><a href="/wiki/display/tc/Getting+your+Visa+and+Getting+it+Early" class="${tertiaryTab == 'visa' ? 'on' : ''}">Getting Your Visa</a></li>
                    </c:when>
                    <c:when test="${mainTab == 'overview' && secondaryTab == 'rules'}">
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=rules&d5=tco09" class="${tertiaryTab == 'tco09' ? 'on' : ''}">TCO 09 Rules</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=rules&d5=algorithm" class="${tertiaryTab == 'algorithm' ? 'on' : ''}">Algorithm</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=rules&d5=architecture" class="${tertiaryTab == 'architecture' ? 'on' : ''}">Architecture</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=rules&d5=assembly" class="${tertiaryTab == 'assembly' ? 'on' : ''}">Assembly</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=rules&d5=component" class="${tertiaryTab == 'component' ? 'on' : ''}">Component</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=rules&d5=marathon" class="${tertiaryTab == 'marathon' ? 'on' : ''}">Marathon</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=rules&d5=moddash" class="${tertiaryTab == 'moddash' ? 'on' : ''}">Mod Dash</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=rules&d5=specification" class="${tertiaryTab == 'specification' ? 'on' : ''}">Specification</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=rules&d5=studio" class="${tertiaryTab == 'studio' ? 'on' : ''}">Studio</a></li>
                    </c:when>
                    <c:when test="${mainTab == 'overview' && secondaryTab == 'sponsors'}">
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=sponsors&d5=sponsor1" class="${tertiaryTab == 'sponsor1' ? 'on' : ''}">IEEE USA</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=sponsors&d5=sponsor2" class="${tertiaryTab == 'sponsor2' ? 'on' : ''}">SNIA XAM Initiative</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=sponsors&d5=sponsor3" class="${tertiaryTab == 'sponsor3' ? 'on' : ''}">Facebook</a></li>
                    </c:when>
                    <c:when test="${mainTab == 'online' && secondaryTab == 'architecture'}">
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=architecture&d5=description" class="${tertiaryTab == 'description' ? 'on' : ''}">Description</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=architecture&d5=schedule" class="${tertiaryTab == 'schedule' ? 'on' : ''}">Schedule</a></li>
                        <li><a href="/tco09?module=ContestDetails&eid=3009&ct=472" class="${tertiaryTab == 'leaderboard' ? 'on' : ''}">Leaderboard</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=architecture&d5=bracket" class="${tertiaryTab == 'bracket' ? 'on' : ''}">Results</a></li>
                    </c:when>
                    <c:when test="${mainTab == 'online' && secondaryTab == 'assembly'}">
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=assembly&d5=description" class="${tertiaryTab == 'description' ? 'on' : ''}">Description</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=assembly&d5=schedule" class="${tertiaryTab == 'schedule' ? 'on' : ''}">Schedule</a></li>
                        <li><a href="/tco09?module=ContestDetails&eid=3009&ct=473" class="${tertiaryTab == 'leaderboard' ? 'on' : ''}">Leaderboard</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=assembly&d5=bracket" class="${tertiaryTab == 'bracket' ? 'on' : ''}">Results</a></li>
                    </c:when>
                    <c:when test="${mainTab == 'online' && secondaryTab == 'design'}">
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=design&d5=description" class="${tertiaryTab == 'description' ? 'on' : ''}">Description</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=design&d5=schedule" class="${tertiaryTab == 'schedule' ? 'on' : ''}">Schedule</a></li>
                        <li><a href="/tco09?module=ContestDetails&eid=3009&ct=470" class="${tertiaryTab == 'leaderboard' ? 'on' : ''}">Leaderboard</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=design&d5=bracket" class="${tertiaryTab == 'bracket' ? 'on' : ''}">Results</a></li>
                    </c:when>
                    <c:when test="${mainTab == 'online' && secondaryTab == 'development'}">
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=development&d5=description" class="${tertiaryTab == 'description' ? 'on' : ''}">Description</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=development&d5=schedule" class="${tertiaryTab == 'schedule' ? 'on' : ''}">Schedule</a></li>
                        <li><a href="/tco09?module=ContestDetails&eid=3009&ct=471" class="${tertiaryTab == 'leaderboard' ? 'on' : ''}">Leaderboard</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=development&d5=bracket" class="${tertiaryTab == 'bracket' ? 'on' : ''}">Results</a></li>
                    </c:when>
                    <c:when test="${mainTab == 'online' && secondaryTab == 'specification'}">
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=specification&d5=description" class="${tertiaryTab == 'description' ? 'on' : ''}">Description</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=specification&d5=schedule" class="${tertiaryTab == 'schedule' ? 'on' : ''}">Schedule</a></li>
                        <li><a href="/tco09?module=ContestDetails&eid=3009&ct=474" class="${tertiaryTab == 'leaderboard' ? 'on' : ''}">Leaderboard</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=specification&d5=bracket" class="${tertiaryTab == 'bracket' ? 'on' : ''}">Results</a></li>
                    </c:when>
                    <c:when test="${mainTab == 'algorithm' && secondaryTab == 'advancers'}">
                        <li><a href="/tco09?module=AlgorithmQualification" class="${tertiaryTab == 'qualification' ? 'on' : ''}">Qualification</a></li>
                        <li><a href="/tco09?module=AlgorithmAdvancers" class="${tertiaryTab == 'leaderboard' ? 'on' : ''}">Leaderboard</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=algorithm&d4=advancers&d5=bracket" class="${tertiaryTab == 'bracket' ? 'on' : ''}">Bracket</a></li>
                    </c:when>
                    <c:when test="${mainTab == 'algorithm' && secondaryTab == 'summary'}">
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=algorithm&d4=summary&d5=onsiteChampionshipRound" class="${tertiaryTab == 'onsiteChampionshipRound' ? 'on' : ''}">Onsite Championship</a></li>
                    </c:when>
                    <c:when test="${mainTab == 'marathon' && secondaryTab == 'advancers'}">
                        <li><a href="/tco09?module=MarathonAdvancers" class="${tertiaryTab == 'leaderboard' ? 'on' : ''}">Leaderboard</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=marathon&d4=advancers&d5=bracket" class="${tertiaryTab == 'bracket' ? 'on' : ''}">Bracket</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=marathon&d4=advancers&d5=summary" class="${tertiaryTab == 'summary' ? 'on' : ''}">Onsite Championship</a></li>
                    </c:when>
                    <c:when test="${mainTab == 'moddash' && secondaryTab == 'advancers'}">
                        <li><a href="/tco09?module=ModDashLeaders" class="${tertiaryTab == 'leaderboard' ? 'on' : ''}">Leaderboard</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=moddash&d4=advancers&d5=bracket" class="${tertiaryTab == 'bracket' ? 'on' : ''}">Bracket</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=moddash&d4=advancers&d5=summary" class="${tertiaryTab == 'summary' ? 'on' : ''}">Onsite Championship</a></li>
                    </c:when>
                    <c:when test="${mainTab == 'studio' && secondaryTab == 'advancers'}">
                        <li><a href="/tco09?module=StudioLeaders&eid=3009" class="${tertiaryTab == 'leaderboard' ? 'on' : ''}">Leaderboard</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=studio&d4=advancers&d5=bracket" class="${tertiaryTab == 'bracket' ? 'on' : ''}">Bracket</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=studio&d4=advancers&d5=summary" class="${tertiaryTab == 'summary' ? 'on' : ''}">Onsite Championship</a></li>
                    </c:when>
                    <c:otherwise>
                        <li>&nbsp;</li>
                    </c:otherwise>
                </c:choose>
            </ul>
      </div>
</div><!-- End #tertiaryNav -->
