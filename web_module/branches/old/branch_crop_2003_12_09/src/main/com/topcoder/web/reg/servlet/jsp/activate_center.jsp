<jsp:include page="nocache.jsp" />
<%@ page errorPage="error.jsp" %>
<%@ page session="true" %>
<%@ taglib uri="tc-taglib.tld" prefix="tc" %>
<jsp:useBean id="Registration" class="com.topcoder.web.reg.bean.Registration" />
<jsp:useBean id="navigation" scope="session" class="com.topcoder.common.web.data.Navigation" />
<tc:getProperty id="user" name="navigation" property="user" type="com.topcoder.common.web.data.User" />
<jsp:setProperty name="Registration" property="user" value="<%=user%>" />
<jsp:setProperty name="Registration" property="step" value="<%=Registration.STEP_4%>" />
<jsp:setProperty name="Registration" property="code" />
<jsp:setProperty name="Registration" property="process" value="doItNowBaby" />

<P class="statText">
Activation page<br>
Result:<br>
</P>

<span class="errorText">
<jsp:getProperty name="Registration" property="CodeError" />
</span>

<a href="/?t=index" class="statText">link to home page</a>
