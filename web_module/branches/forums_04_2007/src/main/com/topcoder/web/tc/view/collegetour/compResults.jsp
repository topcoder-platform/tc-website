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

<jsp:include page="topMenu.jsp">
    <jsp:param name="cteid" value="<%=request.getAttribute(Constants.COLLEGE_TOUR_EVENT_ID)%>"/>
    <jsp:param name="active" value="results"/>
    <jsp:param name="forumID" value="<%= request.getAttribute(Constants.FORUM_ID) %>"/>    
</jsp:include>

<% String ct=request.getParameter("ct"); 
  String context="design"; %>
<div align="center">
<table cellpadding="0" cellspacing="0" border="0" class="bodyText">
<tr>
<td align="center" style="padding-right:10px;border-right: 1px solid #999999;">
<span class="subtitle">Design</span><br>
<% if ("300".equals(ct)) { %>Week 1 | <% } else {  %>
    <A href="/tc?module=CollegeTourCompResults&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42&amp;ct=300" class="bcLink">Week 1</A>
| <% }
   if ("301".equals(ct)) { %>Week 2 | <% } else {  %>
    <A href="/tc?module=CollegeTourCompResults&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42&amp;ct=301" class="bcLink">Week 2</A>
| <% }
   if ("302".equals(ct)) { %>Week 3 | <% } else {  %>    
    <A href="/tc?module=CollegeTourCompResults&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42&amp;ct=302" class="bcLink">Week 3</A>
| <% }
   if ("306".equals(ct)) { %>Overall<% } else {  %>
    <A href="/tc?module=CollegeTourCompResults&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42&amp;ct=306" class="bcLink">Overall</A>
<% } %>

</td>

<td align="center" style="padding-left:10px;">
<span class="subtitle" class="bcLink">Development</span><br>
<% if ("303".equals(ct)) { %>Week 1 | <% context="development"; } else {  %>
    <A href="/tc?module=CollegeTourCompResults&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42&amp;ct=303" class="bcLink">Week 1</A>
| <% }
   if ("304".equals(ct)) { %>Week 2 | <% context="development"; } else {  %>
    <A href="/tc?module=CollegeTourCompResults&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42&amp;ct=304" class="bcLink">Week 2</A>
| <% }
   if ("305".equals(ct)) { %>Week 3 | <% context="development"; } else {  %>    
    <A href="/tc?module=CollegeTourCompResults&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42&amp;ct=305" class="bcLink">Week 3</A>
| <% }
   if ("307".equals(ct)) { %>Overall<% context="development"; } else {  %>
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
        <td class="headerC">Rank</td>
        <td class="header" width="60%">Handle</td>
        <td class="headerC" width="40%">Points</td>
        <td class="headerC" nowrap="nowrap">Potential Points</td>
   </tr>
        <% boolean even = false; %>
        <rsc:iterator list="<%=results%>" id="resultRow">
            <tr class="<%=even?"dark":"light"%>">            
                 <td class="valueC">
                     <rsc:item row="<%=resultRow%>" name="rank"/>
                 </td>
                <td class="value">
                    <tc-webtag:handle coderId='<%= resultRow.getLongItem("coder_id")%>' context='<%= context %>'/>
                 </td>
                 <td class="valueC">
                     <rsc:item row="<%=resultRow%>" name="points" ifNull="0"/>
                 </td>
                 <td class="valueC"> 
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

