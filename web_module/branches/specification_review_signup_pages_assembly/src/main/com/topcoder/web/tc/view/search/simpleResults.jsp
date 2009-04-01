<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.tc.Constants" %>
<%@ page language="java" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="memberSearch" class="com.topcoder.web.tc.model.MemberSearch" scope="request"/>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<% ResultSetContainer results = memberSearch.getResults();%>

<html>

<head>

    <title>Member Search Results at TopCoder</title>

    <jsp:include page="../script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

    <script language="JavaScript"><!--
    function next() {
        document.simpleSearch.<%=DataAccessConstants.START_RANK%>.value =<%=results.getStartRow()+Constants.SEARCH_SCROLL_SIZE%>;
        document.simpleSearch.<%=DataAccessConstants.END_RANK%>.value =<%=results.getEndRow()+Constants.SEARCH_SCROLL_SIZE%>;
        document.simpleSearch.submit();
    }
    function previous() {
        document.simpleSearch.<%=DataAccessConstants.START_RANK%>.value =<%=results.getStartRow()-Constants.SEARCH_SCROLL_SIZE%>;
        document.simpleSearch.<%=DataAccessConstants.END_RANK%>.value =<%=results.getEndRow()-Constants.SEARCH_SCROLL_SIZE%>;
        document.simpleSearch.submit();
    }
    //--></script>

    <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
    <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<jsp:include page="../top.jsp"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

        <!-- Left Column Begins -->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="competitor_search"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Center Column Begins -->
        <td width="100%" align="center" class="bodyColumn">

            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="statistics_w"/>
                <jsp:param name="title" value="Find a Competitor"/>
            </jsp:include>

            <form name="simpleSearch" method="get" action="${sessionInfo.servletPath}#jump">
                <input type="hidden" name="module" value="SimpleSearch"/>
                <input type="hidden" name="<%=DataAccessConstants.START_RANK%>" value=""/>
                <input type="hidden" name="<%=DataAccessConstants.END_RANK%>" value=""/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>                
                <input type="hidden" name="<%=Constants.HANDLE%>" value="<c:out value="${memberSearch.handle}" escapeXml="true"/>"/>
                <jsp:include page="results.jsp"/>
            </form>

        </td>


        <!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="search"/>
            </jsp:include>
        </td>
        <!-- Right Column Ends -->

        <!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
        <!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>


