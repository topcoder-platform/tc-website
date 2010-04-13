<%--
  - Author: isv
  - Version: 1.0
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the leaderboard for Mod-Dash track.
--%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.controller.request.tournament.ModDashLeaderboardBase" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Mod Dash Competition Leaderboard" area="moddash" menu="advancers"
                 subMenu="leaderboard"/>

<%-- Setting up constants to use JSTL --%>
<c:set var="sortColumn" value="${param[SORT_COLUMN]}"/>
<c:set var="sortDirection" value="${param[SORT_DIRECTION]}"/>
<c:set var="croppedDataBefore" value="${requestScope.croppedDataBefore}"/>
<c:set var="croppedDataAfter" value="${requestScope.croppedDataAfter}"/>
<c:set var="results" value="${requestScope.results}"/>

<c:set var="HANDLE_COL" value="<%=ModDashLeaderboardBase.HANDLE_COL%>" />
<c:set var="POINTS_COL" value="<%=ModDashLeaderboardBase.POINTS_COL%>" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../includes/htmlhead.jsp"/>
    <script type="text/javascript">
        function next() {
            var myForm = document.mainForm;
            myForm.${START_RANK}.value= parseInt(myForm.${START_RANK}.value) +
                parseInt(myForm.${NUMBER_RECORDS}.value);
            myForm.${SORT_COLUMN}.value='${empty sortColumn ? "" : sortColumn}';
            myForm.${SORT_DIRECTION}.value='${empty sortDirection ? "" : sortDirection}';
            myForm.submit();
        }

        function previous() {
            var myForm = document.mainForm;
            myForm.${START_RANK}.value-=parseInt(myForm.${NUMBER_RECORDS}.value);
            myForm.${SORT_COLUMN}.value='${empty sortColumn ? "" : sortColumn}';
            myForm.${SORT_DIRECTION}.value='${empty sortDirection ? "" : sortDirection}';
            myForm.submit();
        }
    </script>
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
                        <h2 class="pageTitle">Leaderboard</h2>
                        <form name="mainForm" id="advancersForm" action='${sessionInfo.servletPath}' method="get">
                            <tc-webtag:hiddenInput name="${MODULE_KEY}" value="ModDashLeaders"/>
                            <tc-webtag:hiddenInput name="${SORT_COLUMN}"/>
                            <tc-webtag:hiddenInput name="${SORT_DIRECTION}"/>
                            <tc-webtag:hiddenInput name="${FULL_LIST}"/>

                            <div class="buttons_bar">
                                <div class="left">
                                    <a href="${sessionInfo.servletPath}?module=ModDashLeaders"
                                       class="button">Reset Sorting</a>
                                    <a href="${sessionInfo.servletPath}?module=ModDashLeaders&amp;full=false"
                                       class="button ${requestScope.full ? 'off' : ''}">Page View</a>
                                    <a href="${sessionInfo.servletPath}?module=ModDashLeaders&amp;full=true"
                                       class="button ${requestScope.full ? '' : 'off'}">Full View</a>

                                </div>
                                <div class="right">
                                    <tco10:paginationLinks previousAvailable="${croppedDataBefore}"
                                                           nextAvailable="${croppedDataAfter}"/>
                                </div>
                            </div>

                        <div>
                            <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <th class="first">&nbsp;</th>
                                        <th>
                                            <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${HANDLE_COL}'/>">Handle</a>
                                        </th>
                                        <th>
                                            <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${POINTS_COL}'/>">Total Points</a>
                                        </th>
                                        <th class="last">&nbsp;</th>
                                    </tr>
                                    <c:forEach items="${results}" var="result">
                                        <tr>
                                            <td class="first">&nbsp;</td>
                                            <td class="first last alignText">${result.handle}</td>
                                            <td class="first last alignText">
                                                <a href="${sessionInfo.servletPath}?module=ModDashLeadersDetails&amp;${HANDLE}=${result.handle}">
                                                    ${result.points}
                                                 </a>
                                            </td>
                                            <td class="last">&nbsp;</td>
                                        </tr>
                                    </c:forEach>
                            </table>
                            <div class="paging">
                                <div class="show">
                                    <p>
                                        View &#160;
                                        <tc-webtag:textInput name="${NUMBER_RECORDS}" size="4" maxlength="4"/>
                                        &#160;at a time starting with &#160;
                                    </p>
                                </div>
                                <div class="gopage" style="margin-left:0px;">
                                    <tc-webtag:textInput name="${START_RANK}" size="4" maxlength="4"/>
                                    &#160;<a href="javascript:document.mainForm.submit();" class="button small">GO</a>
                                    <button style="display:none;" name="nameSubmit" value="submit" type="submit"/>
                                </div>
                                <div class="nextprev">
                                    <tco10:paginationLinks previousAvailable="${croppedDataBefore}"
                                                           nextAvailable="${croppedDataAfter}"/>
                                </div>
                            </div>
                            
                            </div>
                        </form>
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
