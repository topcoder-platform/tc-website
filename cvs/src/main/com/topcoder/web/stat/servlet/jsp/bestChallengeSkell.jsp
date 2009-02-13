<%@ page language="java" errorPage="/errorPage.jsp" import="com.topcoder.web.stat.bean.*" %>

<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>

<template:insert template='quickStatTemplate.jsp'>
  <template:put name='left' content="left.jsp"/>
  <template:put name='startDesc' direct="true">
   This chart represents the Top-25 in Challenge Success.  Challenge Success is a percentage based on successful challenges divided by total challenges. 
  </template:put>
  <template:put name='qsList' content='qsList.jsp'/>
  <template:put name='midDesc' direct="true">
	Note: Based on a minimum of 20 challenges
  </template:put>
  <template:put name='endDesc' direct="true">
  The following data is available to both members and non-members. Members are given a deeper view of statistics as well as the ability to review individual member history, submissions, and of course, statistics.
 Login now if you are a member, or <A HREF="#" CLASS="statText">Register today</A>!
  </template:put>
  
  <template:put name='statContent' content='challengeAccuracy.jsp'/>
</template:insert>
