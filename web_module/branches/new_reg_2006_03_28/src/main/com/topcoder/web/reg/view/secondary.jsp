<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags" prefix="tc-webtag" %>
<%@ taglib uri="reg-tags" prefix="rt" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registration</title>
    <jsp:include page="script.jsp"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_main"/>
    </jsp:include>
</head>

<body>

<form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="secondaryForm" enctype="multipart/form-data">
    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Confirm"/>

    <c:set value="<%=Constants.SCHOOL_NAME%>" var="schoolName"/>
    <c:if test="${cf:contains(fields, schoolName)}">
        <tc-webtag:hiddenInput name="${schoolName}"/>
    </c:if>
    <c:set value="<%=Constants.SCHOOL_CITY%>" var="schoolCity"/>
    <c:if test="${cf:contains(fields, schoolCity)}">
        <tc-webtag:hiddenInput name="${schoolCity}"/>
    </c:if>
    <c:set value="<%=Constants.SCHOOL_PROVINCE%>" var="schoolProvince"/>
    <c:if test="${cf:contains(fields, schoolProvince)}">
        <tc-webtag:hiddenInput name="${schoolProvince}"/>
    </c:if>
    <c:set value="<%=Constants.SCHOOL_COUNTRY%>" var="schoolCountry"/>
    <c:if test="${cf:contains(fields, schoolCountry)}">
        <tc-webtag:hiddenInput name="${schoolCountry}"/>
    </c:if>
    <c:set value="<%=Constants.SCHOOL_STATE%>" var="schoolState"/>
    <c:if test="${cf:contains(fields, schoolState)}">
        <tc-webtag:hiddenInput name="${schoolState}"/>
    </c:if>
    <c:set value="<%=Constants.SCHOOL_ID%>" var="schoolId"/>
    <c:if test="${cf:contains(fields, schoolId)}">
        <tc-webtag:hiddenInput name="${schoolId}"/>
    </c:if>
    <c:set value="<%=Constants.SCHOOL_TYPE%>" var="schoolType"/>
    <c:if test="${cf:contains(fields, schoolType)}">
        <tc-webtag:hiddenInput name="${schoolType}"/>
    </c:if>
    <c:set value="<%=Constants.VISIBLE_SCHOOL%>" var="schoolVisible"/>
    <c:if test="${cf:contains(fields, schoolVisible)}">
        <tc-webtag:hiddenInput name="${schoolVisible}"/>
    </c:if>


    <%--Demographics--%>
    <c:set value="<%=Constants.DEMOG_PREFIX%>" var="demogPrefix"/>
    <c:if test="${cf:contains(fields, demogPrefix)}">
        <rt:questionIterator id="assignment" list="${demographicAssignments}">
            <p>
                <tc-webtag:errorIterator id="err" name="${demogPrefix}${assignment.question.id}">${err}
                    <br/></tc-webtag:errorIterator>
            </p>

            <p>
                <c:if test="${assignment.required}">
                    *
                </c:if>
                    ${assignment.question.text}
                :
                <rt:demographicInput question="${assignment.question}"/>

            </p>
        </rt:questionIterator>
    </c:if>


    <c:if test="${cf:contains(fields, schoolName)}">
        <tc-webtag:errorIterator id="err" name="${schoolCity}">${err}<br/></tc-webtag:errorIterator>
        <tc-webtag:errorIterator id="err" name="${schoolProvince}">${err}<br/></tc-webtag:errorIterator>
        <tc-webtag:errorIterator id="err" name="${schoolCountry}">${err}<br/></tc-webtag:errorIterator>
        <tc-webtag:errorIterator id="err" name="${schoolState}">${err}<br/></tc-webtag:errorIterator>
        <tc-webtag:errorIterator id="err" name="${schoolId}">${err}<br/></tc-webtag:errorIterator>
        <tc-webtag:errorIterator id="err" name="${schoolVisible}">${err}<br/></tc-webtag:errorIterator>

        School: <tc-webtag:textInput name="${schoolName}" size="36" maxlength="<%=Constants.MAX_SCHOOL_NAME_LENGTH%>" editable="false"/>
        <%--School widget--%>
        <p><a href="Javascript:openWin('${sessionInfo.secureAbsoluteServletPath}?<%=Constants.MODULE_KEY%>=ViewSchoolSearch','school',350,450);">Choose School</a></p>
    </c:if>



    <c:set value="<%=Constants.GPA%>" var="gpa"/>
    <c:if test="${cf:contains(fields, gpa)}">
        <p>
            <tc-webtag:errorIterator id="err" name="<%=Constants.GPA%>"><%=err%><br/></tc-webtag:errorIterator>
        </p>

        <p>
            GPA:
            <tc-webtag:textInput name="<%=Constants.GPA%>" size="4" maxlength="<%=Constants.MAX_GPA_LENGTH%>" editable="true"/>
        </p>
    </c:if>

    <c:set value="<%=Constants.GPA_SCALE%>" var="gpaScale"/>
    <c:if test="${cf:contains(fields, gpaScale)}">
        <p>
            <tc-webtag:errorIterator id="err" name="<%=Constants.GPA_SCALE%>"><%=err%><br/></tc-webtag:errorIterator>
        </p>

        <p>
            GPA Scale:
            <SELECT NAME="<%=Constants.GPA_SCALE%>">
                <c:set value="<%=Constants.GPA_SCALES%>" var="scales"/>
                <OPTION value=""></OPTION>
                <c:forEach items="${scales}" var="scale">
                    <OPTION value="${scale}" <c:if test="${regUser.coder.currentSchool.GPAScale==scale}">selected="true"</c:if>>${scale}</OPTION>
                </c:forEach>
            </SELECT>
        </p>
    </c:if>

    <%--Resume--%>
    <c:set value="<%=Constants.RESUME%>" var="resume"/>
    <c:if test="${cf:contains(fields, resume)}">
        <p>
            <tc-webtag:errorIterator id="err" name="${resume}"><%=err%><br/></tc-webtag:errorIterator>
        </p>

        <p>
            Resume: <tc-webtag:textInput name="<%=Constants.RESUME%>" editable="false"/>
            <input type="file" name="${resume}">

        </p>
    </c:if>


    <a href="Javascript:document.secondaryForm.submit();">Submit</a>

</form>

</body>
</html>

