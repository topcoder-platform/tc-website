<%--
  - Author: isv
  - Version: 1.0
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the leaderboard for Marathon track. 
--%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="../includes/taglibs.jsp" %>
<%@ include file="../includes/rounds.jsp" %>

<tco10:pageSetup title="TCO 10 : Marathon Competition Leaderboard" area="marathon" menu="advancers"
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
<c:set var="finalsSortColumnIndex" value="<%=rsc.getColumnIndex("finals_sort")%>"/>
<c:set var="rsc" value="<%=rsc%>"/>

<c:set var="round1_id" value="${MARATHON_ONLINE_ROUND_1}"/>
<c:set var="round2_id" value="${MARATHON_ONLINE_ROUND_2}"/>
<c:set var="round3_id" value="${MARATHON_ONLINE_ROUND_3}"/>
<c:set var="finals_id" value="${MARATHON_FINAL_ROUND}"/>

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
                                Did not compete <img src="/i/tournament/tco10/not_compete_ico.png" />  
                            </p>
                        </div>

                        <form name="mainForm" action='${sessionInfo.servletPath}' method="get" id="advancersForm">
                            <tc-webtag:hiddenInput name="${MODULE_KEY}" value="MarathonAdvancers"/>
                            <tc-webtag:hiddenInput name="${SORT_COLUMN}"/>
                            <tc-webtag:hiddenInput name="${SORT_DIRECTION}"/>
                            <tc-webtag:hiddenInput name="${FULL_LIST}"/>

                            <div class="buttons_bar">
                                <div class="left">
                                    <a href="${sessionInfo.servletPath}?module=MarathonAdvancers"
                                       class="button">Reset Sorting</a>
                                    <a href="${sessionInfo.servletPath}?module=MarathonAdvancers&amp;full=false"
                                       class="button ${requestScope.full ? 'off' : ''}">Page View</a>
                                    <a href="${sessionInfo.servletPath}?module=MarathonAdvancers&amp;full=true"
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
                                    <th class="first center"><span class="left"></span>
                                        <tco10:sortColumnLink text="Seed" columnIndex="${seedColumnIndex}"/>
                                    </th>
                                    <th class="handle">
                                        <tco10:sortColumnLink text="Handle" columnIndex="${handleSortColumnIndex}"/>
                                        <tc-webtag:textInput name="${HANDLE}" size="12"
                                                             style="border: 1px solid #999999; color: #999999;"
                                                             onClick="this.style.color='#333333';"
                                                             maxlength="100"/>
                                    </th>
                                    <th class="rating center">
                                        <tco10:sortColumnLink text="Rating" columnIndex="${ratingColumnIndex}"/>
                                    </th>
                                    <th class="center"><tco10:sortColumnLink text="R1" columnIndex="${round1SortColumnIndex}"/></th>
                                    <th class="center"><tco10:sortColumnLink text="R2" columnIndex="${round2SortColumnIndex}"/></th>
                                    <th class="center"><tco10:sortColumnLink text="R3" columnIndex="${round3SortColumnIndex}"/></th>
                                    <th class="last center"><span class="right"></span>
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
                                            <tco10:roundResultStatus roundId="${finals_id}"
                                                                     roundResult="${resultRow.map['final']}"
                                                                     prevRoundResult="${resultRow.map['round3']}"
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
