<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder FX</title>
    <link type="text/css" rel="stylesheet" href="/css/creative/main.css">
    <link type="text/css" rel="stylesheet" href="/css/creative/stats.css">
    <link type="text/css" rel="stylesheet" href="/css/creative/coders.css">
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

        <h1>Contest List</h1>

        <%-- without this div, the table inside stretches way outside the window, only in IE of course --%>
        <div class="tableHolder">
            <table class="stat" cellpadding="0" cellspacing="0" style="width:100%">
                <tbody>
                    <tr>
                        <td class="title" colspan="4">Contests</td>
                    </tr>
                    <tr>
                        <td class="header" colspan="4"><a href="">add</a></td>
                    </tr>
                    <tr>
                        <td class="header">Name</td>
                        <td class="headerC">Start</td>
                        <td class="headerC">End</td>
                        <td class="headerC"></td>
                    </tr>
                    <tr class="light">
                        <td class="value"></td>
                        <td class="valueC"></td>
                        <td class="valueC"></td>
                        <td class="valueC"><a href="">edit</a></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <jsp:include page="/creative_foot.jsp"/>
    </div>
</div>
</body>
</html>
