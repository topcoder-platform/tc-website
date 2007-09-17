<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.tc.controller.request.tournament.tco08.SymposiumRegBase,
                 com.topcoder.web.common.model.SymposiumReg" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="reg" value="<%= request.getSession().getAttribute(SymposiumRegBase.REG_DATA_ATTR) %>" />
<c:set var="payment" value="<%= request.getSession().getAttribute(SymposiumRegBase.PAYMENT_DATA_ATTR) %>" />
<c:set var="REG_TYPE_COLLEGIATE_TC" value="<%=SymposiumReg.REG_TYPE_COLLEGIATE_TC %>" />
<c:set var="REG_TYPE_PROFESSIONAL" value="<%=SymposiumReg.REG_TYPE_PROFESSIONAL %>" />
<c:set var="REG_TYPE_PROFESSIONAL_EARLY" value="<%=SymposiumReg.REG_TYPE_PROFESSIONAL_EARLY %>" />
<html>

<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../../script.jsp" />
    <jsp:include page="../../../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    
</head>

<body>
<center>
<br/>
<h2>Registration for the Software Symposium at the 2008 TopCoder Open</h2>
<br/>
<br/>
<form name="f" method="post" action="/tc">
<tc-webtag:hiddenInput name="module" value="TCO08SymposiumRegisterSubmit" /> 
<table cellpadding="3" cellspacing="0">
<tbody>
    <tr>
        <td>Given Name:</td>
        <td>${reg.firstName }</td>
    </tr>
    <tr>
        <td>Surname:</td>
        <td>${reg.lastName }</td>
    </tr>    
    <tr>
        <td>TopCoder handle:</td>
        <td><c:choose> 
            <c:when test="${not empty reg.user}">${reg.user.handle }</c:when>
            <c:otherwise>N/A</c:otherwise>
            </c:choose>
        </td>
    </tr>
    <tr>
        <td>You are:</td>
        <td><c:choose>
                <c:when test="${reg.professional}">Professional</c:when>
                <c:otherwise>College Student</c:otherwise>
            </c:choose>
        </td>
    </tr>
    <tr>
        <td><c:choose>
                <c:when test="${reg.professional}">Company:</c:when>
                <c:otherwise>College/University:</c:otherwise>
            </c:choose>
        </td>
        <td><c:choose>
                <c:when test="${reg.professional and not empty reg.companyName}">${reg.companyName}</c:when>
                <c:when test="${not reg.professional and not empty reg.collegeName}">${reg.collegeName}</c:when>
                <c:otherwise>N/A</c:otherwise>
            </c:choose>
        </td>
    </tr>
    <tr>
        <td>Phone number:</td>
        <td>${reg.phoneNumber}</td>
    </tr>
    <tr>
        <td>Email address:</td>
        <td>${reg.emailAddress }</td>
    </tr>
    <tr>
        <td>Address 1:</td>
        <td>${reg.address1}</td>
    </tr>
    <tr>
        <td>Address 2:</td>
        <td>${reg.address2}</td>
    </tr>
    <tr>
        <td>City:</td>
        <td>${reg.city}</td>
    </tr>
    <tr>
        <td>Postal Code:</td>
        <td>${reg.zip }</td>
    </tr>
    <tr>
        <td>Country:</td>
        <td>${reg.country.name }</td>
    </tr>
    <tr>
        <td>Registration type:</td>
        <td><c:choose>
                <c:when test="${reg.registrationType == REG_TYPE_COLLEGIATE_TC }">Collegiate TopCoder Member: $99</c:when>
                <c:when test="${reg.registrationType == REG_TYPE_PROFESSIONAL }">Professional: $299</c:when>
                <c:when test="${reg.registrationType == REG_TYPE_PROFESSIONAL_EARLY }">Professional Early bird: $199</c:when>
           </c:choose>
        </td>
    </tr>
    <tr>
        <td>Method of Payment:</td>
        <td><c:choose>
                <c:when test="${payment.method == 'Visa'}">Visa</c:when>                
                <c:when test="${payment.method == 'MC'}">Master Card</c:when>                
                <c:when test="${payment.method == 'AMEX'}">American Express</c:when>                
                <c:when test="${payment.method == 'Discover'}">Discover</c:when>  
                              
            </c:choose>
        </td>
    </tr>
    <tr>
        <td>Card Number:</td>
        <td>${payment.cardNumber }</td>
    </tr>
    <tr>
        <td>Expiration Date:</td>
        <td>${payment.expirationDate}</td>
    </tr>    
</tbody>
</table>

<br/>
<div align="center">
    <a href="#" onclick="document.f.submit();return false;">Confirm</a>
</div>

</form>

<br/>
<br/>

<br/>
</center>
<jsp:include page="../../../foot.jsp" />

</body>

</html>