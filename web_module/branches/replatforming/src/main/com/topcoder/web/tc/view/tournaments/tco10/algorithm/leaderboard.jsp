<%--
  - Author: isv
  - Version: 1.0
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the leaderboard for Algorithm track.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.web.tc.controller.request.tournament.AdvancersBase" %>

<%@ include file="../includes/taglibs.jsp" %>
<%@ include file="../includes/rounds.jsp" %>

<tco10:pageSetup title="TCO 10 : Algorithm Competition Leaderboard" area="algorithm" menu="advancers"
                 subMenu="leaderboard"/>

<%-- Setting up constants to use JSTL --%>
<c:set var="sortColumn" value="${param[SORT_COLUMN]}"/>
<c:set var="sortDirection" value="${param[SORT_DIRECTION]}"/>

<%-- This had to be done because ResultSetContainer getters does not follow standards --%>
<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result"); %>
<c:set var="croppedDataBefore" value="<%=rsc.croppedDataBefore()%>"/>
<c:set var="croppedDataAfter" value="<%=rsc.croppedDataAfter()%>"/>
<c:set var="seedColumnIndex" value="<%=rsc.getColumnIndex("seed")%>"/>
<c:set var="handleSortColumnIndex" value="<%=rsc.getColumnIndex("handle_sort")%>"/>
<c:set var="ratingColumnIndex" value="<%=rsc.getColumnIndex("rating")%>"/>
<c:set var="round1SortColumnIndex" value="<%=rsc.getColumnIndex("round1_sort")%>"/>
<c:set var="round2SortColumnIndex" value="<%=rsc.getColumnIndex("round2_sort")%>"/>
<c:set var="round3SortColumnIndex" value="<%=rsc.getColumnIndex("round3_sort")%>"/>
<c:set var="round4SortColumnIndex" value="<%=rsc.getColumnIndex("round4_sort")%>"/>
t<c:set var="round5SortColumnIndex" value="<%=rsc.getColumnIndex("round5_sort")%>"/>
<c:set var="semi1SortColumnIndex" value="<%=rsc.getColumnIndex("semi1_sort")%>"/>
<c:set var="semi2SortColumnIndex" value="<%=rsc.getColumnIndex("semi2_sort")%>"/>
<c:set var="wildcardSortColumnIndex" value="<%=rsc.getColumnIndex("wildcard_sort")%>"/>
<c:set var="finalsSortColumnIndex" value="<%=rsc.getColumnIndex("finals_sort")%>"/>
<c:set var="rsc" value="<%=rsc%>"/>

