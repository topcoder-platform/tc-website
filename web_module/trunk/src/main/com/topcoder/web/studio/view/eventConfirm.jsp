<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
</head>

<body>

<div align="center">
    <div id="contentOut" class="contentOut">
        <jsp:include page="top.jsp"/>
        <jsp:include page="topNav.jsp">
            <jsp:param name="node" value="contests"/>
        </jsp:include>
        <div id="contentIn" class="contentIn">
            <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

            <div class="contentSpacer">

                <div class="linkBox">
                    <studio:forumLink forumID="${contest.forumId}"/>
                </div>

                <div class="breadcrumb">
                    <a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</a>
                    &gt; ${contest.name}
                </div>

                <h1>Contest Registration</h1>

                <div align="center">


                    <strong>Are you sure you want to register for this contest?</strong>
                    <br /><br />
                    Please be aware that you are NOT REGISTERED for the tournament that this contest is part of.
                    Registering for this contest will not register you for the tournament.
                    If you don't register for the tournament prior to registering for this contest,
                    it will not count in the tournament standings even if you sign up at a later date.
                    <br /><br />

                    <form name="terms" method="POST" action="${sessionInfo.servletPath}">
                        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Register"/>
                        <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
                        <tc-webtag:hiddenInput name="<%=Constants.REG_CONFIRM%>"/>
                        <tc-webtag:hiddenInput name="<%=Constants.TERMS_AGREE%>" value="on"/>


                        <br /><br />
                        <a href="#" onclick="document.terms.submit()">Yes, register for this contest anyway</a>

                    </form>
                </div>

            </div>
            <img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>
        <jsp:include page="foot.jsp"/>
        <img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>