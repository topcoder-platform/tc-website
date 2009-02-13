<%@ page import="com.topcoder.web.csf.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>

    <title>TopCoder Studio</title>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
</head>

<body>

<div align="center">
<div id="contentOut" class="contentOut">
    <jsp:include page="../top.jsp">
        <jsp:param name="section" value="admin"/>
    </jsp:include>
    <jsp:include page="../topNav.jsp">
        <jsp:param name="node" value="contests"/>
    </jsp:include>
    <div id="contentIn" class="contentIn">
        <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

        <div class="contentSpacer">

            <h1>Create an Election</h1>

            <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="electionForm">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminCreateElection"/>
                <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
                <table class="stat" cellpadding="0" cellspacing="0" style="width:740px;">
                    <tbody>

                        <tr>
                            <td>
                                <tc-webtag:errorIterator id="err" name="<%=Constants.START_TIME%>">
                                    <span class="bigRed">${err}</span><br/></tc-webtag:errorIterator>
                            </td>
                        </tr>

                        <tr>
                            <td class="name" nowrap="nowrap">
                                Election Start<br>(Eastern Time):
                            </td>
                            <td class="value">
                                <tc-webtag:textInput name="<%=Constants.START_TIME%>" id="<%=Constants.START_TIME%>"/>
                                <button id="trigger<%=Constants.START_TIME%>">Set</button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <tc-webtag:errorIterator id="err" name="<%=Constants.END_TIME%>">
                                    <span class="bigRed">${err}<br/></span></tc-webtag:errorIterator>
                            </td>
                        </tr>
                        <tr>
                            <td class="name" nowrap="nowrap">
                                Election End<br>(Eastern Time):
                            </td>
                            <td class="value">
                                <tc-webtag:textInput name="<%=Constants.END_TIME%>" id="<%=Constants.END_TIME%>"/>
                                <button id="trigger<%=Constants.END_TIME%>">Set</button>
                            </td>
                        </tr>
                        <script language="javascript" type="text/javascript">
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
                        <tr>
                            <td colspan="2">
                                <tc-webtag:errorIterator id="err" name="<%=Constants.SUBMISSION_IDS%>">
                                    <span class="bigRed">${err}<br/></span></tc-webtag:errorIterator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <tc-webtag:objectSelect name="<%=Constants.SUBMISSION_IDS%>" list="${submissions}" size="10" multiple="true" valueField="id" textField="id"/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <button name="submit" value="submit" type="submit">Save</button>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </form>
        </div>
        <img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
    </div>
    <jsp:include page="../foot.jsp"/>
    <img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>
</html>