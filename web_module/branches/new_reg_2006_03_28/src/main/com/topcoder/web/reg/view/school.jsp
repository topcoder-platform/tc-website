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
</head>

<body>
<div align="center">
    <div style="width:250px;padding:15px;text-align:left;">

        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="registration_w"/>
            <jsp:param name="title" value="School Selection"/>
        </jsp:include>

        <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="schoolSearchForm">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SchoolSearch"/>

            <span class="subtitle">Search Criteria</span>
            <br><br>
            <strong>School Name:</strong><br>
            <c:set value="<%=Constants.SCHOOL_NAME%>" var="schoolName"/>
            <tc-webtag:errorIterator id="err" name="${schoolName}"><%=err%><br/></tc-webtag:errorIterator>
            <tc-webtag:textInput name="${schoolName}" size="36" maxlength="<%=Constants.MAX_SCHOOL_NAME_LENGTH%>" editable="true"/>
            <br><br>


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






<%--
            <strong>Country:</strong><br>
            <c:set value="<%=Constants.COUNTRY_CODE%>" var="countryCode"/>
            <tc-webtag:errorIterator id="err" name="${countryCode}"><%=err%><br/></tc-webtag:errorIterator>
            <tc-webtag:objectSelect name="${countryCode}" list="${countries}" valueField="code" textField="name"/>
            <br><br>
            <strong>State Code:</strong><br>
            <c:set value="<%=Constants.STATE_CODE%>" var="stateCode"/>
            <tc-webtag:errorIterator id="err" name="${stateCode}"><%=err%><br/></tc-webtag:errorIterator>
            <tc-webtag:textInput name="${stateCode}" size="2" maxlength="2" editable="true"/>
            <br><br>
            <strong>Province:</strong><br>
            <c:set value="<%=Constants.PROVINCE%>" var="province"/>
            <tc-webtag:errorIterator id="err" name="${province}"><%=err%><br/></tc-webtag:errorIterator>
            <tc-webtag:textInput name="${province}" size="36" maxlength="<%=Constants.MAX_PROVINCE_LENGTH%>" editable="true"/>
            <br><br>
            <strong>City:</strong><br>
            <c:set value="<%=Constants.CITY%>" var="city"/>
            <tc-webtag:errorIterator id="err" name="${city}"><%=err%><br/></tc-webtag:errorIterator>
            <tc-webtag:textInput name="${city}" size="36" maxlength="<%=Constants.MAX_CITY_LENGTH%>" editable="true"/>
            <br><br>

            <div align="center">
                <c:set value="<%=Constants.SCHOOL_TYPE%>" var="schoolType"/>
                School Type:
                <tc-webtag:errorIterator id="err" name="${schoolType}"><%=err%><br/></tc-webtag:errorIterator>
                <tc-webtag:objectSelect name="${schoolType}" list="${schoolTypes}" valueField="id" textField="description"/>
                <br><br>
            </div>
--%>
            <a href="Javascript:document.schoolSearchForm.submit();">Submit</a>
        </form>


    </div>
</div>
</body>
</html>
