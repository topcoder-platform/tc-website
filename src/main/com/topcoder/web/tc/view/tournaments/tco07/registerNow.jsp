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

                    <jsp:include page="nav.jsp" >
                    <jsp:param name="tabLev1" value=""/>
                    <jsp:param name="tabLev2" value=""/>
                    <jsp:param name="tabLev3" value=""/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

<h1><span>Register Now!</span></h1>
<div align="center" style="margin: 10px 40px 40px 40px;">
<img src="/i/tournament/tco07/forWhichCompetition.png" alt="For which competition would you like to register?" />
</div>

<%--
<p align="center" style="margin-bottom: 40px;">
<strong><A href="/tc?module=TCO07ViewRegistration&amp;ct=algorithm">Algorithm Competition</A></strong>
</p>
--%>
<p class="grayedOut" align="center" style="margin-bottom: 40px;">
<strong>Algorithm Competition</strong>
<br>Sorry, registration for this competition has closed.
</p>

<%--
<p align="center" style="margin-bottom: 40px;">
<strong><A href="/tc?module=TCO07ViewRegistration&amp;ct=component">Component Design & Development Competition</A></strong>
</p>
--%>
<p class="grayedOut" align="center" style="margin-bottom: 40px;">
<strong>Component Design & Development Competition</strong>
<br>Sorry, registration for this competition has closed.
</p>

<%--
<p align="center" style="margin-bottom: 40px;">
<strong><A href="/tc?module=TCO07ViewRegistration&amp;ct=marathon">Marathon Match Competition</A></strong>
</p>
--%>
<p class="grayedOut" align="center" style="margin-bottom: 40px;">
<strong>Marathon Match Competition</strong>
<br>Sorry, registration for this competition has closed.
</p>

<%--
<p align="center" style="margin-bottom: 40px;">
<strong><A href="/tc?module=TCO07ViewRegistration&amp;ct=studio">Studio Competition</A></strong>
</p>
--%>
<p class="grayedOut" align="center" style="margin-bottom: 40px;">
<strong>Studio Competition</strong>
<br>Sorry, registration for this competition has closed.
</p>


                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="footer.jsp" />
    </div>
</div>

</body>

</html>
