<%@ page contentType="text/html; charset=ISO-8859-1"
import="com.topcoder.dde.util.Constants,
        java.util.Iterator,
        java.util.List,
        com.topcoder.apps.screening.ScreeningResponse" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%
List errors = (List)request.getAttribute("errors");
List warnings = (List)request.getAttribute("warnings");
List success = (List)request.getAttribute("success");
boolean hasErrors = errors != null && errors.size() > 0;
boolean hasWarnings = warnings != null && warnings.size() > 0;
boolean hasSuccess = success != null && success.size() > 0;

boolean screeningFinished = hasErrors | hasWarnings | hasSuccess;
%>

<HTML>
    <HEAD>
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
                        hola
                        screeningFinished: ${screeningFinished} / <%=screeningFinished%>
                        hasErrors: ${hasErrors} / <%=hasErrors%>
                        
                        <c:choose>
                            <c:when test="${screeningFinished}">
                                <c:if test="${hasErrors}">
                                    <tr>
                                        <td>Fatal Errors: (<%=errors.size()%>)</td>
                                    </tr>
    
    
                                    <c:forEach items="${errors}" var="errorItem">
                                        <tr>
                                            <td>
                                                <c:out value="${errorItem.code}"/>: <c:out value="${errorItem.response}"/>
                                                <ul>
                                                    <c:forEach items="${errorItem.text}" var="errorText">
                                                        <c:out value="${errorText}"/>
                                                    </c:forEach>
                                                </ul>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${hasWarnings}">
                                    <tr>
                                        <td>Warnings: (<%=warnings.size()%>)</td>
                                    </tr>
    
                                    <%for (Iterator it = warnings.iterator(); it.hasNext();) {
                                        ScreeningResponse errorItem = (ScreeningResponse) it.next();%>
                                        <tr>
                                            <td>
                                                <%=errorItem.getCode()%>: <%=errorItem.getResponse()%>
                                                <ul>
                                                    <%for (int i = 0; i < errorItem.getText().length; i++) {%>
                                                        <li><%=errorItem.getText()[i]%></li>
                                                    <%}%>
                                                </ul>
                                            </td>
                                        </tr>
                                    <%}%>
                                </c:if>
                                <c:if test="${hasSuccess}">
                                    <tr>
                                        <td>Messages: (<%=success.size()%>)</td>
                                    </tr>
    
                                    <%for (Iterator it = success.iterator(); it.hasNext();) {
                                        ScreeningResponse successItem = (ScreeningResponse) it.next();%>
                                        <tr>
                                            <td>
                                                <%=successItem.getCode()%>: <%=successItem.getResponse()%>
                                                <ul>
                                                    <%for (int i = 0; i < successItem.getText().length; i++) {%>
                                                        <li><%=successItem.getText()[i]%></li>
                                                    <%}%>
                                                </ul>
                                            </td>
                                        </tr>
                                    <%}%>
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
