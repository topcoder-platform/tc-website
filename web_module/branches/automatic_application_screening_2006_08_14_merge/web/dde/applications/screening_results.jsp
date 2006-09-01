<%@ page contentType="text/html; charset=ISO-8859-1"
import="com.topcoder.dde.util.Constants,
        java.util.Iterator,
        java.util.List,
        com.topcoder.apps.screening.ScreeningResponse" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%
//List errors = (List)request.getAttribute("errors");
//List warnings = (List)request.getAttribute("warnings");
//List success = (List)request.getAttribute("success");
//boolean hasErrors = errors != null && errors.size() > 0;
//boolean hasWarnings = warnings != null && warnings.size() > 0;
//boolean hasSuccess = success != null && success.size() > 0;

//boolean screeningFinished = hasErrors | hasWarnings | hasSuccess;
%>

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
                        hola
                        <c:out value="${hasErrors}"/>
                        <c:out value="${hasWarnings}"/>
                        <c:out value="${hasSuccess}"/>
                        <c:out value="${screeningFinished}"/>
                            
                        chau
                        screeningFinished: ${screeningFinished}
                        hasErrors: ${hasErrors}

                        <c:choose>
                            <c:when test="${screeningFinished}">
                                <c:if test="${hasErrors}">
    
    
                                    <c:forEach items="${errors}" var="errorItem">
                                        <tr>
                                            <td>
                                                <c:out value="${errorItem.code}"/>: <c:out value="${errorItem.response}"/>

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
