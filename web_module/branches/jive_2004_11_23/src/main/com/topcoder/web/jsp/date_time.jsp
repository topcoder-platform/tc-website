<%@ page language="java"%>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" />
<%@ taglib uri="tc-taglib.tld" prefix="tc" %>
<tc:format object="<%=sessionInfo.getDate()%>" format="MMMM d, yyyy"/>






