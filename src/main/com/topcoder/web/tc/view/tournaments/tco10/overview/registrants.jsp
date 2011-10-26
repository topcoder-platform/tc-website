<%--
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 *
  JSP renders the list of users already registered to 2010 TCO event.
 *
 * Author isv
 * Version 1.0 (2010 TCO WebSite Release assembly v1.0)
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.*,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Registrants" area="overview" menu="registrants"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../includes/htmlhead.jsp"/>
    <script type="text/javascript">
        function next() {
            var myForm = document.registrantsForm;
            myForm.${START_RANK}.value = parseInt(myForm.${START_RANK}.value) + parseInt(myForm.${NUMBER_RECORDS}.value);
            myForm.${SORT_COLUMN}.value = '${param[SORT_COLUMN]}';
            myForm.${SORT_DIRECTION}.value = '${param[SORT_DIRECTION]}';
            myForm.submit();
        }
        function previous() {
            var myForm = document.registrantsForm;
            myForm.${START_RANK}.value -= parseInt(myForm.${NUMBER_RECORDS}.value);
            myForm.${SORT_COLUMN}.value = '${param[SORT_COLUMN]}';
            myForm.${SORT_DIRECTION}.value = '${param[SORT_DIRECTION]}';
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
                    <% ResultSetContainer rsc = (ResultSetContainer) (request.getAttribute("list"));%>
                    <c:set var="totalCount" value="${fn:length(requestScope.list)}"/>
                    <form name="registrantsForm" action='${sessionInfo.servletPath}' method="get" id="registrantsForm">
                    <tc-webtag:hiddenInput name="${MODULE_KEY}" value="Registrants"/>
                        <tc-webtag:hiddenInput name="${SORT_COLUMN}"/>
                        <tc-webtag:hiddenInput name="${SORT_DIRECTION}"/>

                        <tco10:paginationLinks previousAvailable="<%=rsc.croppedDataBefore()%>"
                                               nextAvailable="<%=rsc.croppedDataAfter()%>"/>
                        <br /><br />

                        <table cellpadding="0" cellspacing="0" class="leaderboard"><!-- Start table list -->
                            <tr>
                                <th class="first"><span class="left"></span>Registrants: ${requestScope.numRegistrants}</th>
                                <!-- table left top corner -->
                                <th class="last"><span class="right"></span>&nbsp;</th>
                                <!-- table right top corner -->
                            </tr>
                            <tr>
                                <th class="first">
                                    <a style="color:#FFFFFF;"
                                       href="/tco10?module=Registrants<tc-webtag:sort column="<%=rsc.getColumnIndex("handle_lower")%>"/>">Handle</a>
                                </th>
                                <th class="last">Search:
                                    <tc-webtag:textInput name="${HANDLE}" size="16"
                                                         style="border: 1px solid #999999; color: #999999;"
                                                         onClick="this.style.color='#333333';" maxlength="100"/>
                                </th>
                            </tr>
                            <c:set var="rcounter" value="${0}"/>
                            <rsc:iterator list='<%=rsc%>' id="resultRow">
                                <c:set var="rcounter" value="${rcounter + 1}"/>
                                <tr <c:if test="${totalCount == rcounter}">class="last"</c:if>>
                                    <td colspan="2" style="text-align: left;" <c:if test="${not ((rcounter % 2) == 0)}">class="even"</c:if>>
                                        <tc-webtag:handle coderId='<%=resultRow.getIntItem("user_id")%>'/>
                                    </td>
                                </tr>
                            </rsc:iterator>
                        </table>

                        <br/>
                        <tco10:paginationLinks previousAvailable="<%=rsc.croppedDataBefore()%>"
                                               nextAvailable="<%=rsc.croppedDataAfter()%>"/>
                        <br/><br/><br/>

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
                                &#160;<a href="javascript:document.registrantsForm.submit();" class="button small">GO</a>
                                <button style="display:none;" name="nameSubmit" value="submit" type="submit"/>
                            </div>
                        </div>
                    </form>
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
