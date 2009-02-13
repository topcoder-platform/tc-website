<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
    <link type="text/css" rel="stylesheet" href="/css/main.css">
    <link type="text/css" rel="stylesheet" href="/css/stats.css">
    <script type="text/javascript" src="../js/popup.js"></script>

    <script type="text/javascript">
    </script>

    <style type="text/css">
    </style>

</head>

<body>

<div align="center">
    <div id="content">

        <jsp:include page="../top.jsp"/>

        <jsp:include page="../primaryNav.jsp">
            <jsp:param name="selectedTab" value="competitions"/>
        </jsp:include>

        <div id="main">
            <div class="pageHeader">
                <span class="pageName">Vote</span>
            </div>

            <div align="center" style="margin: 100px;">
                Thank you for voting.
            </div>

        </div>

        <jsp:include page="../foot.jsp"/>
    </div>
</div>

</body>
</html>