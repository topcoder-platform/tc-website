<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Development Competition Projects" area="development" menu="leaderboard"/>

<c:set var="TCS_SITE" value="http://${SOFTWARE_SERVER_NAME}"/>

<c:set var="contestDetails" value="${requestScope.resultMap['contest_details']}"/>
<c:set var="contestProjects" value="${requestScope.resultMap['contest_projects']}"/>
<c:set var="contestDetailsRow" value="${contestDetails[0]}"/>
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
                        <h2 class="pageTitle">Development Competition Leaderboard</h2>
                        <h2 class="pageTitle">
                            <a href="${sessionInfo.servletPath}?module=ContestDetails&amp;eid=3432&amp;ct=477">
                             ${contestDetailsRow.map['contest_name']}</a> - Components
                        </h2>

                        <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <th class="first"><span class="left"></span>&nbsp;</th>
                                    <th>Component</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th class="last"><span class="right"></span></th>
                                </tr>
                                <c:forEach items="${contestProjects}" var="project">
                                    <tr>
                                        <td class="first">&nbsp;</td>
                                        <td class="first last alignText">
                                            <c:choose>
                                                <c:when test="${project.map['viewable'] == 1}">
                                                    <a href="${TCS_SITE}/catalog/c_component.jsp?comp=${project.map['component_id']}">
                                                        ${project.map['component_name']}
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    ${project.map['component_name']}
                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${project.map['is_complete'] == 0}">
                                                *
                                                <c:set var="incompleteProjects" value="true"/>
                                            </c:if>
                                            |
                                            <a href="${sessionInfo.servletPath}?module=ProjectDetails&amp;eid=3432&amp;ct=477&amp;pj=${project.map['project_id']}">
                                                results
                                            </a>
                                            <c:if test="${project.map['is_complete'] != 0}">
                                                |
                                                <a href="/tc?module=CompContestDetails&amp;pj=${project.map['project_id']}">
                                                    contest details
                                                </a>
                                            </c:if>
                                        </td>
                                        <td class="first last alignText">
                                            <fmt:formatDate value="${project.map['start_date']}" pattern="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/>
                                        </td>
                                        <td class="first last alignText">
                                            <fmt:formatDate value="${project.map['end_date']}" pattern="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/>
                                        </td>
                                        <td class="last">&nbsp;</td>
                                    </tr>
                                </c:forEach>
                        </table>
                        <br /><br />
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
