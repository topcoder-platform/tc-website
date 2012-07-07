<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="nav.jsp" >
        <jsp:param name="tabLev1" value="overview"/>
        <jsp:param name="tabLev2" value=""/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

            <div id="pageBody">

                <h1><span>Register for the TCCC07</span></h1>

<div align="center" style="margin: 40px;">
<img src="/i/tournament/tccc07/forWhichCompetition.png" alt="For which competition would you like to register?" />
</div>

<%--
<p align="center" style="margin-bottom: 40px;">
<strong><A href="/tc?module=TCCC07ViewRegistration&et=6">Algorithm Competition</A></strong>
</p>
--%>
<p class="grayedOut" align="center" style="margin-bottom: 40px;">
<strong>Algorithm Competition</strong>
<br>Sorry, registration for this competition has closed.
</p>

<p align="center" style="margin-bottom: 40px;">
<strong><A href="/tc?module=TCCC07ViewRegistration&et=5">Component Design & Development Competition</A></strong>
</p>
<%--
<p class="grayedOut" align="center" style="margin-bottom: 40px;">
<strong>Component Design & Development Competition</strong>
<br>Sorry, registration for this competition has closed.
</p>
--%>

<%--
<p align="center" style="margin-bottom: 40px;">
<strong><A href="/tc?module=TCCC07ViewRegistration&et=9">Marathon Match Competition</A></strong>
</p>
--%>
<p class="grayedOut" align="center" style="margin-bottom: 40px;">
<strong>Marathon Match Competition</strong>
<br>Sorry, registration for this competition has closed.
</p>

<%--
<p align="center" style="margin-bottom: 40px;">
<strong><A href="/tc?module=TCCC07ViewRegistration&et=7">Studio Competition</A></strong>
</p>
--%>
<p class="grayedOut" align="center" style="margin-bottom: 40px;">
<strong>Studio Competition</strong>
<br>Sorry, registration for this competition has closed.
</p>

                <p style="height:300px;">&nbsp;</p>
            </div>
    </div>
    <jsp:include page="footer.jsp" />
    </div>
</div>
</body>
</html>
