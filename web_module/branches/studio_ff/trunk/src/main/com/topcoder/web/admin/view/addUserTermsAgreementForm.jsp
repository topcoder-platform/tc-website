<%--
  - Author: isv
  - Version: 1.0 (Miscellaneous TC Improvements 1.0)
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page provides the JSP fragment with form for adding new terms of use agreements for requested
  - users.
--%>
<%@ page import="com.topcoder.web.admin.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<c:set value="<%=Constants.TERMS_OF_USE_ID%>" var="TERMS_OF_USE_ID"/>
<c:set value="<%=Constants.HANDLE%>" var="HANDLE"/>
<c:set value="${requestScope.ttit}" var="termsTitle"/>
<c:set value="${requestScope.tid}" var="termsId"/>
<c:set value="${requestScope.message}" var="message"/>
<c:if test="${empty message and param.agreementCreated}">
    <c:set value="The agreement was successfully generated." var="message"/>
</c:if>
<c:if test="${empty message and param.agreementRemoved}">
    <c:set value="The agreement was successfully removed." var="message"/>
</c:if>

<p>Terms of use title: ${termsTitle}</p>
<hr/>
<form action="${sessionInfo.servletPath}" method="post" name="createAgreementForm">
    <input type="hidden" name="module" value="CreateTermsOfUseAgreement"/>
    <input type="hidden" name="source" value="${param.source}"/>
    <tc-webtag:hiddenInput name="${TERMS_OF_USE_ID}" value="${termsId}"/>
    <table>
        <c:if test="${not empty message}">
            <tr>
                <td align="left"><strong>${message}</strong></td>
            </tr>
        </c:if>
        <tr>
            <td align="left">Add new agreement:</td>
        </tr>
        <tr>
            <td align="left">
                <strong>
                    <tc-webtag:errorIterator id="err" name="${HANDLE}">${err}</tc-webtag:errorIterator>
                </strong>
            </td>
        </tr>
        <tr>
            <td align="left">
                Handle: <tc-webtag:textInput name="${HANDLE}" size="100" maxlength="50" value="${param[HANDLE]}"/>
            </td>
        </tr>
        <tr>
            <td align="left">
                <input type="submit" name="submit" value="Add Agreement"/>
            </td>
        </tr>
    </table>
</form>
<br/>
<hr/>
