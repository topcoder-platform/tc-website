<%@ page import="com.topcoder.web.csf.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="csf.tld" prefix="csf" %>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="csf"/>
    </jsp:include>
</head>

<body>

<div align="center">
    <div id="content">

        <jsp:include page="top.jsp"/>

        <jsp:include page="primaryNav.jsp">
            <jsp:param name="selectedTab" value="competitions"/>
        </jsp:include>

        <div id="main">
            <div class="pageHeader">
                <span class="pageName">Register for This Competition</span>
            </div>

            <div class="linkBox">
                <csf:forumLink forumID="${contest.forumId}"/>
            </div>

            <div class="breadcrumb">
                <A href="/?module=Static&amp;d1=competitions">Competitions</A>
                > <A href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Creative Competitions</A>
                > ${contest.name}
            </div>

            <div align="center">
                Please read through the following terms and then click <strong>"I Agree"</strong> when you're done.
                <br><br>

                <form name="terms" method="POST" action="${sessionInfo.servletPath}">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Register"/>
                    <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>


                    <iframe width="590" height="300" marginWidth="5" src="${sessionInfo.servletPath}?module=Terms&amp;<%=Constants.TERMS_OF_USE_ID%>=<%=Constants.CONTEST_TERMS_OF_USE_ID%>"></iframe>

                    <br><br>
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>">${err}
                    <br/></tc-webtag:errorIterator></span>
                    <INPUT TYPE="checkbox" NAME="<%=Constants.TERMS_AGREE%>"/>I Agree
                    <br><br>
                    <%--<input type="image" src="/i/layout/btn_submit.gif" onmouseover="this.src='/i/layout/btn_submit_on.gif'" onmouseout="this.src='/i/layout/btn_submit.gif'">--%>
                    <BUTTON name="submit" value="submit" type="submit" class="button">Submit</BUTTON>
                    <br><br>


                </form>
            </div>


        </div>

        <jsp:include page="foot.jsp"/>
    </div>
</div>

</body>
</html>