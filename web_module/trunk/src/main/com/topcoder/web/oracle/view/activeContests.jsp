<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Oracle</title>
</head>

<body>

<div align="center">
    <div id="content">

        <div id="main">
            <div class="pageHeader">
                <span class="pageName">Contests</span>
            </div>

            <table class="stat" cellpadding="0" cellspacing="0" style="width: 100%;">
                <tbody>
                    <tr>
                        <td class="title" colspan="7"><span class="title">Contests</span></td>
                    </tr>
                    <tr>
                        <td class="header">Name</td>
                        <td class="header">Status</td>
                    </tr>
                    <% boolean even = true;%>
                    <c:forEach items="${contests}" var="contest">
                        <tr class="<%=even?"light":"dark"%>">
                            <td class="value"><strong>${contest.name}</strong></td>
                            <td class="value">${contest.status.description}</td>
                        </tr>
                        <% even = !even;%>
                    </c:forEach>
                </tbody>
            </table>

        </div>

    </div>
</div>

</body>
</html>