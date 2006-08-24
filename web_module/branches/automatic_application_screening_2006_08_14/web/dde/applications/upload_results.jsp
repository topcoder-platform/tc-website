<%@ page contentType="text/html; charset=ISO-8859-1"

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>
    <HEAD>
        <META HTTP-EQUIV="Refresh"
        CONTENT="5; URL=/tcs?module=ViewUploadResults&spec_id=<%=request.getAttribute("spec_id")%>">
             
        <TITLE>Upload results</TITLE>
    </HEAD>
    <BODY>
        <TABLE WIDTH="100%" HEIGHT="100%">
            <TR>
                <td>
                    File received, screening...
                    <br><A href="/tcs?module=ViewUploadResults&spec_id=<%=request.getAttribute("spec_id")%>">Go to screening results</a>
                </TD>
            </tr>
        </TABLE>
    </BODY>
</HTML>