<c:set var="round1_id" value="${ALGO_ONLINE_ROUND_1}"/>
<c:set var="round2_id" value="${ALGO_ONLINE_ROUND_2}"/>
<c:set var="round3_id" value="${ALGO_ONLINE_ROUND_3}"/>
<c:set var="round4_id" value="${ALGO_ONLINE_ROUND_4}"/>
<c:set var="round5_id" value="${ALGO_ONLINE_ROUND_5}"/>
<c:set var="semi1_id" value="${ALGO_SEMIFINAL_ROUND_1}"/>
<c:set var="semi2_id" value="${ALGO_SEMIFINAL_ROUND_2}"/>
<c:set var="wildcard_id" value="${ALGO_WILDCARD_ROUND}"/>
<c:set var="finals_id" value="${ALGO_FINAL_ROUND}"/>

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
                        <div class="legend">
                            <p>
                                Advanced <img src="/i/tournament/tco10/advanced_ico.png" /> <br />
                                Eliminated <img src="/i/tournament/tco10/eliminated_ico.png" /> <br />
                                Did not compete<img src="/i/tournament/tco10/not_compete_ico.png" />
                            </p>
                        </div>

                        <form name="mainForm" action='${sessionInfo.servletPath}' method="get" id="advancersForm">
                            <tc-webtag:hiddenInput name="${MODULE_KEY}" value="AlgorithmAdvancers"/>
                            <tc-webtag:hiddenInput name="${SORT_COLUMN}"/>
                            <tc-webtag:hiddenInput name="${SORT_DIRECTION}"/>
                            <tc-webtag:hiddenInput name="${FULL_LIST}"/>

                            <div class="buttons_bar">
                                <div class="left">
                                    <a href="${sessionInfo.servletPath}?module=AlgorithmAdvancers"
                                       class="button">Reset Sorting</a>
                                    <a href="${sessionInfo.servletPath}?module=AlgorithmAdvancers&amp;full=false"
                                       class="button ${requestScope.full ? 'off' : ''}">Page View</a>
                                    <a href="${sessionInfo.servletPath}?module=AlgorithmAdvancers&amp;full=true"
                                       class="button ${requestScope.full ? '' : 'off'}">Full View</a>

                                </div>
                                <div class="right">
                                    <tco10:paginationLinks previousAvailable="${croppedDataBefore}"
                                                           nextAvailable="${croppedDataAfter}"/>
                                </div>
                            </div>

                            <!-- Leader board -->
                            <table cellpadding="0" cellspacing="0" class="leaderboard"><!-- Start table list -->
                                <tr>
                                    <th class="first"><span class="left"></span>
                                        <tco10:sortColumnLink text="Seed" columnIndex="${seedColumnIndex}"/>
                                    </th>
                                    <th class="handle" style="width:95px;">
                                        <tco10:sortColumnLink text="Handle" columnIndex="${handleSortColumnIndex}"/>
                                        <tc-webtag:textInput name="${HANDLE}" size="12"
                                                             style="border: 1px solid #999999; color: #999999;"
                                                             onClick="this.style.color='#333333';"
                                                             maxlength="100"/>
                                    </th>
                                    <th class="rating">
                                        <tco10:sortColumnLink text="Rating" columnIndex="${ratingColumnIndex}"/>
                                    </th>
                                    <th><tco10:sortColumnLink text="R1" columnIndex="${round1SortColumnIndex}"/></th>
                                    <th><tco10:sortColumnLink text="R2" columnIndex="${round2SortColumnIndex}"/></th>
                                    <th><tco10:sortColumnLink text="R3" columnIndex="${round3SortColumnIndex}"/></th>
                                    <th><tco10:sortColumnLink text="R4" columnIndex="${round4SortColumnIndex}"/></th>
                                    <th><tco10:sortColumnLink text="R5" columnIndex="${round5SortColumnIndex}"/></th>
                                    <th><tco10:sortColumnLink text="S1" columnIndex="${semi1SortColumnIndex}"/></th>
                                    <th><tco10:sortColumnLink text="S2" columnIndex="${semi2SortColumnIndex}"/></th>
                                    <th><tco10:sortColumnLink text="Wild" columnIndex="${wildcardSortColumnIndex}"/></th>
                                    <th class="last"><span class="right"></span>
                                        <tco10:sortColumnLink text="Final" columnIndex="${finalsSortColumnIndex}"/>
                                    </th>
                                </tr>

                                <%-- formatting this crappy to save space in the download to the client --%>
                                <c:forEach items="${rsc}" var="resultRow" varStatus="index">
                                    <tr>
                                        <td>${resultRow.map["seed"]}</td>
                                        <td class="handle">
                                            <p> <%-- <span class="high">handle</span> --%>
                                                <tc-webtag:handle coderId="${resultRow.map['coder_id']}"
                                                                  context="algorithm"/>
                                            </p>
                                        </td>
                                        <td>${resultRow.map["rating"]}</td>
                                        <td>
                                            <tco10:roundResultStatus roundId="${round1_id}"
                                                                     roundResult="${resultRow.map['round1']}"
                                                                     prevRoundResult="${null}"
                                                                     index="${index.index}"/>
                                        </td>
                                        <td>
                                            <tco10:roundResultStatus roundId="${round2_id}"
                                                                     roundResult="${resultRow.map['round2']}"
                                                                     prevRoundResult="${resultRow.map['round1']}"
                                                                     index="${index.index}"/>
                                        </td>
                                        <td>
                                            <tco10:roundResultStatus roundId="${round3_id}"
                                                                     roundResult="${resultRow.map['round3']}"
                                                                     prevRoundResult="${resultRow.map['round2']}"
                                                                     index="${index.index}"/>
                                        </td>
                                        <td>
                                            <tco10:roundResultStatus roundId="${round4_id}"
                                                                     roundResult="${resultRow.map['round4']}"
                                                                     prevRoundResult="${resultRow.map['round3']}"
                                                                     index="${index.index}"/>
                                        </td>
                                        <td>
                                            <tco10:roundResultStatus roundId="${round5_id}"
                                                                     roundResult="${resultRow.map['round5']}"
                                                                     prevRoundResult="${resultRow.map['round4']}"
                                                                     index="${index.index}"/>
                                        </td>
                                        <td>
                                            <tco10:roundResultStatus roundId="${semi1_id}"
                                                                     roundResult="${resultRow.map['semi1']}"
                                                                     prevRoundResult="${empty resultRow.map['semi2'] ? resultRow.map['round5'] : null}"
                                                                     index="${index.index}"/>
                                        </td>
                                        <td>
                                            <tco10:roundResultStatus roundId="${semi2_id}"
                                                                     roundResult="${resultRow.map['semi2']}"
                                                                     prevRoundResult="${empty resultRow.map['semi1'] ? resultRow.map['round5'] : null}"
                                                                     index="${index.index}"/>
                                        </td>
                                        <td>
                                            <tco10:roundResultStatus roundId="${wildcard_id}"
                                                                     roundResult="${resultRow.map['wildcard']}"
                                                                     prevRoundResult="${resultRow.map['semi1'] eq 'Eliminated'? resultRow.map['semi1'] : (resultRow.map['semi2'] eq 'Eliminated'? resultRow.map['semi2'] : null)}"
                                                                     index="${index.index}"/>
                                        </td>
                                        <td>
                                            <tco10:roundResultStatus roundId="${finals_id}"
                                                                     roundResult="${resultRow.map['final']}"
                                                                     prevRoundResult="${null}"
                                                                     index="${index.index}"/>
                                        </td>
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
