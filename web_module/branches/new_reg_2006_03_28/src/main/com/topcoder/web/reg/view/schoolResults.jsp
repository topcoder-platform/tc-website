<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registration</title>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_main"/>
    </jsp:include>
    <script type="text/javascript">
        function submit() {
            window.opener.document.secondaryForm.<%=Constants.SCHOOL_NAME%> =
            window.opener.document.secondaryForm.<%=Constants.SCHOOL_ID%> = document.resultForm.schoolSelection.s
        }
    </script>
</head>

<body>
<div align="center">
    <div style="width:250px;padding:15px;text-align:left;">

        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="registration_w"/>
            <jsp:param name="title" value="School Selection"/>
        </jsp:include>

        <span class="subtitle">Results</span>
        <br><br>
        Please select your school from list below and click Submit: <br/> Lists includes only the
        first <%=Constants.MAX_SCHOOL_RESULTS%> schools. If you see a duplicate, please choose the school with more
        associated students.
        <form name="resultForm">
            <select name="schoolSelection" size="4" multiple="multiple">
                <c:forEach items="${results}" var="result">
                    <option value="${result[1].id}">${result[1].name} ${result[0]}</option>
                </c:forEach>
            </select>

            <div align="center">
                <A href="">Submit</A>
            </div>
        </form>

        <br><br>
        <strong>OR</strong>
        <br><br>
        If your school is not in the list above, click <A href="">here</A> to add your school, and click <A
            href="${sessionInfo.secureAbsoluteServletPath}?<%=Constants.MODULE_KEY%>=ViewSchoolSearch">here</A> to go
        back and search again.
    </div>
</div>
</body>
</html>
