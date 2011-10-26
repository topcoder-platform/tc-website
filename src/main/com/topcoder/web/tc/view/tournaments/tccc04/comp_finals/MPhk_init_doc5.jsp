<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="compDocs">
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <jsp:include page="../../../script.jsp" />
</head>

<body class="compDocs">

<h2 class="compDocs">2004 TCCC Component Finals - MPhk</h2>

<table border="0" cellspacing="0" cellpadding="0">
    <tr valign="top">
        <td width="190">
            <jsp:include page="MPhk_files.jsp">
                <jsp:param name="time" value="init" />
                <jsp:param name="doc" value="doc5" />
            </jsp:include>
        </td>

        <td width="99%">
            <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td colspan="2">
                        <jsp:include page="des_times.jsp">
                            <jsp:param name="member" value="MPhk" />
                            <jsp:param name="time" value="init" />
                        </jsp:include>
                    </td>
                </tr>

                <tr>
                    <td width="99%"><div class="compDocs"><img src="/i/tournament/tccc04/comp_docs/MPhk/diagrams/Catalog_Class_Diagram_Managers.gif" alt="" border="0"></div></td>
                    <td width="20"><img src="/i/clear.gif" alt="" width="20" height="20" border="0"></td>
                </tr>

                <tr valign="top">
                    <td colspan="2">
                        <jsp:include page="des_times.jsp">
                            <jsp:param name="member" value="MPhk" />
                            <jsp:param name="time" value="init" />
                        </jsp:include>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<p class="compCopyright">Copyright © 2001-2003, TopCoder, Inc. All rights reserved.</p>

</body>
</html>
