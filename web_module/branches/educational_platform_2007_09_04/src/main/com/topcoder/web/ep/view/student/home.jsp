<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Educational Platform</title>

    <script type="text/javascript">
        function submitEnter(e) {
            var keycode;
            if (window.event) keycode = window.event.keyCode;
            else if (e) keycode = e.which;
            else return true;
            if (keycode == 13) {
                document.frmLogin.submit();
                return false;
            } else return true;
        }
    </script>

</head>

<%
    String nextpage = (String) request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
    String message = (String) request.getAttribute("message");
    if (message == null) message = "";
%>


<body>
Hello, <tc-webtag:handle coderId='${user.id}'/>, Welcoome to Educational Plattform!
</br></br>
    <c:choose>
        <c:when test="${not empty activeClassrooms}">
            Here are your active classrooms:
            <c:forEach items="${activeClassrooms}" var="classroom">
                <a href="/ep?module=ViewClassroomDetails&amp;clsid=${classroom.id}">${classroom.name}</a>
            </c:forEach>
        </c:when>
        <c:otherwise>
            You don't have active classrooms associated.
        </c:otherwise>
    </c:choose>
    <br/>
    <c:choose>
        <c:when test="${not empty pendingClassrooms}">
            Here are your pending classrooms:
            <c:forEach items="${pendingClassrooms}" var="classroom">
                <a href="/ep?module=ViewClassroomDetails&amp;clsid=${classroom.id}">${classroom.name}</a>
            </c:forEach>
        </c:when>
        <c:otherwise>
            You don't have pending classrooms associated.
        </c:otherwise>
    </c:choose>
</body>
</html>