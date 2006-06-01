<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<review:checkLogon />

<% String theTitle="View My Open Projects"; %>
<logic:equal name="utility" property="admin" value="true">
	<logic:equal name="utility" property="viewAllProjects" value="true">
		<% theTitle="View All Open Projects"; %>
	</logic:equal>
</logic:equal>

<template:insert template="template.jsp">
	<template:put name="title"><%=theTitle%></template:put>
    <template:put name="content" content="viewOpenProjectsContent.jsp"/>
</template:insert>

