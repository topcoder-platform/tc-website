<%@ page import="com.topcoder.web.winformula.Constants" %>
<%@ page import="com.topcoder.web.winformula.model.PrizeType" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="winformula.tld" prefix="winformula" %>
<c:set var="clientPrize" value="<%=PrizeType.BONUS%>"/>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - Register</title>
    <%-- Meta Tags --%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_winformula"/>
    </jsp:include>
</head>

<body>
    <div id="wrapper">
    <%-- Wrapper --%>
    
        <jsp:include page="nav.jsp">
        <jsp:param name="tabLev1" value="register" />
        <jsp:param name="tabLev2" value="" />
        <jsp:param name="tabLev3" value="" />
        </jsp:include>
        
        <div id="container">
        <%-- Container --%>
        <div id="main-content">
        <%-- Main Content --%>
        
        
            <h1>Register</h1>
            <div class="full-content">
                <c:choose>
                    <c:when test="${registered}">
                        <p><strong>You are already registered</strong>.</p>
                    </c:when>
                    <c:otherwise>
                        <p>Registration for the Winning Formula Challenge is FREE! Simply read and agree to the terms and conditions below and click <strong>Register Now</strong>.</p>
                        <h2>Terms &amp; conditions of the Winning Formula Challenge</h2>
        
                        <div align="center">
                            Please read through the following terms, check off <strong>"I agree"</strong>, and click Submit when you're done.
                            <br /><br />
        
                            <form name="terms" method="POST" action="${sessionInfo.servletPath}">
                                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Register"/>
                                <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
                                <iframe width="590" height="300" marginWidth="5" src="${sessionInfo.servletPath}?module=Terms&amp;<%=Constants.TERMS_OF_USE_ID%>=<%=Constants.CONTEST_TERMS_OF_USE_ID%>"></iframe>
                                <br /><br />
                                <!-- could also use <input>'s button <button> gives you more display freedom and is documented on w3c -->
                                <!-- resulting page from click has value at the end of the URL, which is pointless.  Feel free to use any html/js element/method but i want the nice looking button -->
                        <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>">${err}
                            <br/></tc-webtag:errorIterator></span>
                                <input type="checkbox" name="<%=Constants.TERMS_AGREE%>"/>&nbsp;&nbsp;I agree
                                <br /><br />
                                <p class="wrapperBtnAgree">
                                <a href="javascript:document.terms.submit()" class="learnButton" title="Register Now!"><span>Register Now!</span></a>
                              </p>
                            </form>
                        </div>
                    </c:otherwise>
                </c:choose>
            </form>
            </div>
        
        <%-- Main Content --%>
        </div>
        <%-- End Container --%>
        </div>

    <div id="footer">
    <%-- Footer --%>
    </div>
    
<%-- End Wrapper --%>
</div>
</body>
</html>