<%--
  - Author: pulky
  - Date: 21 Jan 2009
  - Version: 1.2
  - Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: Displays the Terms Of User for Design and Development Project Review and provides a form for the
  - user to accept the terms and submit the response to server to continue signing up for review.
  - Version 1.1 (Configurable Contest Terms Release Assembly v1.0) changes: Added new functionality that asks for
  - several terms of use and show those the reviewer already agreed to.
  -
  - Version 1.2 (Configurable Contest Terms Release Assembly v2.0) changes: Replaced textarea with iframe to show
  - terms of use and also added pending terms of use list so that each terms of use can be accepted separatedly.
--%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.web.tc.Constants"%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>

<%-- Variables to use JSTL --%>
<c:set var="PROJECT_ID" value="<%=Constants.PROJECT_ID%>" scope="request"/>
<c:set var="PROJECT_TYPE_ID" value="<%=Constants.PROJECT_TYPE_ID%>"/>
<c:set var="REVIEWER_TYPE_ID" value="<%=Constants.REVIEWER_TYPE_ID%>"/>
<c:set var="PRIMARY_FLAG" value="<%=Constants.PRIMARY_FLAG%>"/>
<c:set var="TERMS_OF_USE_ID" value="<%=Constants.TERMS_OF_USE_ID%>"/>
<c:set var="TERMS_AGREE" value="<%=Constants.TERMS_AGREE%>"/>
<c:set var="CAPTCHA_RESPONSE" value="<%=Constants.CAPTCHA_RESPONSE%>"/>
<c:set var="CAPTCHA_FILE_NAME" value="<%=Constants.CAPTCHA_FILE_NAME%>"/>
<c:set var="projectType" value="${param[PROJECT_TYPE_ID]}" scope="request"/>

<head>
<title>Programming Contests, Software Development, and Employment Services at TopCoder</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<% int phase_id = ((Integer)request.getAttribute("phase_id")).intValue(); %>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="<%= phase_id == 112 ? "des_review" : "dev_review"%>"/>
         </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Gutter Begins --%>
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt=""/></td>
<%-- Gutter Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="<%= phase_id == 112 ? "comp_design" : "comp_development"%>"/>
    <jsp:param name="title" value="Review Opportunities"/>
</jsp:include>

            <form action="<%=sessionInfo.getServletPath()%>" method="POST" name="frmTerms">
              <input type="hidden" name="<%=Constants.PROJECT_ID%>" value="<%=request.getParameter(Constants.PROJECT_ID)%>"/>
                <%-- TCS Release 2.2.0 (TCS-54) : The request passes project type ID instead of component
                     phase type ID when referrring to review project type--%>
<%--
              <input type="hidden" name="<%=Constants.PHASE_ID%>" value="<%=request.getParameter(Constants.PHASE_ID)%>"/>
--%>
                <input type="hidden" name="<%=Constants.PROJECT_TYPE_ID%>"
                       value="<%=request.getParameter(Constants.PROJECT_TYPE_ID)%>"/>
              <input type="hidden" name="<%=Constants.REVIEWER_TYPE_ID%>" value="<%=request.getParameter(Constants.REVIEWER_TYPE_ID)%>"/>
              <input type="hidden" name="<%=Constants.PRIMARY_FLAG%>" value="<%=request.getParameter(Constants.PRIMARY_FLAG)%>"/>
              <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="ProjectReviewTermsAgree"/>

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
                                <iframe width="590" height="300" marginWidth="5"
                                    src="${sessionInfo.servletPath}?module=Terms&amp;${TERMS_OF_USE_ID}=${terms.termsOfUseId}">
                                </iframe>
                            </td>
                        </tr>
                        <c:choose>
                            <c:when test="${terms.electronicallySignable == 1}">
                                <tr>
                                    <td class="errorText">
                                        <tc-webtag:errorIterator id="err" name="${TERMS_AGREE}">${err}
                                        </tc-webtag:errorIterator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        I Agree to the Terms and Conditions stated above&#160;
                                        <tc-webtag:chkBox name="${TERMS_AGREE}"/>
                                    </td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <jsp:include page="/terms/paper_terms.jsp">
                                    <jsp:param name="terms.url" value="terms.url"/>
                                </jsp:include>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <c:if test="${not empty terms_agreed}">
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
                                                    <c:when test="${terms_agreed_item.electronicallySignable != 1}">
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
                        </c:if>
                        <c:choose>
                            <c:when test="${not empty terms_pending}">
                                <tr>
                                    <td>
                                        You have the following terms pending for agreement:
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <c:forEach items="${terms_pending}" var="terms_pending_item">
                                            <ul>
                                                <li>
                                                    ${terms_pending_item.title}
                                                    <a href="/tc?module=ProjectReviewApply&${PROJECT_ID}=${param[PROJECT_ID]}&${REVIEWER_TYPE_ID}=${param[REVIEWER_TYPE_ID]}&${PRIMARY_FLAG}=${param[PRIMARY_FLAG]}&${PROJECT_TYPE_ID}=${projectType}&${TERMS_OF_USE_ID}=${terms_pending_item.termsOfUseId}">(View and agree)</a>
                                                </li>
                                            </ul>
                                        </c:forEach>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        In order to register you must agree to all pending terms of use.
                                    </td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td class="errorText">
                                        <img src="/i/captcha/${requestScope[CAPTCHA_FILE_NAME]}" alt="captcha image"/>

                                        <p>
                                            <a href="javascript:window.location.reload()">This image is hard to read.
                                                Show me a different one.</a>
                                        </p>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="errorText">
                                        <tc-webtag:errorIterator id="err" name="${CAPTCHA_RESPONSE}">${err}
                                            <br/></tc-webtag:errorIterator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            Please enter the characters you see in the image above:
                                            <tc-webtag:textInput name="${CAPTCHA_RESPONSE}"/>
                                        </p>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>

            <c:choose>
                <c:when test="${not empty terms}">
                    <tr>
                        <td align="center">
                            <c:set value="Go back" var="returnMessage"/>
                            <c:if test="${terms.electronicallySignable == 1}">
                                <input type="submit" onClick="" name="submit" value=" Continue"/>
                                <c:set value="Cancel" var="returnMessage"/>
                            </c:if>

                            <input type="button" onClick="location.href='/tc?module=ProjectReviewApply&${PROJECT_ID}=${param[PROJECT_ID]}&${REVIEWER_TYPE_ID}=${param[REVIEWER_TYPE_ID]}&${PRIMARY_FLAG}=${param[PRIMARY_FLAG]}&${PROJECT_TYPE_ID}=${projectType}'" name="${returnMessage}" value="${returnMessage}"/>
                        </td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:if test="${empty terms_pending}">
                        <tr>
                            <td align="center">
                                <input type="submit" onClick="" name="submit" value=" Register"/>
                            </td>
                        </tr>
                    </c:if>
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
            <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>

         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0" alt=""></td>
<%-- Gutter Ends --%>

    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>

