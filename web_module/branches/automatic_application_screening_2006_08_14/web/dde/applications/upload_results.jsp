<%@ page language="java"
import="com.topcoder.dde.util.Constants,
        com.topcoder.apps.screening.ScreeningResponse" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<%
String filename = (String)request.getAttribute("file_nanme");
ScreeningResponse[] warnings = (ScreeningResponse[]) request.getAttribute("warnings");
ScreeningResponse[] errors = (ScreeningResponse[]) request.getAttribute("errors");
%>

<HTML>
    <HEAD>
        <!--META HTTP-EQUIV="Pragma" CONTENT="no-cache">
        <META HTTP-EQUIV="Expires" CONTENT="-1">
        <META HTTP-EQUIV="Refresh" CONTENT="10" -->
        <TITLE>Upload results</TITLE>
    </HEAD>
    <BODY>
        <TABLE WIDTH="100%" HEIGHT="100%">
            <TR>
                <TD>
                    Upload successful:
                    <br/>
                    <br/>
                    <%=filename%>
                </TD>
            </TR>
            <TR>
                <td align="center">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <c:choose>
                            <c:when test="${errors != null}">
                                <tr>
                                    <td>Fatal Errors:</td>
                                </tr>
                                <c:forEach items="${errors}" var="error">
                                    <tr>
                                        <td width="5%"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
                                        <td>
                                            <span>${error.code}: ${error.response}</span>
                                            <ul>
                                                <c:forEach items="${error.text}" var="texts">
                                                    <li>${texts}</li>
                                                </c:forEach>
                                            </ul>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td align="center">
                                        Screening... 
                                        <table border="0" cellpadding="0" cellspacing="4">
                                            <form name="upload_form" method="GET" action="/tcs">
                                                <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="ViewUploadResults"/>
                                                <input type="hidden" name="spec_id" value="<%=request.getAttribute("spec_id")%>"/>
                                                <input type="refresh" value="Upload">
                                            </form>
                                        </table>
                                    </TD>
                                </TR>
                            </c:otherwise>
                        </c:choose>

<!--
                            <c:when test="${warnings != null}">
                                <tr>
                                    <td width="5%"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
                                    <td>Warnings:</td>
                                </tr>
                                <logic:iterate id="warning" indexId="warningIdx" name="warnings">
                                    <tr>
                                        <td width="5%"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
                                        <td>
                                            <span><bean:write name="warning" property="code" />: <bean:write name="warning" property="response" /></span>
                                            <ul>
                                                <bean:define id="texts" name="warning" property="text" />
                                                <logic:iterate id="text" indexId="textIdx" name="texts">
                                                    <li><bean:write name="text" /></li>
                                                </logic:iterate>
                                            </ul>
                                        </td>
                                    </tr>
                                </logic:iterate>
                            </c:when>
-->

                    </table>
                </TD>
            </tr>
        </TABLE>
    </BODY>
</HTML>
