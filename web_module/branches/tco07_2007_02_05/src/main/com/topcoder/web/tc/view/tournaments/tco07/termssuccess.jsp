<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

<%--tabLev1 should be algorithm/component/marathon/studio--%>
                    <jsp:include page="nav.jsp" >
                    <jsp:param name="tabLev1" value="algorithm"/>
                    <jsp:param name="tabLev2" value="register"/>
                    <jsp:param name="tabLev3" value=""/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><div>Registration Successful</div></h1>

                    <div align="center" style="margin:40px;">
                    You have successfully registered for the<br><strong>2007 TopCoder&#174; Open Algorithm Competition</strong>.
<%--                    You have successfully registered for the<br><strong>2007 TopCoder&#174; Open Component Competition</strong>.--%>
<%--                    You have successfully registered for the<br><strong>2007 TopCoder&#174; Open Marathon Matches Competition</strong>.--%>
<%--                    You have successfully registered for the<br><strong>2007 TopCoder&#174; Open Studio Competition</strong>.--%>
                    </div>

                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="footer.jsp" />
    </div>
</div>

</body>

</html>
