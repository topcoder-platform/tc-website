<%@ page contentType="text/html; charset=ISO-8859-1"
import="com.topcoder.dde.util.Constants,
        java.util.Iterator,
        java.util.List,
        com.topcoder.apps.screening.ScreeningResponse" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>
    <HEAD>
         <c:set var="hasErrors" value="${not empty errors}"/>
         <c:set var="hasWarnings" value="${not empty warnings}"/>
         <c:set var="hasSuccess" value="${not empty success}"/>
         <c:set var="screeningFinished" value="${hasErrors || hasWarnings || hasSuccess}"/>
          
        <c:if test="${!screeningFinished}">
            <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
            <META HTTP-EQUIV="Expires" CONTENT="-1">
            <META HTTP-EQUIV="Refresh" CONTENT="10">
        </c:if>
        <TITLE>Screening results</TITLE>
    </HEAD>
    <BODY>
        <TABLE WIDTH="100%" HEIGHT="100%">
            <TR>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <c:choose>
                            <c:when test="${screeningFinished}">
                                <c:if test="${hasErrors}">
                                    <tr>
                                        <td>Fatal Errors:</td>
                                    </tr>
    
                                    <c:forEach items="${errors}" var="errorItem">
                                        <tr>
                                            <td>
                                                <c:out value="${errorItem.code}"/>: <c:out value="${errorItem.response}"/>
                                                <ul>
                                                    <c:forEach items="${errorItem.text}" var="errorText">
                                                        <li>
                                                            <c:out value="${errorText}"/>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${hasWarnings}">
                                    <tr>
                                        <td>Warnings:</td>
                                    </tr>
    
                                    <c:forEach items="${warnings}" var="warningItem">
                                        <tr>
                                            <td>
                                                <c:out value="${warningItem.code}"/>: <c:out value="${warningItem.response}"/>
                                                <ul>
                                                    <c:forEach items="${warningItem.text}" var="warningText">
                                                        <li>
                                                            <c:out value="${warningText}"/>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${hasSuccess}">
                                    <tr>
                                        <td>Messages:</td>
                                    </tr>
    
                                    <c:forEach items="${success}" var="succesItem">
                                        <tr>
                                            <td>
                                                <c:out value="${succesItem.code}"/>: <c:out value="${succesItem.response}"/>
                                                <ul>
                                                    <c:forEach items="${succesItem.text}" var="succesText">
                                                        <li>
                                                            <c:out value="${succesText}"/>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td>
                                        Screening still in progress... 
                                        <br><br>
                                        The page should be automatically refreshed in 10 seconds, if it is not refreshed, please click 
                                        <A href="/tcs?module=ViewUploadResults&<%=Constants.SPECIFICATION_KEY%>=<%=request.getAttribute(Constants.SPECIFICATION_KEY)%>">here</a>.
                                    </TD>
                                </TR>
                            </c:otherwise>
                        </c:choose>
                    </table>
                </TD>
            </tr>
        </TABLE>
    </BODY>
</HTML>
