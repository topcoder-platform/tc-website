<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.reg.controller.request.Login" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Registration</title>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_reg"/>
    </jsp:include>


</head>


<body>
<div align="center" style="padding:6px 0px 6px; 0px;">
    <A href="http://<%=ApplicationServer.SERVER_NAME%>"><img src="/i/registration/tc_logo.gif" alt="TopCoder" border="0"/></A>
</div>

<div align="center">
    <div style="padding: 0px 10px 10px 10px; width: 600px; text-align: left;">

        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="registration_w"/>
            <jsp:param name="title" value="&#160;"/>
        </jsp:include>

        <form method="post" name="frmLogin" action="<jsp:getProperty name="sessionInfo" property="secureAbsoluteServletPath"/>">
            <input type="hidden" name="module" value="HsIneligible">

            <div align="center">
        <c:choose>
            <c:when test="${not registeredComp and not requestedComp}"> 
                <table cellpadding="0" cellspacing="0" border="0" class="regFields">
                	<tr>
                        <td>
                            Sorry, you are ineligible for HS.  Would you like to register for our post-HS competitions instead?
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" name="continue" value="Yes">
                            <input type="submit" name="continue" value="No">                            
                        </td>
                    </tr>
                </table>
           </c:when>
            <c:when test="${not registeredComp and requestedComp}"> 
                <table cellpadding="0" cellspacing="0" border="0" class="regFields">
                	<tr>
                        <td>
                            Sorry, you are ineligible for HS.  Continue to register for post-HS competitions?
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" name="continue" value="Yes">
                            <input type="submit" name="continue" value="No">                            
                        </td>
                    </tr>
                </table>
           </c:when>
            <c:when test="${registeredComp}"> 
                <table cellpadding="0" cellspacing="0" border="0" class="regFields">
                	<tr>
                        <td>
                            Sorry, you are ineligible for HS.
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" name="continue" value="Cancel">                            
                        </td>
                    </tr>
                </table>
           </c:when>
                
             </c:choose>

                <p><br/></p>

        </form>

    </div>
</div>

</body>
</html>