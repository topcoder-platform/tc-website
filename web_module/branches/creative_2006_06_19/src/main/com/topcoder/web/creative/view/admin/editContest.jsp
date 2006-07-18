<%@ page import="com.topcoder.web.creative.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Creative</title>
    <link type="text/css" rel="stylesheet" href="/css/creative/jscal/calendar-win2k-1.css">
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>
</head>

<body>
<div>
    <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="editForm">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminSubmitEditContest"/>
        <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
        <p>
            <tc-webtag:textInput name="<%=Constants.CONTEST_NAME%>"/>
        </p>

        <p>
            <tc-webtag:textInput name="<%=Constants.START_TIME%>" id="<%=Constants.START_TIME%>"/>
            <button id="trigger<%=Constants.START_TIME%>">Start</button>
        </p>

        <p>
            <tc-webtag:textInput name="<%=Constants.END_TIME%>" id="<%=Constants.END_TIME%>"/>
            <button id="trigger<%=Constants.END_TIME%>">End</button>
        </p>

        <script type="text/javascript">
            Calendar.setup(
            {
                inputField  : "<%=Constants.START_TIME%>",         // ID of the input field
                ifFormat    : "<%=Constants.JS_DATE_FORMAT%>",    // the date format
                button      : "trigger<%=Constants.START_TIME%>",       // ID of the button
                showsTime   : true,
                cache       : true
            }
                    );
            Calendar.setup(
            {
                inputField  : "<%=Constants.END_TIME%>",         // ID of the input field
                ifFormat    : "<%=Constants.JS_DATE_FORMAT%>",    // the date format
                button      : "trigger<%=Constants.END_TIME%>",      // ID of the button
                showsTime    : true,
                cache       : true
            }
                    );
        </script>
    </form>

</div>
</body>
</html>