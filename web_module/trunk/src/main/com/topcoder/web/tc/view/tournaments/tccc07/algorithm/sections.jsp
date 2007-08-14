<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.ALGORITHM_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="advancers"/>
        <jsp:param name="tabLev3" value="sections"/>
        </jsp:include>

            <div id="pageBody">

                        <h1><span>Sections</span></h1>

<div align="center">

<p align="center">
Section A
| <A href="">Section B</A>
| <A href="">Section C</A>
</p>

<table cellspacing="0" cellpadding="0" class="stat" style="width: 400px">
<thead>
    <tr>
        <td class="title" colspan="3">
        Sections
        </td>
    </tr>
    <tr>
        <td class="headerC">
        Seed
        </td>
        <td class="header" width="100%">
        Handle
        </td>
        <td class="headerR">
        Rating
        </td>
    </tr>
</thead>
<tbody>
<%boolean even = false;%>
<tr class="<%=(even ? "dark" : "light")%>">
<td class='valueC'>1</td>
<td class='value'><tc-webtag:handle coderId='144400' context='algorithm'/></td>
<td class='valueR'>3468</td>
</tr>
<%even = !even;%>
<tr class="<%=(even ? "dark" : "light")%>">
<td class='valueC'>1</td>
<td class='value'><tc-webtag:handle coderId='144400' context='algorithm'/></td>
<td class='valueR'>3468</td>
</tr>
<%even = !even;%>
</tbody>
</table>
</div>

            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>