<%--
  - Author: TCSDEVELOPER
  - Version: 1.1
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists terms of use.
  -
  - Version 1.1 (Configurable Contest Terms Release Assembly v1.0) changes: replaced terms_text by title.
--%>
<%@ page import="com.topcoder.web.admin.Constants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>                 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<c:set value="<%=Constants.TERMS_OF_USE_ID%>" var="TERMS_OF_USE_ID"/>

<html>
<head>
    <title>TopCoder Admin</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
<jsp:include page="top.jsp"/>
<table>
    <tr valign="top">
        <td>
            <jsp:include page="left.jsp"/>
        </td>
        <td>
            <c:choose>
                <c:when test="${not empty ttit}">
                    <c:choose>
                        <c:when test="${not empty existing_agreements}">
                            <p>Terms of use title: ${ttit}</p>
                            <form action="${sessionInfo.servletPath}" method="POST" name="createAgreementForm">
                                <input type="hidden" name="module" value="CreateTermsOfUseAgreement"/>
                                <tc-webtag:hiddenInput name="${TERMS_OF_USE_ID}" value="${tid}"/>
                                <table>
                                    <tr>
                                        <td align="left">
                                            Add new agreement:
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <tc-webtag:errorIterator id="err" name="ha">${err}</tc-webtag:errorIterator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            Handle: <tc-webtag:textInput name="ha" size="100" maxlength="50"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <input type="submit" name="submit" value="Save"/>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <br/>
                            <table>
                                <tr>
                                    <td class="header">Handle</td>
                                    <td class="header">Timestamp</td>
                                </tr>
                    
                                <c:forEach items="${existing_agreements}" var="agreement" varStatus="status">
                                    <tr>
                                        <td class="${status.index % 2 == 1? 'even' : 'odd'}">
                                            <tc-webtag:handle coderId='${agreement.map["user_id"]}'/>
                                        </td>
                                        <td class="${status.index % 2 == 1? 'even' : 'odd'}">
                                            <fmt:formatDate value="${row.map['create_date']}" pattern="MM.dd.yyyy HH:mm:ss"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </c:when>
                        <c:otherwise>
                            The are currently no agreements for this terms of use.
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    The specified terms of use was not found.
                </c:otherwise>
            </c:choose>
        </td>
    </tr>
</table>
</body>
</html>
