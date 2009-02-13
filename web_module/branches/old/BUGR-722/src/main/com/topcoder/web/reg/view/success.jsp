<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.model.RegistrationType" %>
<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Registration Signup: Registration Areas</title>
        <script type="text/javascript" src="/js/regReskin20080904.js"></script>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
        <jsp:include page="style.jsp">
            <jsp:param name="key" value="tc_reg"/>
        </jsp:include>
    </head>
    
    <body>
        
        <div id="wrapper">
        
            <div id="box-head">
                <jsp:include page="header.jsp" />
                <div id="page-head">
                    <h3 id="registration-signup"><span>Registration Signup: Personal Information</span></h3>
                </div>
            </div>
            
            <div id="box-body">
                <p class="padded confirmation">
                <c:choose>
                    <c:when test="${isNewReg}">
                    <strong>Thank you for registering.<br />
                    We have sent you a confirmation email with activation information.<br />
                    Please check your email and activate your account now.</strong>
                    </c:when>
                    <c:otherwise>
                    <strong>Profile updated!</strong>
                    <br/><br/>
                    Your profile has been successfully updated
                    <form method="get" action="/tc">
                        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="MyHome"/>
                        <ul class="lonebuttons">
                            <li class="form-bottom">
                                <button type="submit" id="submit">Continue to My Home</button>
                            </li>
                        </ul>
                    </form>
                    </c:otherwise>
                </c:choose>
                </p>
            </div>
            <jsp:include page="footer.jsp" />
            
        </div>
        
    </body>
</html>
