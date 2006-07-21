<%@ page import="com.topcoder.web.creative.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Creative</title>
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_creative"/>
    </jsp:include>

</head>

<body>
<jsp:include page="../creativeTop.jsp">
    <jsp:param name="section" value="default"/>
</jsp:include>

<jsp:include page="adminLeft.jsp">
    <jsp:param name="node" value="home"/>
</jsp:include>

<div class="contentOuter">
    <div class="contentInner">

        <h1>Edit Contest Details</h1>

        <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="editForm">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminEditContest"/>
            <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
            <p>
                Contest Name: <tc-webtag:textInput name="<%=Constants.CONTEST_NAME%>"/>
            </p>

            <p>
                Contest Start: <tc-webtag:textInput name="<%=Constants.START_TIME%>" id="<%=Constants.START_TIME%>"/>
                <button id="trigger<%=Constants.START_TIME%>">Set</button>
            </p>

            <p>
                Contest End: <tc-webtag:textInput name="<%=Constants.END_TIME%>" id="<%=Constants.END_TIME%>"/>
                <button id="trigger<%=Constants.END_TIME%>">Set</button>
            </p>

            <script type="text/javascript">
                Calendar.setup(
                {
                    inputField  : "<%=Constants.START_TIME%>",         // ID of the input field
                    ifFormat    : "<%=Constants.JS_DATE_FORMAT%>",    // the date format
                    button      : "trigger<%=Constants.START_TIME%>",       // ID of the button
                    showsTime   : true,
                    singleClick  : false,
                    cache       : true
                }
                        );
                Calendar.setup(
                {
                    inputField  : "<%=Constants.END_TIME%>",         // ID of the input field
                    ifFormat    : "<%=Constants.JS_DATE_FORMAT%>",    // the date format
                    button      : "trigger<%=Constants.END_TIME%>",      // ID of the button
                    showsTime    : true,
                    singleClick  : false,
                    cache       : true
                }
                        );
            </script>

            <p>
                <button name="submit" value="submit" type="submit">Submit</button>
            </p>
        </form>

        <jsp:include page="../creativeFoot.jsp"/>
    </div>

</div>
</body>
</html>