<%@ page language="java" errorPage="/errorPage.jsp" import="com.topcoder.web.stat.bean.*" %>

<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>

<template:insert template='quickStatTemplate.jsp'>
  <template:put name='left' content="left.jsp"/>
  <template:put name='qsList' content="qsList.jsp"/>
<% if ("2".equals(((com.topcoder.web.stat.bean.StatRequestBean)request.getAttribute("REQUEST_BEAN")).getProperty("dn"))){ %>  
 <template:put name='startDesc' direct="true">
  This chart ranks the Top-10 in Room Wins while competing in Division-II
  </template:put>
  <template:put name='midDesc' direct="true">
See Room Wins for <A CLASS="statText" HREF="/stat?c=all_time_wins_by_div&dn=1">Division-I</A>
  </template:put>
<% } else { %>
 <template:put name='startDesc' direct="true">
  This chart ranks the Top-10 in Room Wins while competing in Division-I 
  </template:put>
  <template:put name='midDesc' direct="true">
See Room Wins for <A CLASS="statText" HREF="/stat?c=all_time_wins_by_div&dn=2">Division-II</A>
  </template:put>
<% } %>
  <template:put name='endDesc' direct="true">
  The following data is available to both members and non-members.
  Members are given a deeper view of statistics as well as the ability
  to review individual member history, submissions, and of course,
  statistics. Login now if you are a member, or <A HREF="#" CLASS="statText">Register today</A>!
  </template:put>
  
  <template:put name='statContent' content="allTimeWinsByDiv.jsp"/>
</template:insert>
