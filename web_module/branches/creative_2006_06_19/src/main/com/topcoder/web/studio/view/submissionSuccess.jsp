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
    <jsp:param name="node" value="active_contests"/>
</jsp:include>

<div class="contentOuter">
    <div class="contentInner">

        <div class="linkBox"><A href="">discuss this</A></div>

        <div class="breadcrumb">
            <A href="${sessionInfo.servletPath}?module=Static&d1=activeContests">Active Contests</A>
            > Contest Name
        </div>

        <h1>Submission Successfully Uploaded</h1>

        <div align="center">
            <div align="left" style="width:500px;">
                Your Submission Has Been Uploaded
                <br><br>
                Please allow 24 hours for processing. If your submission does not pass screening, you will receive an
                email with a list of any requirements that it failed to meet.
                <br><br>
                Thank you.
                <br><br>
            </div>
        </div>

        <jsp:include page="foot.jsp"/>
    </div>
</div>
</body>
</html>
