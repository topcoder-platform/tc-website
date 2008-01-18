<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2008 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
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
        <jsp:param name="tabLev3" value="qualification"/>
        </jsp:include>

            <div id="pageBody">
                        <h1><span>Advancers</span></h1>

<div align="center">
<table cellspacing="0" cellpadding="0" class="stat" style="width: 400px">
<thead>
    <tr>
        <td class="title" colspan="3">
        Algorithm Advancers - Byes
        </td>
    </tr>
    <tr>
        <td class="header">
        Handle
        </td>
        <td class="headerR">
        Rating
        </td>
    </tr>
</thead>
<tbody>

<!-- here comes the list of byes -->
<tr class="light"><td class="value"><tc-webtag:handle coderId="" context="algorithm" /></td><td class="valueR"></td></tr>
    
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