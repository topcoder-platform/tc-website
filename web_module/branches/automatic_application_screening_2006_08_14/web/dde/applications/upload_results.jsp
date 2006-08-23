<%@ page contentType="text/html; charset=ISO-8859-1"
import="com.topcoder.dde.util.Constants,
        com.topcoder.apps.screening.ScreeningResponse" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%
String filename = (String)request.getAttribute("file_nanme");
List errors = (List)request.getAttribute("errors");
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
                                                for (Iterator it2 = errors.getText().iterator(); it2.hasNext();) {
                                                    String texts = (String) it2.next();
                                                %>
                                                    <li><%=texts%></li>
                                                <%
                                                }
                                                %>
                                            </ul>
                                        </td>
                                    </tr>
                                <%
                                }
                                %>

                                <tr>
                                    <td align="center">
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
                    </table>
                </TD>
            </tr>
        </TABLE>
    </BODY>
</HTML>
