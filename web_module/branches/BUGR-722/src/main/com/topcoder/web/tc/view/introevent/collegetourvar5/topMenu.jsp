<%@ page import="com.topcoder.web.common.model.IntroEventConfig" %>
<%@ page contentType="text/html" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="active" value="${param.active}"/>
<c:set var="showResults" value="<%=IntroEventConfig.SHOW_RESULTS_PROP_ID%>"/>

<p align="center">
    <c:if test="${not empty mainEvent.forumId}">
        <tc-webtag:forumLink forumID="${mainEvent.forumId }" message="Discuss this event"/>
        <br/>
        <br/>
    </c:if>

    <c:if test="${not empty algoEventId}">
        <b>Algorithm Competition:</b>
        <tc-webtag:ifLink useLink="${active!='algo_overview'}" text="Overview" link="/tc?module=IntroEventAlgoOverview&eid=${algoEventId}"/>
        |
        <tc-webtag:ifLink useLink="${active!='algo_info'}" text="Instructions" link="/tc?module=IntroEventAlgoInfo&eid=${algoEventId}"/>
        |
        <tc-webtag:ifLink useLink="${active!='algo_reg'}" text="Registration" link="/tc?module=IntroEventViewRegister&eid=${algoEventId}"/>
        <c:choose>
            <c:when test="${mainEvent.config[showResults].value=='true'}">
                |
                <tc-webtag:ifLink useLink="${active!='algo_results'}" text="Results" link="/tc?module=IntroEventAlgoResults&eid=${algoEventId}"/>
             </c:when>
            <c:otherwise>
                |
                <tc-webtag:ifLink useLink="${active!='algo_viewreg'}" text="Registrants" link="/tc?module=IntroEventViewRegistrants&eid=${algoEventId}"/>
            </c:otherwise>
        </c:choose>
        <br/>
        <br/>
    </c:if>

    <c:if test="${not empty compEventId}">
        <b>Component Competition:</b>
        <tc-webtag:ifLink useLink="${active!='comp_overview'}" text="Overview" link="/tc?module=IntroEventCompOverview&eid=${compEventId}"/>
        |
        <tc-webtag:ifLink useLink="${active!='comp_info'}" text="Instructions" link="/tc?module=IntroEventCompInfo&eid=${compEventId}"/>
        |
        <tc-webtag:ifLink useLink="${active!='comp_reg'}" text="Registration" link="/tc?module=IntroEventViewRegister&eid=${compEventId}"/>
        |
        <tc-webtag:ifLink useLink="${active!='comp_viewreg'}" text="Registrants" link="/tc?module=IntroEventViewRegistrants&eid=${compEventId}"/>
        |
        <tc-webtag:ifLink useLink="${active!='comp_results'}" text="Results" link="/tc?module=IntroEventCompResults&eid=${compEventId}"/>
    </c:if>

</p>
