<%--
  - Author: pulky
  - Version: 1.0
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists terms of use.
  -
  - Version 1.0 (Configurable Contest Terms Release Assembly v1.0) changes: replaced terms_text by title.
--%>
<%@ page import="com.topcoder.web.ejb.user.UserOfTerms,
				 com.topcoder.web.ejb.termsofuse.TermsOfUseEntity,
                 java.util.List,
                 com.topcoder.web.admin.Constants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>  
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

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
            <table>
                <tr><td class="big" align="center" colspan="2"><c:out value="${terms.title}" /></td></tr>
				<c:choose>
					<c:when test="${empty users_of_terms}">
						<tr><td colspan="2">No users agreed this terms.</td></tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td class="header">Handle</td>
							<td class="header">Create Date</td>
						</tr>
						<c:forEach items="${users_of_terms}" var="user" varStatus="row">
							<tr>
							  <c:choose>
								<c:when test="${row.index % 2 == 0}">
									<td class="even"><c:out value="${user.handle}" /></td>
									<td class="even">
										${user.agreedDate}
									</td>
								</c:when>
								<c:otherwise>
									<td class="odd"><c:out value="${user.handle}" /></td>
									<td class="odd">
										${user.agreedDate}
									</td>
								</c:otherwise>
							  </c:choose>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
                
                <tr>
				   <form method="post" action="/admin/?module=AddTermAgreement">
				    <input type="hidden" name="<%=Constants.TERMS_OF_USE_ID%>" value="<c:out value='${terms.termsOfUseId}' />" /> 					
					<td class="big"><input type="text" name="<%=Constants.HANDLE%>" /></td>
					<td><input type="submit" name="Submit" value="Add Agreement" /></td>
				   </form>
                </tr>
				<tr>
					<td colspan="2"><span class="errorText">
						<tc-webtag:errorIterator id="err" name="<%= Constants.HANDLE %>">
							<%=err%>
						</tc-webtag:errorIterator></span>
					</td>
				</tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
