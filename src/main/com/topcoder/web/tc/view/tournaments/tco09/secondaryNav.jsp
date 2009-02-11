<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP handles secondary navigation bar.
 *
 * This JSP is included by the rest of the pages in this minisite. Taking into consideration the two major
 * levels of navigation menues, it renders the corresponding secondary nav and highlights the selected option.
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="<%=request.getParameter("mainTab")%>" var="mainTab"/>
<c:set value="<%=request.getParameter("secondaryTab")%>" var="secondaryTab"/>

<div class="secNav">
    <div class="secNavLeft">
        <ul id="secNavRight">
           <c:choose>
              <c:when test="${mainTab == 'overview'}">
                    <li class="first"><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=overview" class="${secondaryTab == 'overview' ? 'on' : ''}"><span>Overview</span></a></li>
                    <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=onsite&d5=schedule" class="${secondaryTab == 'onsite' ? 'on' : ''}"><span>Onsite at the TCO</span></a></li>
                    <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=rules&d5=tco09" class="${secondaryTab == 'rules' ? 'on' : ''}"><span>Competition Rules</span></a></li>
                    <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=eventPatron" class="${secondaryTab == 'eventPatron' ? 'on' : ''}"><span>Event Patron</span></a></li>
                    <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=sponsors&d5=sponsor1" class="${secondaryTab == 'sponsors' ? 'on' : ''}"><span>Sponsors</span></a></li>
                    <li class="last"><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=registrants" class="${secondaryTab == 'registrants' ? 'on' : ''}"><span>Registrants</span></a></li>
              </c:when>
              <c:when test="${mainTab == 'online'}">
                    <li class="first"><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=architecture&d5=description" class="${secondaryTab == 'architecture' ? 'on' : ''}"><span>Architecture</span></a></li>
                    <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=assembly&d5=description" class="${secondaryTab == 'assembly' ? 'on' : ''}"><span>Assembly</span></a></li>
                    <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=design&d5=description" class="${secondaryTab == 'design' ? 'on' : ''}"><span>Component Design</span></a></li>
                    <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=development&d5=description" class="${secondaryTab == 'development' ? 'on' : ''}"><span>Component Development</span></a></li>
                    <li class="last"><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=online&d4=specification&d5=description" class="${secondaryTab == 'specification' ? 'on' : ''}"><span>Specification</span></a></li>
              </c:when>
              <c:when test="${mainTab == 'algorithm'}">
                    <li class="first"><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=algorithm&d4=description" class="${secondaryTab == 'description' ? 'on' : ''}"><span>Description</span></a></li>
                    <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=algorithm&d4=schedule" class="${secondaryTab == 'schedule' ? 'on' : ''}"><span>Schedule</span></a></li>
                    <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=algorithm&d4=advancers&d5=qualification" class="${secondaryTab == 'advancers' ? 'on' : ''}"><span>Advancers</span></a></li>
                    <li class="last"><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=algorithm&d4=summary&d5=onlineQualificationRound1" class="${secondaryTab == 'summary' ? 'on' : ''}"><span>Summary</span></a></li>
              </c:when>
              <c:when test="${mainTab == 'marathon'}">
                    <li class="first"><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=marathon&d4=description" class="${secondaryTab == 'description' ? 'on' : ''}"><span>Description</span></a></li>
                    <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=marathon&d4=schedule" class="${secondaryTab == 'schedule' ? 'on' : ''}"><span>Schedule</span></a></li>
                    <li class="last"><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=marathon&d4=advancers&d5=leaderboard" class="${secondaryTab == 'advancers' ? 'on' : ''}"><span>Advancers</span></a></li>
              </c:when>
              <c:when test="${mainTab == 'moddash'}">
                    <li class="first"><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=moddash&d4=description" class="${secondaryTab == 'description' ? 'on' : ''}"><span>Description</span></a></li>
                    <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=moddash&d4=schedule" class="${secondaryTab == 'schedule' ? 'on' : ''}"><span>Schedule</span></a></li>
                    <li class="last"><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=moddash&d4=advancers&d5=leaderboard" class="${secondaryTab == 'advancers' ? 'on' : ''}"><span>Advancers</span></a></li>
              </c:when>
              <c:when test="${mainTab == 'studio'}">
                    <li class="first"><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=studio&d4=description" class="${secondaryTab == 'description' ? 'on' : ''}"><span>Description</span></a></li>
                    <li><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=studio&d4=schedule" class="${secondaryTab == 'schedule' ? 'on' : ''}"><span>Schedule</span></a></li>
                    <li class="last"><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=studio&d4=advancers&d5=leaderboard" class="${secondaryTab == 'advancers' ? 'on' : ''}"><span>Advancers</span></a></li>
              </c:when>
            </c:choose>
        </ul>
    </div>
</div><!-- End .secNav -->
