<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Design Competition Results" area="design" menu="leaderboard"/>

<c:set var="TCS_SITE" value="http://${SOFTWARE_SERVER_NAME}"/>
<c:set var="contestDetails" value="${requestScope.resultMap['contest_details']}"/>
<c:set var="contestDetailsRow" value="${contestDetails[0]}"/>
<c:set var="results" value="${requestScope.results}"/>

<c:set var="userDetails" value="${requestScope.resultMap['user_details']}"/>
<c:set var="userDetailsRow" value="${userDetails[0]}"/>
<c:set var="incompleteProjects" value="false"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../includes/htmlhead.jsp"/>
</head>

<body>

<div id="wrapper" class="homepage singlePage"><!-- the outest whole website wrapper -->

    <jsp:include page="../includes/logo.jsp"/>

    <div id="content">
        <div class="contentInner">

            <jsp:include page="../includes/menu.jsp"/>

            <div id="mainbody" class="singleMainBody"><!-- below menu ,main content -->
                <span class="leftTop"></span><!-- main content left top corner -->
                <span class="rightTop"></span><!-- main content right top corner -->
                <span class="leftBottom"></span><!-- main content left bottom corner -->
                <span class="rightBottom"></span><!-- main conent right bottom corner -->

                <jsp:include page="subMenu.jsp"/>

                <div class="bigColumn">
                    <div class="text">
                        <h2 class="pageTitle">Design Competition Leaderboard</h2>
                        <h2 class="pageTitle">
                            <a href="${sessionInfo.servletPath}?module=ContestDetails&amp;eid=3432&amp;ct=476">
                               ${contestDetailsRow.map['contest_name']}</a> -
                            <tc-webtag:handle context="design" coderId="${userDetailsRow.map['coder_id']}"
                                              darkBG="true"/>
                        </h2>

                        <table class="data" width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <th class="first"><span class="left"></span>&nbsp;</th>
                                <th>Component Name</th>
                                <th>Submit Date</th>
                                <th>Points</th>
                                <th>Placed</th>
                                <th>Placement Points</th>
                                <th class="last"><span class="right"></span></th>
                            </tr>
                            <c:forEach items="${results}" var="result">
                                <tr>
                                    <td class="first">&nbsp;</td>
                                    <td class="first last alignText">
                                        <c:choose>
                                            <c:when test="${result.viewable}">
                                                <a href="${TCS_SITE}/catalog/c_component.jsp?comp=${result.compID}">
                                                        ${result.component}
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                ${result.component}
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${result.complete}">
                                                | <a href="/tc?module=CompContestDetails&amp;pj=${result.projectId}">contest
                                                details</a>
                                            </c:when>
                                            <c:otherwise>
                                                *
                                                <c:set var="incompleteProjects" value="true"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="first last alignText"><fmt:formatDate value="${result.submitTimestamp}"
                                                                                     pattern="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/></td>
                                    <td class="first last alignText">${result.score}</td>
                                    <td class="first last alignText">${result.placed}</td>
                                    <td class="first last alignText">
                                            ${result.points}
                                    </td>
                                    <td class="last">&nbsp;</td>
                                </tr>
                            </c:forEach>
                        </table>

                        <br/><br/>
                        <c:if test="${incompleteProjects}">
                            <span class="asterisk">* This project is still in progress, results subject to change</span>
                            <br /><br />
                        </c:if>
                    </div>
                </div>

                <jsp:include page="../includes/sponsors.jsp"/>

                <div class="clear"></div>
            </div>
            <!--End .mainbody-->

        </div>
        <!--End .contentInner-->
    </div>
    <!--End .content-->

    <jsp:include page="../includes/footer.jsp"/>

</div>
<!--End .wrapper-->

</body>
</html>
