<%@ page language="java"%>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" />
<%@ taglib uri="tc-webtags.tld" prefix="web" %>
<web:format object="<%=sessionInfo.getDate()%>" format="MMMM d, yyyy"/>
