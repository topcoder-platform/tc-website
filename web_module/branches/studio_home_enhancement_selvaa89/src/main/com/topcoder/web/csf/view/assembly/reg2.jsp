<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.csf.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="csf.tld" prefix="csf" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="csf"/>
    </jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
</head>

<body>

<div align="center">
    <div id="content">

        <jsp:include page="../top.jsp"/>

        <jsp:include page="../primaryNav.jsp">
            <jsp:param name="selectedTab" value="competitions"/>
        </jsp:include>

        <div id="main">
<%--
            <div class="pageHeader">
                <span class="pageName">Register for This Competition</span>
            </div>

            <div class="breadcrumb">
                <A href="/?module=Static&amp;d1=competitions">Competitions</A>
                > <A href="/?module=Static&d1=assembly&d2=activeContests">Active Assembly Competitions</A>
                > British Telecom Workspace
            </div>

            <div align="center">

                Please read through the following terms:
                <br><br>

                <form name="terms" method="post" action="${sessionInfo.secureAbsoluteServletPath}">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AssemblyRegister"/>
                    <tc-webtag:hiddenInput name="<%=Constants.CONTEST_NAME%>" value="British Telecom Workspace Assembly Mashup Competition"/>


                    <iframe marginwidth="5" src="/?module=Static&d1=assembly&d2=terms2" height="300" width="590" style="margin-bottom: 10px;"></iframe>

                    <br style="clear: both;">

                    <button name="submit" value="submit" type="submit" class="button">Submit</button>
                    <br><br>


                </form>

            </div>
--%>

        </div>

        <jsp:include page="../foot.jsp"/>
    </div>
</div>

</body>
</html>