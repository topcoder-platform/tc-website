<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder :: Education Platform</title>
    <meta http-equiv="content-type" 
        content="text/html;charset=utf-8" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
<%-- each school requires its own stylesheet, linked in here --%>
    <link type="text/css" rel="stylesheet" href="/css/ep/default.css" />
</head>

<body>
    <div style="margin: 10px;">
        <table cellpadding="4" cellspacing="0">
        <tbody>
            <tr>
                <td align="left">
                    <strong>Name</strong>
                </td>
                <td align="left">
                    Summers, Mark
                </td>
            </tr>
            <tr>
                <td align="left">
                    <strong>Assignment</strong>
                </td>
                <td align="left">
                    Week 1 assignment
                </td>
            </tr>
            <tr>
                <td align="left">
                    <strong>TC Score</strong>
                </td>
                <td align="left">
                    123
                </td>
            </tr>
            <tr>
                <td align="left">
                    <strong>Tests Passed</strong>
                </td>
                <td align="left">
                    10
                </td>
            </tr>
            <tr>
                <td align="left">
                    <strong>% Tests Passed</strong>
                </td>
                <td align="left">
                    80%
                </td>
            </tr>
            <tr>
                <td align="left">
                    <strong>Time</strong>
                </td>
                <td align="left">
                    00:12:34
                </td>
            </tr>
            <tr>
                <td align="left">
                    <strong>Status</strong>
                </td>
                <td align="left">
                    <%-- only include the <span> below if the status is "Finished" --%>
                    <span class="bigGreen">Finished</span>
                </td>
            </tr>
        </tbody>
        </table>

        Submission goes here.
    </div>
</body>
</html>