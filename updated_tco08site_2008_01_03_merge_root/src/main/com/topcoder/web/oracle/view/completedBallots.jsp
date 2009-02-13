<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/oracle/main.css">
    <link type="text/css" rel="stylesheet" href="/css/oracle/stats.css">
    <style type="text/css">
        html {
            min-height: 100%;
            margin-bottom: 1px;
        }
    </style>
</head>

<body>

<div align="center">
    <div id="contentOut">
        <div id="contentIn">
            <div align="center" style="margin: 40px 0px 100px 0px;">

                    <ul id="selectedCandidates" class="imageLineup" style="margin: 0px; float: left;">

                        <c:forEach items="${results}" var="result">
                            <li>
                                ${result.room.name}
                            </li>
                        </c:forEach>

                    </ul>
            </div>


            <jsp:include page="foot.jsp"/>
        </div>
    </div>
</div>

</body>
</html>