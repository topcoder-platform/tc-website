<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<!-- bean:define id="theName" name="projectInfo" property="projectName" / -->
<!-- FIX name -->
<% String theTitle="Component Scores"; %>

Hello, this is ComponentScores.jsp
<bean:define id="submissionId" name="pid" />
<%= submissionId %>

<template:insert template="template.jsp">
	<template:put name="title"><%=theTitle%></template:put>
    <template:put name="content" content="componentScoresContent.jsp"/>
</template:insert>

