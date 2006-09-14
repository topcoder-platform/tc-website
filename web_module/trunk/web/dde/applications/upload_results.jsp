<%@ page contentType="text/html; charset=ISO-8859-1"
import="com.topcoder.dde.util.Constants" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>
    <HEAD>
        <META HTTP-EQUIV="Refresh"
        CONTENT="2; URL=/tcs?module=ViewUploadResults&<%=Constants.SPECIFICATION_KEY%>=<%=request.getAttribute(Constants.SPECIFICATION_KEY)%>">
             
        <TITLE>Upload results</TITLE>
    </HEAD>
    <BODY>
        <TABLE WIDTH="100%" HEIGHT="100%">
            <TR>
                <td>
                    File received, redirecting to screening result page...
                    <br><br>Click <A href="/tcs?module=ViewUploadResults&<%=Constants.SPECIFICATION_KEY%>=<%=request.getAttribute(Constants.SPECIFICATION_KEY)%>">here</a> to go to the screening result page.
                </TD>
            </tr>
        </TABLE>
    </BODY>
</HTML>
