<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<review:checkLogon />

<bean:define id="theName" name="projectInfo" property="projectName" />
<% String theTitle=theName+" Screening Success"; %>

<template:insert template="template.jsp">
	<template:put name="title"><%=theTitle%></template:put>
    <template:put name="content" content="screeningSuccessContent.jsp"/>
</template:insert>

