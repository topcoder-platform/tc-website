<%@ include file="nocache.jsp" %>
<%@ page errorPage="error.jsp" %>
<%@ taglib uri="tc-taglib.tld" prefix="tc" %>
<%@ page import="com.topcoder.web.reg.servlet.*" %>
<jsp:useBean id="Registration" scope="session" class="com.topcoder.web.reg.bean.Registration" />
<jsp:useBean id="navigation" scope="session" class="com.topcoder.common.web.data.Navigation" />
<tc:getProperty id="user" name="navigation" property="user" type="com.topcoder.common.web.data.User" />
<jsp:setProperty name="Registration" property="user" value="<%=user%>" />
<jsp:setProperty name="Registration" property="Step" value="<%=Registration.STEP_0%>" />

<%--
This page is included by reg/index.jsp (index_center.jsp) when a user is registering.
--%>

<span class="statText">
  <jsp:include page="../includes/terms_body.jsp" />
</span>

<%-- agree and disagree buttons --%>
<form action="<%=Controller.ALIAS%>" method="post">
    <input type="hidden" name="<%=Controller.TASK%>" value="Registration">
    <input type="hidden" name="<%=Registration.TERMS%>" value="<%=Registration.CHECKBOX_YES%>">
    <span class="errorText"><jsp:getProperty name="Registration" property="TermsError" /></span>
    <span class="statText">
    <input type="submit" name="submitButton" value="Agree">
    <input type="button" name="cancelButton" value="Disagree" onClick="location='<%=Registration.PAGE_5B%>';">
    </span>
</form>
