<%--
  - Author: pulky, isv
  - Version: 1.1 (Miscellaneous TC Improvements Assembly v1.0)
  - Since: 1.0 (Configurable Contest Terms Release Assembly v2.0)
  - Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists all users that agreed to a particular terms of use and the links from removing
  - individual user agreements to terms of use. The page also provides a form for adding new agreements.
  -
  - Version 1.1 (Miscellaneous TC Improvements Assembly v1.0) changes: added a new column with Remove button
  - to be used for removing the individual user terms agreements.
--%>
<%@ page import="com.topcoder.web.admin.Constants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<c:set value="<%=Constants.TERMS_OF_USE_ID%>" var="TERMS_OF_USE_ID"/>
<c:set value="<%=Constants.USER_ID%>" var="USER_ID"/>
<c:set value="<%=Constants.HANDLE%>" var="HANDLE"/>
<c:set value="${requestScope.ttit}" var="termsTitle"/>
<c:set value="${requestScope.tid}" var="termsId"/>
<c:set value="${requestScope.existing_agreements}" var="existingAgreements"/>

<html>
<head>
    <title>TopCoder Admin</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript">
        function confirmAgreementDeletion(b) {
            return confirm('Do you want to remove this record on user\'s agreement to these terms of use?');
        }
    </script>
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
                 <c:when test="${not empty termsTitle}">
                    <jsp:include page="addUserTermsAgreementForm.jsp">
                        <jsp:param name="source" value="view"/>
                    </jsp:include>
                    <c:choose>
                        <c:when test="${not empty existingAgreements}">
                            <p>Existing Agreements:</p>
                            <form action="${sessionInfo.servletPath}" method="post">
                                <input type="hidden" name="module" value="DeleteTermsOfUseAgreement"/>
                                <tc-webtag:hiddenInput name="${TERMS_OF_USE_ID}" value="${termsId}"/>
                                <table>
                                    <tr>
                                        <td class="header">Handle</td>
                                        <td class="header">Timestamp</td>
                                        <td class="header">Remove?</td>
                                    </tr>
                                    <c:forEach items="${existingAgreements}" var="agreement" varStatus="status">
                                        <tr>
                                            <c:set value="${status.index % 2 == 1? 'even' : 'odd'}" var="tdClass"/>
                                            <td class="${tdClass}">
                                                <tc-webtag:handle coderId='${agreement.map["user_id"]}'/>
                                            </td>
                                            <td class="${tdClass}">
                                                <fmt:formatDate value="${agreement.map['create_date']}"
                                                                pattern="MM.dd.yyyy HH:mm:ss"/>
                                            </td>
                                            <td class="${tdClass}">
                                                <button name="${USER_ID}" value="${agreement.map["user_id"]}"
                                                        onclick="return confirmAgreementDeletion(this)"
                                                        title="Remove Agreement" type="submit">Remove</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </form>
                        </c:when>
                        <c:otherwise>The are currently no agreements for this terms of use.</c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>The specified terms of use was not found.</c:otherwise>
            </c:choose>
        </td>
    </tr>
</table>
</body>
</html>
