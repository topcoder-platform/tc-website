<%--
  - Author: isv, pulky
  - Date: 07 Jan 2009
  - Version: 1.1
  - Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: Displays the Terms Of User for Assembly Project Review and provides a form for the user to accept the
  - terms and submit the response to server to continue signing up for review.
  - Version 1.1 (Configurable Contest Terms Release Assembly v1.0) changes: Added new functionality that asks for
  - several terms of use and show those the reviewer already agreed to.
--%>
<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.web.tc.Constants" %>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>

<head>
    <title>Programming Contests, Software Development, and Employment Services at TopCoder</title>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

</head>

<body>

<jsp:include page="/top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<%-- Left Column Begins--%>
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="assembly"/>
    </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Gutter Begins --%>
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt=""/></td>
<%-- Gutter Ends --%>

<%-- Center Column Begins --%>
<td width="100%" align="center">

    <jsp:include page="/page_title.jsp">
        <jsp:param name="image" value="software_assembly"/>
        <jsp:param name="title" value="Review Opportunities"/>
    </jsp:include>

    <form action="<%=sessionInfo.getServletPath()%>" method="POST" name="frmTerms">
        <input type="hidden" name="<%=Constants.PROJECT_ID%>" value="<%=request.getParameter(Constants.PROJECT_ID)%>"/>
<%--
        <input type="hidden" name="<%=Constants.PHASE_ID%>" value="<%=request.getParameter(Constants.PHASE_ID)%>"/>
--%>
        <input type="hidden" name="<%=Constants.REVIEWER_TYPE_ID%>"
               value="<%=request.getParameter(Constants.REVIEWER_TYPE_ID)%>"/>
        <input type="hidden" name="<%=Constants.PRIMARY_FLAG%>"
               value="<%=request.getParameter(Constants.PRIMARY_FLAG)%>"/>
        <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="ProjectReviewTermsAgree"/>
        <input type="hidden" name="<%=Constants.PROJECT_TYPE_ID%>"
               value="<%=request.getParameter(Constants.PROJECT_TYPE_ID)%>"/>

        <c:if test="${not empty terms}">
            <input type="hidden" name="<%=Constants.TERMS_OF_USE_ID%>"
                   value="${terms.termsOfUseId}"/>
        </c:if>

        <table border="0" cellspacing="0" cellpadding="5">
            <c:choose>
                <c:when test="${not empty terms}">
                    <tr>
                        <td>
                            <strong>${terms.title}</strong>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <tc-webtag:textArea name="<%=Constants.TERMS%>" text="${terms.termsText}" rows="10"
                                cols="80" readOnly="true" styleClass="bodyText"/>
                        </td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td>
                            The following terms (that you already agreed to) apply to this review:
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <c:forEach items="${terms_agreed}" var="terms_agreed_item">
                                <ul>
                                    <li>
                                        ${terms_agreed_item.title}
                                        <c:choose>
                                            <c:when test="${not empty terms_agreed_item.url}">
                                                <a href="${terms_agreed_item.url}">(View)</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="/tc?module=Terms&tuid=${terms_agreed_item.termsOfUseId}" target="_blank">(View)</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </li>
                                </ul>
                            </c:forEach>
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
            <c:if test="${not empty terms}">
                <c:choose>
                    <c:when test="${terms.electronicallySignable == 1}">
                        <tr>
                            <td class="errorText">
                                <tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>">${err}
                                </tc-webtag:errorIterator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                I Agree to the Terms and Conditions stated above&#160;
                                <tc-webtag:chkBox name="<%=Constants.TERMS_AGREE%>"/>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        You cannot agree to this terms electronically. You must print the terms and
                        send a signed hard copy to TopCoder. You can get a printer friendly version
                        <a href="${terms.url}">here</a>.
                    </c:otherwise>
                </c:choose>
            </c:if>

            <c:if test="${empty terms}">
                <c:set var="captchaFileName" value="<%=Constants.CAPTCHA_FILE_NAME%>"/>
                <tr>
                    <td class="errorText">
                        <img src="/i/captcha/${requestScope[captchaFileName]}" alt="captcha image"/>

                        <p>
                            <a href="javascript:window.location.reload()">This image is hard to read. Show me a different
                                one.</a>
                        </p>
                    </td>
                </tr>

                <tr>
                    <td class="errorText">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.CAPTCHA_RESPONSE%>">${err}
                            <br/></tc-webtag:errorIterator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>
                            Please enter the characters you see in the image above:
                            <tc-webtag:textInput name="<%=Constants.CAPTCHA_RESPONSE%>"/>
                        </p>
                    </td>
                </tr>
            </c:if>

            <c:choose>
                <c:when test="${not empty terms}">
                    <c:if test="${terms.electronicallySignable == 1}">
                        <tr>
                            <td align="center">
                                <input type="submit" onClick="" name="submit" value=" Continue"/>
                            </td>
                        </tr>
                    </c:if>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td align="center">
                            <input type="submit" onClick="" name="submit" value=" Register"/>
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </table>

    </form>
</td>
<%-- Center Column Ends --%>

<%-- Gutter --%>
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt=""></td>
<%-- Gutter Ends --%>

<%-- Right Column Begins --%>
<td width="180">
    <jsp:include page="/public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>

</td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
<td width="2"><img src="/i/clear.gif" width="2" height="1" border="0" alt=""></td>
<%-- Gutter Ends --%>

</tr>
</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>

