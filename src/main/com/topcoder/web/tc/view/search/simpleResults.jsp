<%@ page language="java"  %>

<html>

<head>

<title>Member Search Results at TopCoder</title>

<jsp:include page="../script.jsp"/>

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
        <td class="bodyText" width="99%">
            <jsp:include page="../body_top.jsp" >
                <jsp:param name="image" value="statistics"/>
                <jsp:param name="image1" value="steelblue"/>
                <jsp:param name="title" value="Member Search Results"/>
            </jsp:include>

            <jsp:include page="results.jsp"/>

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


