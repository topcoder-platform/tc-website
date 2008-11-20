<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder College Tour</title>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">

<tr valign="top">
<%-- Left Column Begins--%>
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="m_competitions"/>
    </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody" style="padding-top:10px;">

 <%--

<jsp:include page="../../page_title.jsp">
    <jsp:param name="image" value="college_tour"/>
    <jsp:param name="title" value="Overview"/>
</jsp:include>
--%>
 

        <div align=center>
           <img src="http://www.topcoder.com/images/collegetour/logo_china_tournament.jpg" />
        </div>

<%-- college tour site subnav --%>
<jsp:include page="topMenu.jsp">
    <jsp:param name="active" value="algo_overview"/>
</jsp:include>

<%-- ends --%>


    <h2>2008 TopCoder China Tournament</h2>
	
    <p>
    The 2008 TopCoder China Tournament will commence on Sunday, December 14, 2008 at 2:30 p.m. CST.  The final round will consist of 1500 coders (300 advancers each from round 1A, 1B, 1C, 1D, and 1E).</p>
    <p><strong>The Prizes will be as follows:</strong><br>
      First Prize: iPod Nano<br>
      Second Prize: iPod Shuffle<br>
      Third Prize: MP3      </p>
    <p>Competitors who advance to round 2, will automatically be registered for the Final round.
      
      Good luck! </p>
</div>

</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
<td width="170">
    <jsp:include page="../../public_right.jsp">
        <jsp:param name="level1" value="privatelabel"/>
    </jsp:include>
</td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
</tr>
</table>

<jsp:include page="../../foot.jsp"/>

</body>

</html>
