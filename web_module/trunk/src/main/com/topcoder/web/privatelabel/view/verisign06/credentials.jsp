<%@ page import="com.topcoder.web.privatelabel.Constants"%>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>
<head>

        <title>VeriSign Internal SRMs, Powered by TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/verisign06.css"/>
<jsp:include page="../script.jsp" />
</head>
<body>


<table border="0" width="100%" cellpadding="0" cellspacing="0">
<tr>
<td width="49%">&#160;</td>
<td>
<div class="greenBigBox">

         <!-- Tab bar links-->
         <div align=center>
         <jsp:include page="links.jsp" >
         <jsp:param name="selectedTab" value="registration"/>
         </jsp:include>
         </div>

         <br><br>
         <div style="float: left">
         <span class="bigTitle">Registration</span>
         </div>
         <div style="float: right">
         <jsp:include page="right_reg.jsp" />
         </div>
         <br><br>

         Please enter your email address below.  You should receive an email shortly with your username and password.
         <br><br>

         <table cellpadding="0" cellspacing="5" class="bodyText" align="center" width="100%" border="0">
         <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="regForm">
            <tc-webtag:hiddenInput name="<%=Constants.COMPANY_ID%>"/>
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.VERISIGN_06_CREDENTIALS%>"/>
            <tr>
                <td colspan="2" class="errorText" align="center">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right" width="40%" nowrap>
                    Email Address
                </td>
                <td width="60%">
                    <tc-webtag:textInput name="<%=Constants.EMAIL%>"  size="20" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>"/>
                </td>
            </tr>
            <tr><td></td><td><a href="javascript: document.regForm.submit();">Send Email</a></td></tr>
            </form>
      </table>


         <br><br><br><br><br><br><br><br><br><br>
         </div>
      </td>
      <td width="49%">&#160;</td>
   <tr>
</table>
<jsp:include page="foot.jsp" />
</body>
</html>