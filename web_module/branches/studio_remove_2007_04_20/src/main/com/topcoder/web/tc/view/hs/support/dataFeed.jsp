<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder - Help</title>

    <jsp:include page="../../script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_main"/>
    </jsp:include>

</head>

<body>

<jsp:include page="../../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="hs_data_feeds"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyText">
<jsp:include page="../../page_title.jsp">
    <jsp:param name="image" value="hs_support_faqs"/>
    <jsp:param name="title" value="Data Feeds"/>
</jsp:include>

<h2>Data Feeds</h2>

<p>
    TopCoder provides access to some of it's data in the form of XML. Below you will find a
    listing of the available feeds. Please keep in mind that none of the feeds provide ordered data.
</p>

<p style="border-top: 1px solid #999999;"><span class="bodySubtitle">High School Rating History</span><br/>
    This feed provides data about the high school rating history for a particular competitor.
    It includes the following fields:
    <ul>
        <li>handle</li>
        <li>user id</li>
        <li>round id</li>
        <li>round name</li>
        <li>date</li>
        <li>old rating</li>
        <li>new rating</li>
        <li>volatility</li>
        <li>rank</li>
    </ul>

    http://<%=ApplicationServer.SERVER_NAME%>/tc?module=BasicData&amp;c=dd_hs_rating_history&amp;cr=USER_ID
    <br/>
    You will need to replace "USER_ID" in the query string to get data about a particular competitor.
</p>


<p><br/></p>
</td>
<!-- Center Column Ends -->

<!-- Gutter -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
<td width="170">
    <jsp:include page="../../public_right.jsp">
        <jsp:param name="level1" value="privatelabel"/>
    </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
</tr>
</table>

<jsp:include page="../../foot.jsp"/>

</body>

</html>
