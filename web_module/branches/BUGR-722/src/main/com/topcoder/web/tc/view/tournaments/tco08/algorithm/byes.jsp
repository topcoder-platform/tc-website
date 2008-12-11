<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>2008 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
    <jsp:include page="../../script.jsp" />
</head>
<body id="page_sub">

<div id="wrapper">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.ALGORITHM_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="advancers"/>
        <jsp:param name="tabLev3" value="qualification"/>
        </jsp:include>

        <h2>Advancers</h2>

<div align="center">
<table cellspacing="0" cellpadding="0" class="stat" style="width: 400px">
<thead>
    <tr>
        <th colspan="2">
        Algorithm Advancers - Byes
        </th>
    </tr>
    <tr>
        <th>
        Handle
        </th>
        <th>
        Rating
        </th>
    </tr>
</thead>
<tbody>

<!-- here comes the list of byes -->
<tr class="light"><td><tc-webtag:handle coderId="7267401" context="algorithm" /></td><td class="valueR"></td></tr>
    
</tbody>
</table>
</div>

    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>