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
    <jsp:param name="node" value="home"/>
</jsp:include>

<div class="contentOuter">
    <div class="contentInner">

        <div class="linkBox"><A href="">discuss this</A></div>

        <div class="breadcrumb">
            <A href="${sessionInfo.servletPath}?module=Static&d1=activeContests">Active Contests</A>
            > Contest Name
        </div>

        <h1>Contest Registration</h1>

        <div align="center">
            Please read through the following terms and then click <strong>"I Accept"</strong> when you're done.
            <br><br>

            <form name="terms" method="POST" action="${sessionInfo.servletPath}">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Register"/>
                <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>


                <iframe width="590" height="300" marginWidth="5" src="${sessionInfo.servletPath}?module=Terms&amp;<%=Constants.TERMS_OF_USE_ID%>=<%=Constants.CONTEST_TERMS_OF_USE_ID%>"></iframe>

                <br><br>
                <!-- could also use <input>'s button <button> gives you more display freedom and is documented on w3c -->
                <!-- resulting page from click has value at the end of the URL, which is pointless.  Feel free to use any html/js element/method but i want the nice looking button -->
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>">${err}
                    <br/></tc-webtag:errorIterator></span>
                <INPUT TYPE="checkbox" NAME="<%=Constants.TERMS_AGREE%>"/>I agree
                <br><br>
                <button name="submit" value="submit" type="submit">Submit</button>
                <br><br>


            </form>
        </div>

        <jsp:include page="creativeFoot.jsp"/>
    </div>
</div>
</body>
</html>
