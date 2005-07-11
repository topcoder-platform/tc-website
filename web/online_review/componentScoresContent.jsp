<%@ page language="java" %>
<%@ page import="com.topcoder.apps.review.projecttracker.ProjectType" %> 
<%@ page import="com.topcoder.apps.review.document.ComponentScores" %> 
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<bean:define id="compScores" name="componentScores" type="com.topcoder.apps.review.document.ComponentScores" />
<%= compScores.getComponentName() %>
<%= compScores.getReviewerName(1) %>
