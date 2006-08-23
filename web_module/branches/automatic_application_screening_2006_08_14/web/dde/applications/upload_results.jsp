<%@ page contentType="text/html; charset=ISO-8859-1"
import="com.topcoder.dde.util.Constants,
        java.util.Iterator,
        java.util.List,
        com.topcoder.apps.screening.ScreeningResponse" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%
String filename = (String)request.getAttribute("file_nanme");
List errors = (List)request.getAttribute("errors");
List warnings = (List)request.getAttribute("warnings");
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
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <%
                            if ((errors != null && errors.size() > 0) || (warnings != null && warnings.size() > 0)) {
                        %>
                            <%
                                if (errors != null && errors.size() > 0) {
                            %>
                                <tr>
                                    <td>Fatal Errors: (<%=errors.size()%>)</td>
                                </tr>

                                <%
                                for (Iterator it = errors.iterator(); it.hasNext();) {
                                    ScreeningResponse errorItem = (ScreeningResponse) it.next();
                                %>
                                    <tr>
                                        <td>
                                            <%=errorItem.getCode()%>: <%=errorItem.getResponse()%>
                                            <ul>
                                                <%
                                                for (int i = 0; i < errorItem.getText().length; i++) {
                                                %>
                                                    <li><%=errorItem.getText()[i]%></li>
                                                <%
                                                }
                                                %>
                                            </ul>
                                        </td>
                                    </tr>
                                <%
                                }
                                %>
                            <%
                                }
                            %>
                            <%
                                if (warnings != null && warnings.size() > 0) {
                            %>
                                <tr>
                                    <td>Warnings: (<%=warnings.size()%>)</td>
                                </tr>

                                <%
                                for (Iterator it = warnings.iterator(); it.hasNext();) {
                                    ScreeningResponse errorItem = (ScreeningResponse) it.next();
                                %>
                                    <tr>
                                        <td>
                                            <%=errorItem.getCode()%>: <%=errorItem.getResponse()%>
                                            <ul>
                                                <%
                                                for (int i = 0; i < errorItem.getText().length; i++) {
                                                %>
                                                    <li><%=errorItem.getText()[i]%></li>
                                                <%
                                                }
                                                %>
                                            </ul>
                                        </td>
                                    </tr>
                                <%
                                }
                                %>
                            <%
                                }
                            %>                            
                        <%
                            } else {
                        %>
                            <TR>
                                <TD>
                                    Upload successful:
                                    <br/>
                                    <br/>
                                    <%=filename%>
                                </TD>
                            </TR>
                            <tr>
                                <td>
                                    Screening... 
                                    <table border="0" cellpadding="0" cellspacing="4">
                                        <form name="upload_form" method="GET" action="/tcs">
                                            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="ViewUploadResults"/>
                                            <input type="hidden" name="spec_id" value="<%=request.getAttribute("spec_id")%>"/>
                                            <input type="submit" value="refresh">
                                        </form>
                                    </table>
                                </TD>
                            </TR>
                        <%
                            }
                        %>                            
                    </table>
                </TD>
            </tr>
        </TABLE>
    </BODY>
</HTML>
