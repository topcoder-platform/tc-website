<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.tc.controller.request.authentication.Login,
                 com.topcoder.web.tc.controller.request.authentication.FindUser,                 
                 com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>Password Reset</title>

<SCRIPT type="text/javascript">
</SCRIPT>


<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_reg"/>
</jsp:include>
</head>

<body>

<form method="post" name="frm" action="/tc">
<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="RecoverEmail"/>
<input type="hidden" name="cr" value='<%= request.getAttribute("cr")%>'/>

<tc-webtag:errorIterator id="err" name="error"><%=err%></tc-webtag:errorIterator></span>
<br>
   
Question: <%= request.getAttribute("sq") %>
<br>
Your response:
<tc-webtag:textInput name="resp" size="30" maxlength="30"/>
<br>
Current email you're using: 
<tc-webtag:textInput name="<%= Constants.EMAIL %>" size="30" maxlength="30"/>
<br>
An email will be sent to that address in order to change your password.

<a href="JavaScript:document.frm.submit()" class="bodyText">Submit</a>

</form>

   </div>
</div>

</body>
</html>