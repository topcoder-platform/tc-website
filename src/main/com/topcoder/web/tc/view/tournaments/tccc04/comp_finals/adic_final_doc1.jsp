<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="compDocs">
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <jsp:include page="../../../script.jsp" />
</head>

<body class="compDocs">

<h2 class="compDocs">2004 TCCC Component Finals - adic</h2>

<table border="0" cellspacing="0" cellpadding="0">
    <tr valign="top">
        <td width="190">
            <jsp:include page="adic_files.jsp">
                <jsp:param name="time" value="final" />
                <jsp:param name="doc" value="doc1" />
            </jsp:include>
        </td>

        <td width="99%">
            <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td colspan="2">
                        <jsp:include page="times.jsp">
                            <jsp:param name="member" value="adic" />
                            <jsp:param name="time" value="final" />
                        </jsp:include>
                    </td>
                </tr>

                <tr>
                    <td width="99%"><div class="compDocs"><img src="/i/tournament/tccc04/comp_files/adic/ClassDiagram1.gif" alt="" width="1953" height="1205" border="0"></div></td>
                    <td width="20"><img src="/i/clear.gif" alt="" width="20" height="20" border="0"></td>
                </tr>

                <tr valign="top">
                    <td colspan="2">
                        <jsp:include page="times.jsp">
                            <jsp:param name="member" value="adic" />
                            <jsp:param name="time" value="final" />
                        </jsp:include>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<p class="compCopyright">Copyright � 2001-2003, TopCoder, Inc. All rights reserved.</p>

</body>
</html>
