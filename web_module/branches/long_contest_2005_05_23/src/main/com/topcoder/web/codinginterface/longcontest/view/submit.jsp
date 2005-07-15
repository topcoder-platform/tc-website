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
<%
    Boolean stat = ((Boolean)request.getAttribute(Constants.COMPILE_STATUS));
    String error = ((String)request.getAttribute(Constants.COMPILE_MESSAGE));
    String status = "";
    if(stat != null){
        status = stat.booleanValue()?"Your code compile successfully.":"Your code did not compile successfully.";
    }
    Integer lng = ((Integer)request.getAttribute(Constants.SELECTED_LANGUAGE));
    int checked = lng == null ? -1 : lng.intValue();

%>

<%=status%><br/>
<%=error%>
<form action="/longcontest/longcontest?module=Submit" method="POST">
<input type="hidden" name="<%=Constants.ROUND_ID%>" value="<%=request.getParameter(Constants.ROUND_ID)%>">
<input type="hidden" name="<%=Constants.CONTEST_ID%>" value="<%=request.getParameter(Constants.CONTEST_ID)%>">
<input type="hidden" name="<%=Constants.COMPONENT_ID%>" value="<%=request.getParameter(Constants.COMPONENT_ID)%>">
<rsc:iterator list="<%=problems%>" id="resultRow">
<input type="radio" <%=<%=resultRow.getIntItem("language_id")%> == selected ? "checked ":""%>
name="<%=Constants.LANGUAGE_ID%>" value="<%=resultRow.getIntItem("language_id")%>"><%=resultRow.getStringItem("language_name")%><br/>
</rsc:iterator>
<input type="submit"/>
<textarea size=100 name="code">
<%=request.getAttribute(Constants.CODE)%>
</textarea>
</form>
</body>
</html>
