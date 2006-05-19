<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Registration</title>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_reg"/>
    </jsp:include>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
    <script language="javascript" type="text/javascript">
        <!--
            function submit(name,id) {
            //set the school name and id
                var selection = getSelectedOption("document.resultForm", "schoolSelection");
                if (selection) {
                    putValue("window.opener.document.secondaryForm", "<%=Constants.SCHOOL_ID%>", id);
                    updateDivOrSpan(window.opener.document, "<%=Constants.SCHOOL_NAME%>", name);
                    window.close();
                } else {
                    alert("Please make a selection before submitting.");
                }
            }
        -->
    </script>
</head>

<body>
<div align="center">
    <div style="width:500px;padding:15px;text-align:left;">

        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="registration_w"/>
            <jsp:param name="title" value="School Search"/>
        </jsp:include>

        <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="schoolSearchForm">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SchoolSearch"/>

            <span class="subtitle">School Search</span>
            <br><br>

            <strong>School Name:</strong><br>
            <c:set value="<%=Constants.SCHOOL_NAME%>" var="schoolName"/>
            <tc-webtag:errorIterator id="err" name="${schoolName}"><%=err%><br></tc-webtag:errorIterator>
            <tc-webtag:textInput name="${schoolName}" size="50" maxlength="<%=Constants.MAX_SCHOOL_NAME_LENGTH%>" editable="true"/>
            <br>
            Use * for a wildcard character
            <br><br>
        </form>

        <c:if test="${results!=null}">
            <strong>Results</strong><br>
            Lists includes only up to the first <strong><%=Constants.MAX_SCHOOL_RESULTS%></strong> schools. If you see a
            duplicate, please choose the school with more
            associated students.
            <br><br>
            Please <strong>select</strong> your school from list below.
            <span id="submitMessage"></span>
            <span class="small">
                <c:forEach items="${results}" var="result">
                         ${result[1].name}<br />
                         ${result[1].address.city}, <c:if test="${result[1].address.state!=null}">${result[1].address.state.code},</c:if> <c:if test="${result[1].address.postalCode!=null}">${result[1].address.postalCode},</c:if> <c:if test="${result[1].address.province!=null}">${result[1].address.province},</c:if><br />
                         Registrants: ${result[0]}<br />
                         <A class="small" href="#" onclick="Javascript:submit(${results[1].name},${results[1].id});">Select</A>
                         <br /><br />
                </c:forEach>
            </span>
            <br><br>
            <strong>OR</strong><br>
            If your school is not in the list above, click
            <A href="${sessionInfo.secureAbsoluteServletPath}?<%=Constants.MODULE_KEY%>=ViewSchoolAdd">here</A> to add
            your school.
        </c:if>

    </div>
</div>
</body>
</html>
