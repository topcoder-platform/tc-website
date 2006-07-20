<%@ page import="com.topcoder.web.creative.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_creative"/>
    </jsp:include>
</head>

<body>

<jsp:include page="creativeTop.jsp">
    <jsp:param name="section" value="default"/>
</jsp:include>

<jsp:include page="creativeLeft.jsp">
    <jsp:param name="node" value="active_contests"/>
</jsp:include>

<div class="contentOuter">
    <div class="contentInner">

        <div class="linkBox"><A href="">discuss this</A></div>

        <div class="breadcrumb">
            <A href="${sessionInfo.servletPath}?module=Static&d1=activeContests">Active Contests</A> &gt; Contest Name
        </div>

        <h1>Submit Your Design</h1>

        <div align="center">
            <div align="left" style="width:500px;">
                Thank you for accepting the terms of the contest. Please use the form below to upload your submission:
                <br><br>
                The maximum file size per submission is 2MB.
                <br><br>

                <div align="center">
                    <form action="${sessionInfo.servletPath}" method="POST" name="submission" enctype="multipart/form-data">
                        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Submit"/>
                        <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>

                        <b>My design:</b><br><input type="file" name="<%=Constants.SUBMISSION%>">
                        <br><br>
                        <button name="submit" value="submit" type="submit">Submit</button>
                        <br><br>
                        <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.SUBMISSION%>">${err}
                            <br></tc-webtag:errorIterator></span>
                    </form>
                </div>

            </div>
        </div>

        <jsp:include page="creativeFoot.jsp"/>
    </div>
</div>
</body>
</html>
