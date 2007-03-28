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
    <tc-webtag:forumLink forumID="514541" message="Discuss"/> |
    <A href="/tc?module=Static&d1=collegetour&d2=belgradeCompInfo">Component Information</A> |
    Results
</p>

<% String ct=request.getParameter("ct"); 
  String context="design"; %>
<div align="center">
<table cellpadding="0" cellspacing="0" border="0" class="bodyText">
<tr>
<td align="center" style="padding-right:10px;border-right: 1px solid #999999;">
<span class="subtitle">Design</span><br>
<% if (ct.equals("300")) { %>Week 1 | <% } else {  %>
	<A href="/tc?module=CollegeTourCompResults&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42&amp;ct=300" class="bcLink">Week 1</A>
| <% }
   if (ct.equals("301")) { %>Week 2 | <% } else {  %>
    <A href="/tc?module=CollegeTourCompResults&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42&amp;ct=301" class="bcLink">Week 2</A>
| <% }
   if (ct.equals("302")) { %>Week 3 | <% } else {  %>    
    <A href="/tc?module=CollegeTourCompResults&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42&amp;ct=302" class="bcLink">Week 3</A>
| <% }
   if (ct.equals("306")) { %>Overall<% } else {  %>
    <A href="/tc?module=CollegeTourCompResults&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42&amp;ct=306" class="bcLink">Overall</A>
<% } %>

</td>

<td align="center" style="padding-left:10px;">
<span class="subtitle" class="bcLink">Development</span><br>
<% if (ct.equals("303")) { %>Week 1 | <% context="development"; } else {  %>
	<A href="/tc?module=CollegeTourCompResults&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42&amp;ct=303" class="bcLink">Week 1</A>
| <% }
   if (ct.equals("304")) { %>Week 2 | <% context="development"; } else {  %>
    <A href="/tc?module=CollegeTourCompResults&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42&amp;ct=304" class="bcLink">Week 2</A>
| <% }
   if (ct.equals("305")) { %>Week 3 | <% context="development"; } else {  %>    
    <A href="/tc?module=CollegeTourCompResults&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42&amp;ct=305" class="bcLink">Week 3</A>
| <% }
   if (ct.equals("307")) { %>Overall<% context="development"; } else {  %>
    <A href="/tc?module=CollegeTourCompResults&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42&amp;ct=307" class="bcLink">Overall</A>
<% } %>

</td>
</tr>
</table>
<br>
<br>
<% ResultSetContainer results = (ResultSetContainer) request.getAttribute("results");
   if (results != null) {
%>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
	<tr>
        <td class="header">Handle</td>
        <td class="headerR">Points</td>
        <td class="headerR">Potential Points</td>
   </tr>
        <% boolean even = false; %>
        <rsc:iterator list="<%=results%>" id="resultRow">
        	<tr class="<%=even?"dark":"light"%>">        	
        		<td class="value">
		            <tc-webtag:handle coderId='<%= resultRow.getLongItem("coder_id")%>' context='<%= context %>'/>
		         </td>
		         <td class="valueR">
		         	<rsc:item row="<%=resultRow%>" name="points" ifNull="0"/>
		         </td>
		         <td class="valueR"> 
			         <rsc:item row="<%=resultRow%>" name="potential_points" />
		         </td>		            
            </tr>
            <% even = !even; %>
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

</html

