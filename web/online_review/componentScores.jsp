<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<!-- bean:define id="theName" name="projectInfo" property="projectName" / -->

    <template:insert template="componentScoresTemplate.jsp">
    	<template:put name="title">Component Scores</template:put>
        <template:put name="content" content="componentScoresContent.jsp"/>
</template:insert>
