<%--
  - Author: TCSDEVELOPER
  - Version: 1.0
  - Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists the users agreed to selected terms of use and provides the form for recording
  - the terms agreement for selected user.
--%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.admin.Constants" %>
<%@ page import="com.topcoder.web.admin.AdminConstants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${requestScope.terms}" var="terms"/>
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
                <tr>
                    <td align="left">
                        <tc-webtag:errorIterator id="err" name="<%=AdminConstants.TERMS_OF_USE_TYPE_ID%>">
                            <%=err%></tc-webtag:errorIterator>
                    </td>
                </tr>
                <c:if test="${not empty terms}">
                    <% ResultSetContainer termsUsersList = (ResultSetContainer) request.getAttribute("terms_users_list"); %>
                    <tr>
                        <td class="big" align="center" colspan="5"><c:out value="${terms.title}"/></td>
                    </tr>
                    <tr>
                        <td align="left">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>">
                                <%=err%></tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr>
                        <td class="big" align="center" colspan="5">
                            <form action="/admin/?module=AddTermsAgreement" method="post">
                                <tc-webtag:hiddenInput name="<%=Constants.TERMS_OF_USE_ID%>" value="${terms.termsOfUseId}"/>
                                Handle: <input name="<%=Constants.HANDLE%>" value="<c:out value="${param.handle}"/>"
                                               type="text" size="30"/>&nbsp;
                                <input type="submit" value="Add Agreement"/>
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <td class="header">Handle</td>
                        <td class="header">Agreement Date</td>
                    </tr>
                    <% boolean even = false; %>
                    <rsc:iterator list="<%=termsUsersList%>" id="users">
                        <tr>
                            <td class="<%=even?"even":"odd"%>">
                                <tc-webtag:handle coderId="<%=users.getStringItem("user_id")%>"/>
                            </td>
                            <td class="<%=even?"even":"odd"%>">
                                <rsc:item row="<%=users%>" name="create_date" format="MM.dd.yyyy HH:mm:ss"/></td>
                        </tr>
                        <% even = !even;%>
                    </rsc:iterator>
                </c:if>
            </table>

        </td>
    </tr>
</table>
</body>
</html>
