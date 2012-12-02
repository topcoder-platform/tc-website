<%--
  - Author: unknown, TrePe
  - Version: 1.1
  - Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page shows software achievements for given user.
  -
  - Version 1.1 (TopCoder Mozilla Open Badge Integration 1.0) changes:
  -   Added option to send own badges to Mozilla Open Badge Backpack.
  -   Added column with badge pictures.
  -   Updated HTML code of this portion of webpage to be valid and not table based.
--%>
<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.resultSet.*"
%>
<%@ page import="java.util.Map"%>
<%@ page import="com.topcoder.web.common.SessionInfo"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page import="com.topcoder.web.common.BaseServlet"%>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% ResultSetContainer results = (ResultSetContainer)((Map)request.getAttribute("resultMap")).get("coder_achievements"); %>
<%
  SessionInfo sessionInfo = (SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);
  // Backpack is only visible for logged in user that displays own achievements
  boolean backpackVisible = !sessionInfo.isAnonymous() && sessionInfo.getUserId() == results.getLongItem(0, "coder_id");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
   <title>TopCoder Statistics</title>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
   <jsp:include page="baseHRef.jsp" />
<% if (backpackVisible) { %>
   <script src="http://beta.openbadges.org/issuer.js" type="text/javascript"></script>
   <script type="text/javascript">
     function toggleAllBackpackItems(o) {
       var list = document.getElementsByName('backpackitem');
       for (var i in list) {
         list[i].checked = o.checked;
       }
     }
     function sendMarkedBackpackItems() {
       var list = document.getElementsByName('backpackitem');
       var assertions = [];
       for (var i = 0; i < list.length; i++) {
         if (list[i].checked) {
           assertions.push("http://<%=ApplicationServer.SERVER_NAME%>/tc?module=SimpleStats&c=coder_achievements&cr=<%=results.getLongItem(0, "coder_id")%>&earnedBadge="+list[i].value);
         }
       }
       if (assertions.length == 0) {
         alert('Select at least one badge.');
       } else {
         OpenBadges.issue(assertions, function() {});
       }
     }
   </script>
<% } %>
 </head>
 <body>
   <jsp:include page="../top.jsp" />
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
     <tr>
       <td width="180" valign="top">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="m_competitions"/>
         </jsp:include>
       </td>
<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Coder Achievements"/>
</jsp:include>

<c:set var="isVeteran" value=""/>

    <% if (!results.isEmpty()) { %>
      <span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId='<%=results.getLongItem(0, "coder_id")%>' /></span>
      <br>
      <span class="bodySubtitle">Statistics&#160;&gt;&#160;Coder Achievements</span>

      <table cellpadding="0" cellspacing="0" border="0" class="statTable">
         <tr>
            <td class="tableTitle" colspan="<% if (backpackVisible) { %>2<%} else {%>3<%}%>">Coder Achievements</td>
            <% if (backpackVisible) { %>
            <td class="tableTitle" colspan="2" align="right"><a href="#" onclick="sendMarkedBackpackItems(); return false;">Send marked badges to Backpack</a></td>
            <% } %>
         </tr>
         <tr>
            <td CLASS="tableHeader">Date</td>
            <td CLASS="tableHeader">Description</td>
            <% if (backpackVisible) { %>
            <td CLASS="tableHeader"><label><input type="checkbox" id="toggleAllBadges" onchange="toggleAllBackpackItems(this)" /> Toggle all</label></td>
            <% } %>
         </tr>
         <rsc:iterator list="<%=results%>" id="resultRow">
             <c:set var="aid" value="<%=resultRow.getIntItem("id")%>"/>
             <c:if test="${aid == 128}">
                <c:set var="isVeteran" value="veteran"/>
             </c:if>
         </rsc:iterator>
      <%boolean even = true;%>
      <rsc:iterator list="<%=results%>" id="resultRow">
         <tr>
            <td class="<%=even?"statLt":"statDk"%>" nowrap="nowrap"><rsc:item name="achievement_date" row="<%=resultRow%>" format="MM.dd.yyyy"/></td>
            <td class="<%=even?"statLt":"statDk"%>" nowrap="nowrap">
            	<% if (resultRow.getIntItem("id") == -1) { %>
            		<rsc:item name="description" row="<%=resultRow%>"/>
            	<%}else{%>
                	<div class="badgeCon">                     
					<span class="smallBadge <%=isVeteran%>SmallBadge smallBadge<rsc:item name="id" row="<%=resultRow%>"/>"></span><rsc:item name="description" row="<%=resultRow%>"/>
				  
				<%}%>
            </td>
            <% if (backpackVisible) { %>
            <td class="<%=even?"statLt":"statDk"%>">
               <label><input type="checkbox" name="backpackitem" onchange="if (!this.checked) document.getElementById('toggleAllBadges').checked=false" value="<rsc:item name="id" row="<%=resultRow%>"/>" /> Send to Backpack</label>
            </td>
            <% } %>
         </tr>
      <%even=!even;%>
      </rsc:iterator>

      </table>
    <% } %>

       <!-- END BODY -->

       </td>
       <td width="180" valign="top">
         <jsp:include page="../public_right.jsp" >
             <jsp:param name="level1" value="profile"/>
         </jsp:include>
       </td>
       <!-- Gutter -->
       <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" alt=""/></td>
       <!-- Gutter Ends -->
     </tr>
   </table>
   <jsp:include page="../foot.jsp" />
 </body>
</html>
