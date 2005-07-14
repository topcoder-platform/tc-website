<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<!-- bean:define id="theName" name="projectInfo" property="projectName" / -->
<!-- FIX name -->
<% String theTitle="Component Scores"; %>

    <template:put name="content" content="componentScoresContent.jsp"/>

