<%@ page language="java" errorPage="/errorPage.jsp" import="com.topcoder.web.stat.bean.*" %>

<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>

<template:insert template='quickStatTemplate.jsp'>
  <template:put name='left' content="left.jsp"/>
  <template:put name='startDesc' direct="true">
Top 25 Overall</p><p CLASS="statText">
  This chart ranks the top-25 in Submission Accuracy. Submission Accuracy is measured by dividing the number of correct submissions by the number of total submissions by a member. 
  </template:put>
  <template:put name='qsList' content='qsList.jsp'/>
  <template:put name='midDesc' direct="true">
	Note: Based on a minimum of 50 submissions
  </template:put>
  <template:put name='endDesc' direct="true">
  The following data is available to both members and non-members.
  Members are given a deeper view of statistics as well as the ability
  to review individual member history, submissions, and of course,
  statistics. Login now if you are a member, or <A HREF="#" CLASS="statText">Register today</A>!
  </template:put>
  
  <template:put name='statContent' content='subAccuracy.jsp'/>
</template:insert>
