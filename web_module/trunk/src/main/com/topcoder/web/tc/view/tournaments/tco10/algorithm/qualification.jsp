<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Algoritm Competition Qualification" area="algorithm" menu="advancers"
                 subMenu="qualification"/>

<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.web.tc.controller.request.tournament.AdvancersBase" %>

<%-- Setting up constants to use JSTL --%>
<c:set var="START_RANK" value="<%=DataAccessConstants.START_RANK%>" />
<c:set var="NUMBER_RECORDS" value="<%=DataAccessConstants.NUMBER_RECORDS%>" />
<c:set var="NUMBER_PAGE" value="<%=DataAccessConstants.NUMBER_PAGE%>" />
<c:set var="SORT_DIRECTION" value="<%=DataAccessConstants.SORT_DIRECTION%>" />
<c:set var="SORT_COLUMN" value="<%=DataAccessConstants.SORT_COLUMN%>" />
<c:set var="FULL_LIST" value="<%=AdvancersBase.FULL_LIST%>" />
<c:set var="MODULE_KEY" value="<%=Constants.MODULE_KEY%>" />
<c:set var="HANDLE" value="<%=Constants.HANDLE%>" />
<c:set var="sortColumn" value="${param[SORT_COLUMN]}"/>
<c:set var="sortDirection" value="${param[SORT_DIRECTION]}"/>

<%-- This had to be done because ResultSetContainer getters does not follow standards --%>
<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result"); %>
<c:set var="croppedDataBefore" value="<%=rsc.croppedDataBefore()%>"/>
<c:set var="croppedDataAfter" value="<%=rsc.croppedDataAfter()%>"/>
<c:set var="handleSortColumnIndex" value="<%=rsc.getColumnIndex("handle_sort")%>"/>
<c:set var="ratingColumnIndex" value="<%=rsc.getColumnIndex("rating")%>"/>
<c:set var="roundNameColumnIndex" value="<%=rsc.getColumnIndex("round_name")%>"/>
<c:set var="pointsColumnIndex" value="<%=rsc.getColumnIndex("points")%>"/>
<c:set var="rsc" value="<%=rsc%>"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../includes/htmlhead.jsp"/>
    <script type="text/javascript">
        function next() {
            var myForm = document.advancersForm;
            myForm.${START_RANK}.value= parseInt(myForm.${START_RANK}.value) +
                parseInt(myForm.${NUMBER_RECORDS}.value);
            myForm.${SORT_COLUMN}.value='${empty sortColumn ? "" : sortColumn}';
            myForm.${SORT_DIRECTION}.value='${empty sortDirection ? "" : sortDirection}';
            myForm.submit();
        }

        function previous() {
            var myForm = document.advancersForm;
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
                    <%@ include file="../includes/comingSoon.jsp" %>
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
