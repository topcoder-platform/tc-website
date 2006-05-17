<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registration</title>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_main"/>
    </jsp:include>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
    <script language="javascript" type="text/javascript">
        <!--
            function submit() {
            //set the school name and id
                var selection = getSelectedOption("document.resultForm", "schoolSelection");
                if (selection) {
                    putValue("window.opener.document.secondaryForm", "<%=Constants.SCHOOL_ID%>", selection.value);
                    updateDivOrSpan(window.opener.document, "<%=Constants.SCHOOL_NAME%>", selection.text);
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
    <div style="width:250px;padding:15px;text-align:left;">

        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="registration_w"/>
            <jsp:param name="title" value="School Selection"/>
        </jsp:include>

        <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="schoolSearchForm" >
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SchoolSearch"/>

            <span class="subtitle">Search Criteria</span>
            <br/><br/>
            <strong>School Name:</strong><br>
            <c:set value="<%=Constants.SCHOOL_NAME%>" var="schoolName"/>
            <tc-webtag:errorIterator id="err" name="${schoolName}"><%=err%><br/></tc-webtag:errorIterator>
            <tc-webtag:textInput name="${schoolName}" size="36" maxlength="<%=Constants.MAX_SCHOOL_NAME_LENGTH%>" editable="true"/>
            <br/><br/>


            <span class="subtitle">Results</span>
            <br/><br/>
            Please select your school from list below and click Submit: <br/> Lists includes only the
            first <%=Constants.MAX_SCHOOL_RESULTS%> schools. If you see a duplicate, please choose the school with more
            associated students.
            <span id="submitMessage"></span>
        </form>
        <form action="" name="resultForm">
            <select name="schoolSelection" size="4">
                <c:forEach items="${results}" var="result">
                    <option value="${result[1].id}">${result[1].name} ${result[0]}</option>
                </c:forEach>
            </select>

            <div align="center">
                <a href="Javascript:submit();">Submit</a>
            </div>
        </form>

        <br/><br/>
        <strong>OR</strong>
        <br/><br/>
        If your school is not in the list above, you may search again, or click
        <A href="${sessionInfo.secureAbsoluteServletPath}?<%=Constants.MODULE_KEY%>=ViewSchoolAdd">here</A> to add
        your school.

    </div>
</div>
</body>
</html>
