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
<title>Submit - <%=request.getAttribute(Constants.CLASS_NAME)%></title>
</head>
<body>
<%
    Boolean stat = ((Boolean)request.getSession().getAttribute(Constants.COMPILE_STATUS));
    String error = ((String)request.getSession().getAttribute(Constants.COMPILE_MESSAGE));
    String status = "";
    if(stat != null){
        status = stat.booleanValue()?"Your code compile successfully.":"Your code did not compile successfully.";
    }else{
        error = "";
    }
    int checked = ((Integer)request.getSession().getAttribute(Constants.SELECTED_LANGUAGE)).intValue();
    ResultSetContainer langs = (ResultSetContainer)request.getSession().getAttribute(Constants.LANGUAGES);
%>

<%=status%><br/>
<%=error%>
<form action="/longcontest/longcontest?module=Submit" method="POST">
<input type="hidden" name="<%=Constants.ROUND_ID%>" value="<%=request.getParameter(Constants.ROUND_ID)%>">
<input type="hidden" name="<%=Constants.CONTEST_ID%>" value="<%=request.getParameter(Constants.CONTEST_ID)%>">
<input type="hidden" name="<%=Constants.COMPONENT_ID%>" value="<%=request.getParameter(Constants.COMPONENT_ID)%>">
<rsc:iterator list="<%=langs%>" id="resultRow">
<input type="radio" <%=resultRow.getIntItem("language_id") == checked ? "checked ":""%>
name="<%=Constants.LANGUAGE_ID%>" value="<%=resultRow.getIntItem("language_id")%>"><%=resultRow.getStringItem("language_name")%><br/>
</rsc:iterator>
<input type="submit"/>
<textarea size=100 name="code">
<%=request.getSession().getAttribute(Constants.CODE)%>
</textarea>
</form>
</body>
</html>
<%
    request.getSession().removeAttribute(Constants.COMPILE_STATUS);
    request.getSession().removeAttribute(Constants.COMPILE_MESSAGE);
    request.getSession().removeAttribute(Constants.SELECTED_LANGUAGE);
    request.getSession().removeAttribute(Constants.CODE);
    request.getSession().removeAttribute(Constants.LANGUAGES);
    request.getSession().removeAttribute(Constants.CLASS_NAME);
%>
