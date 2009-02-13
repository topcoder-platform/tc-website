<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.common.BaseProcessor" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="processorDefaultsKey" value="<%=BaseProcessor.DEFAULTS_KEY%>"/>
<c:set var="memberProfileKey" value="<%=Constants.MEMBER_PROFILE%>"/>
<c:set var="processorDefaults" value="${requestScope[processorDefaultsKey]}"/>
<c:set var="profile" value="${processorDefaults[memberProfileKey]}"/>
<c:set var="stats" value="${profile.statistics}"/>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio_profile"/>
    </jsp:include>
    <script type="text/javascript">
        var currentTab = -1;

        var typeIds = new Array();
        <c:forEach items="${stats}" var="stat" varStatus="index">
        typeIds[${index.index}] = ${stat.value.contestType.id};
        </c:forEach>

        var statistics = new Object();
        <c:forEach items="${stats}" var="stat" varStatus="index">
        statistics.s${stat.value.contestType.id} = new Object();
        statistics.s${stat.value.contestType.id}.stat1 = ${stat.value.contestsRegistered};
        statistics.s${stat.value.contestType.id}.stat2 = ${stat.value.numberOfSubmissions};
        statistics.s${stat.value.contestType.id}.stat3 = ${stat.value.submissionPercentage};
        statistics.s${stat.value.contestType.id}.stat4 = ${stat.value.submissionPassedScreening};
        statistics.s${stat.value.contestType.id}.stat5 = ${stat.value.passedScreeningPercentage};
        statistics.s${stat.value.contestType.id}.stat6 = ${stat.value.numberOfWins};
        statistics.s${stat.value.contestType.id}.stat7 = ${stat.value.winPercentage};
        </c:forEach>

        function selectType(index) {
            if (index < typeIds.length) {
                var typeId = typeIds[index];
                updateStat(typeId, 1, '');
                updateStat(typeId, 2, '');
                updateStat(typeId, 3, '%');
                updateStat(typeId, 4, '');
                updateStat(typeId, 5, '%');
                updateStat(typeId, 6, '');
                updateStat(typeId, 7, '%');
                if (currentTab != -1) {
                    document.getElementById('li' + currentTab).className = '';
                }
                currentTab = index;
                document.getElementById('li' + index).className = 'activeTab';
            }
        }

        function updateStat(typeId, index, appendix) {
            var stats = statistics['s' + typeId];
            var stat = document.getElementById('stat' + index);
            clearElement(stat);
            stat.appendChild(document.createTextNode('' + stats['stat' + index] + appendix));
        }

        function clearElement(element) {
            while (element.firstChild) {
                element.removeChild(element.firstChild);
            }
        }
    </script>
</head>

<body onload="selectType(0);">
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="top.jsp"/>
            <jsp:include page="topNav.jsp">
                <jsp:param name="node" value="profile"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">
                        <div class="container">
                            <table class="profileTable">
                                <!-- Member Search Form -->
                                <tr class="searchForm">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td class="searchProfile">
                                        <form action="/" method="GET"
                                              name="SearchProfileForm" id="SearchProfileForm">
                                            <input type="hidden" name="module" value="ViewMemberProfile"/>
                                            Member Search&nbsp;
                                            <input type="text" name="<%=Constants.HANDLE%>" value="Handle:"
                                                   onblur="if(this.value=='')this.value='Handle:';"
                                                   onfocus="if(this.value=='Handle:')this.value='';"/>
                                            <a href="#" onclick="document.SearchProfileForm.submit();return false;">Go</a>
                                        </form>
                                    </td>
                                </tr>
                                <!-- Basic member profile area-->
                                <tr class="memberProfileBasic">
                                    <td class="memberProfile"></td>
                                    <td class="handle" colspan="2">
                                        <c:if test="${profile ne null}">
                                            ${profile.handle}
                                        </c:if>
                                        <c:if test="${profile eq null}">
                                            <span class="memberNotFound">Member not found</span>
                                        </c:if>
                                    </td>
                                </tr>
                                <c:if test="${profile ne null}">
                                <tr class="memberProfileDetails">
                                    <td class="quote">
                                        <c:if test="${not empty profile.quote}">
                                            <p>&quot;${profile.quote}&quot;</p>
                                        </c:if>
                                    </td>
                                    <td class="memberPhoto">
                                        <div class="img-shadow"><img src="${profile.imageUrl}" alt="" width="126" height="140"/></div>
                                    </td>
                                    <td class="memberData">
                                        <table>
                                            <tr class="statsRow">
                                                <td>
                                                    <span class="statsHeader">MEMBER SINCE:</span>
                                                    <span class="statsValue">
                                                        <fmt:formatDate value="${profile.memberSince}" pattern="yyyy"/>
                                                    </span>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <!-- Contest type statistics area -->
                                <tr class="statTypes">
                                    <td colspan="3">
                                        <div id="memberNav">
                                            <c:if test="${not empty stats}">
                                            <ul>
                                                <c:forEach items="${stats}" var="stat" varStatus="index">
                                                    <li id="li${index.index}">
                                                        <a href="#" onclick="selectType(${index.index});return false;">${stat.value.contestType.description}</a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                            </c:if>
                                            <c:if test="${empty stats}">
                                                <span class="notCompeted">Member has not competed in TopCoder Studio</span>
                                            </c:if>
                                        </div>
                                    </td>
                                </tr>
                                <c:if test="${not empty stats}">
                                <tr>
                                    <td class="memberProfile1"></td>
                                    <td class="stats" colspan="2">
                                        <table class="contestTypeStats">
                                            <tr class="statsRow">
                                                <td>
                                                    <span class="statsHeader">Contests Registered:</span>
                                                    <span class="statsValue" id="stat1"></span>
                                                </td>
                                            </tr>
                                            <tr class="statsRow">
                                                <td>
                                                    <span class="statsHeader">Number of Submissions:</span>
                                                    <span class="statsValue" id="stat2"></span>
                                                </td>
                                            </tr>
                                            <tr class="statsRow">
                                                <td>
                                                    <span class="statsHeader">Submission Percentage:</span>
                                                    <span class="statsValue" id="stat3"></span>
                                                </td>
                                            </tr>
                                            <tr class="statsRow">
                                                <td>
                                                    <span class="statsHeader">Submissions that Passed Screening:</span>
                                                    <span class="statsValue" id="stat4"></span>
                                                </td>
                                            </tr>
                                            <tr class="statsRow">
                                                <td>
                                                    <span class="statsHeader">Passed Screening Percentage:</span>
                                                    <span class="statsValue" id="stat5"></span>
                                                </td>
                                            </tr>
                                            <tr class="statsRow">
                                                <td>
                                                    <span class="statsHeader">Number of Wins:</span>
                                                    <span class="statsValue" id="stat6"></span>
                                                </td>
                                            </tr>
                                            <tr class="statsRowLast">
                                                <td>
                                                    <span class="statsHeader">Win Percentage:</span>
                                                    <span class="statsValue" id="stat7"></span>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                </c:if>
                                </c:if>
                            </table>
                        </div>
                    </div>
                    <div class="contentBottom"/>
                    <strong/>
                </div>
            </div>
        </div>

        <jsp:include page="foot.jsp"/>

    </div>
</body>
</html>
