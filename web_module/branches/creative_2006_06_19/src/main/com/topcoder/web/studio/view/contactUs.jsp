<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio_old"/>
    </jsp:include>
</head>

<body>

<jsp:include page="top.jsp">
    <jsp:param name="section" value="default"/>
</jsp:include>

<jsp:include page="left.jsp">
    <jsp:param name="node" value="home"/>
</jsp:include>

<div class="contentOuter">
    <div class="contentInner">

        <h1>Contact Us</h1>
        <strong>Corporate Address</strong><br>
        TopCoder, Inc.<br>
        703 Hebron Avenue<br>
        Glastonbury, CT 06033 U.S.A.<br>
        tel: 860.633.5540<br>
        fax: 860.657.4276
        <br><br>
        <a href="mailto:sponsorship@topcoder.com" class="bodyText">Sponsorship and Private Label Events</a><br>
        Paul Moriarty<br>
        tel: 860.633.5540<br>
        fax: 860.657.4276<br>
        <br><br>
        <a href="mailto:jmckeown@topcoder.com" class="bodyText">Public Relations</a><br>
        Jim McKeown<br>
        tel: 860.633.5540<br>
        fax: 860.657.4276
        <br><br>
        <a href="mailto:jdamato@topcoder.com" class="bodyText">Events</a><br>
        Jessie D'Amato<br>
        tel: 860.633.5540<br>
        fax: 860.657.4276

        <jsp:include page="foot.jsp"/>
    </div>
</div>
</body>
</html>
