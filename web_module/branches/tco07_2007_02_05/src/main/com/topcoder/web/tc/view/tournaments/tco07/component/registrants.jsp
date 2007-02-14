<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="../header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="component"/>
                    <jsp:param name="tabLev2" value="registrants"/>
                    <jsp:param name="tabLev3" value=""/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><div>Registrants</div></h1>

<div align="center">
<table cellpadding="0" cellspacing="0" class="stat" style="width:400px; margin-bottom: 100px;">
<thead>
    <tr><td class="title" colspan="4">Registrants: 1234</td></tr>
    <tr>
        <td class="header" width="100%">
            <a href="sorthandle">Handle</a>
        </td>
        <td class="headerR" nowrap="nowrap">
            <a href="sortrating">Design Rating</a>
        </td>
        <td class="headerR" nowrap="nowrap">
            <a href="sortrating">Development Rating</a>
        </td>
    </tr>
</thead>
<tbody>
        <%boolean even = false;%>
            <tr class="<%=(even ? "dark" : "light")%>">
                <td class="value">
                    <tc-webtag:handle coderId='251184' context="component" />
                </td>
                <td class="valueR">
                    1234
                </td>
                <td class="valueR">
                    1234
                </td>
            </tr>
        <%even = !even;%>
</tbody>
</table>
</div>

                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
