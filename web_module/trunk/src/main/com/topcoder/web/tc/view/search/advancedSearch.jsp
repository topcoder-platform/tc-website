<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page language="java"  %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="memberSearch" class="com.topcoder.web.tc.model.MemberSearch" scope="request" />

<html>

<head>

<title>Member Search Results at TopCoder</title>

<jsp:include page="../script.jsp"/>

<script language="JavaScript"><!--
                        function submitEnter(e) {
                            var keycode;
                            if (window.event) keycode = window.event.keyCode;
                            else if (e) keycode = e.which;
                            else return true;
                            if (keycode == 13) {
                                document.searchForm.submit();
                                return false;
                            } else return true;
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
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
    <!-- Gutter Ends -->

<!-- Center Column Begins -->
 <td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="10"border="0"><br>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="statisticsw"/>  
           <jsp:param name="image1" value="white"/>  
           <jsp:param name="title" value="Advanced Member Search"/>
         </jsp:include>

            <form name="searchForm" method="get">
                <jsp:include page="searchForm.jsp"/>
            </form>
        </td>


<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="../public_right.jsp"/>
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
