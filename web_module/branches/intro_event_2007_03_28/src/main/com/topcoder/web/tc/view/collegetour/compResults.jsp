<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
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

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="m_competitions"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">
<div class="fixedWidthBody">

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="college_tour"/>
    <jsp:param name="title" value="Overview"/>
</jsp:include>

<div align="center">
    <img src="/i/collegetour/logo_lcbelgrade.png" alt="College Logo" border="0">
</div>

<p align="center">
    <A href="/tc?module=CollegeTourOverview&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42">Overview</A> | 
    <A href="/tc?module=CollegeTourInfo&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42">Instructions</A> | 
    <a href="/tc?module=CollegeTourViewReg&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42">Registration</A> |
    <a href="/tc?module=CollegeTourRegistrants&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42">Registrants</A> |
    <tc-webtag:forumLink forumID="514541" message="Discuss"/> 
    <A href="/tc?module=Static&d1=collegetour&d2=belgradeCompInfo">Component Information</A> |
    Results
</p>


<h2 align="center">University of Belgrade<br>Component Design &amp; Development<br>Competition Series</h2>

<div align="center">
<table cellpadding="0" cellspacing="0" border="0" class="bodyText">
<tr>
<td align="left" style="padding-right:10px;border-right: 1px solid #999999;">
<span class="subtitle">Design</span><br>
<A href="/tc?module=CollegeTourCompResults&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42&amp;ct=300" class="bcLink">Week 1</A>
</td>
<td align="left" style="padding-left:10px;">
<span class="subtitle" class="bcLink">Development</span><br>
</td>
</tr>
</table>
<% ResultSetContainer results = (ResultSetContainer) request.getAttribute("results");
   if (results != null) {
%>
<table>
        <rsc:iterator list="<%=results%>" id="resultRow">
        	<tr>
        		<td>
		            <tc-webtag:handle coderId='<%= resultRow.getLongItem("coder_id")%>' context='algorithm'/>
		         </td>
		         <td>
		         	<rsc:item row="<%=resultRow%>" name="points" ifNull="0"/>
		         </td>
		         <td>
			         <rsc:item row="<%=resultRow%>" name="potential_points" />
		         </td>
		            
            </tr>
        </rsc:iterator>
</table>
	

<% } %>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
<td width="170">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="privatelabel"/>
    </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
</tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>

