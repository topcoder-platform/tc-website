<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page language="java"  %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<jsp:useBean id="memberSearch" class="com.topcoder.web.tc.model.MemberSearch" scope="request" />
<% ResultSetContainer results = memberSearch.getResults();%>

<html>

<head>

<title>Member Search Results at TopCoder</title>

<jsp:include page="../script.jsp"/>

<script language="JavaScript"><!--
  function next() {
    document.searchForm.<%=DataAccessConstants.START_RANK%>.value=<%=results.getStartRow()+Constants.SEARCH_SCROLL_SIZE%>;
    document.searchForm.<%=DataAccessConstants.END_RANK%>.value=<%=results.getEndRow()+Constants.SEARCH_SCROLL_SIZE%>;
    document.searchForm.submit();
  }
  function previous() {
    document.searchForm.<%=DataAccessConstants.START_RANK%>.value=<%=results.getStartRow()-Constants.SEARCH_SCROLL_SIZE%>;
    document.searchForm.<%=DataAccessConstants.END_RANK%>.value=<%=results.getEndRow()-Constants.SEARCH_SCROLL_SIZE%>;
    document.searchForm.submit();
  }
//--></script>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<jsp:include page="../top.jsp" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="search"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="50%"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
    <!-- Gutter Ends -->

<!-- Center Column Begins -->
 <td class="bodyText"><img src="/i/clear.gif" width="510" height="10"border="0"><br>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="statisticsw"/>
           <jsp:param name="image1" value="white"/>
           <jsp:param name="title" value="Member Search Results"/>
         </jsp:include>

                      <form name="searchForm" method="get">
                          <jsp:include page="searchForm.jsp"/>
                          <br/>
                          <jsp:include page="results.jsp"/>
                      </form>
        </td>


<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="50%"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

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

<jsp:include page="../foot.jsp"/>

</body>

</html>


