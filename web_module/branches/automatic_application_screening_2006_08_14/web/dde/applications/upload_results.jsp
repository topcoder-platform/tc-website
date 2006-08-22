<%@ page language="java"
import="com.topcoder.dde.util.Constants" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<%
String filename = (String)request.getAttribute("file_nanme");
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
                        <logic:present name="errors">
                            <tr>
                                <td>Fatal Errors:</td>
                            </tr>
                            <logic:iterate id="error" indexId="errorIdx" name="errors">
                                <tr>
                                    <td width="5%"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
                                    <td>
                                        <span><bean:write name="error" property="code" />: <bean:write name="error" property="response" /></span>
                                        <ul>
                                            <bean:define id="texts" name="error" property="text" />
                                            <logic:iterate id="text" indexId="textIdx" name="texts">
                                                <li><bean:write name="text" /></li>
                                            </logic:iterate>
                                        </ul>
                                    </td>
                                </tr>
                            </logic:iterate>
                        </logic:present>
                        <logic:present name="warnings">
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
                        </logic:present>
                    </TD>
                </table>
            </tr>
            <tr>
                <td align="center">
                    <table border="0" cellpadding="0" cellspacing="4">
                        <form name="upload_form" method="GET" action="/tcs">
                            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="ViewUploadResults"/>
                            <input type="hidden" name="spec_id" value="<%=request.getAttribute("spec_id")%>"/>
                        </form>
                    </table>
                </TD>
            </TR>
        </TABLE>
    </BODY>
</HTML>
