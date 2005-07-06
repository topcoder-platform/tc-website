<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.codinginterface.longcontest.*,
          com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ taglib uri="/WEB-INF/rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html>
<head>
<title>Submit</title>
</head>
<body>

<%=request.getSession().getAttribute(Constants.COMPILE_STATUS)%><br/>
<%=request.getSession().getAttribute(Constants.COMPILE_MESSAGE)%>
<form action="/longcontest/longcontest?module=Submit" method="POST">
<input type="hidden" name="<%=Constants.ROUND_ID%>" value="<%=request.getParameter(Constants.ROUND_ID)%>">
<input type="hidden" name="<%=Constants.CONTEST_ID%>" value="<%=request.getParameter(Constants.CONTEST_ID)%>">
<input type="hidden" name="<%=Constants.COMPONENT_ID%>" value="<%=request.getParameter(Constants.COMPONENT_ID)%>">
<input type="radio" name="<%=Constants.LANGUAGE_ID%>" value="1">Java<br/>
<input type="radio" name="<%=Constants.LANGUAGE_ID%>" value="3">C++<br/>
<input type="submit"/>
<textarea size=100 name="code">
<%=request.getSession().getAttribute(Constants.CODE)%>
</textarea>
</form>
</body>
</html>
