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

<form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="secondaryForm">
    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Confirm"/>


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


    <%--School widget--%>
    <p><a href="Javascript:openWin('school.jsp','school',350,450);">school</a></p>

    <%--Resume--%>


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

        <c:set value="<%=Constants.USER%>" var="user"/>
        <p>
            GPA Scale:
            <SELECT NAME="<%=Constants.GPA_SCALE%>">
                <OPTION value=""></OPTION>
                <c:choose>
                    <c:when test="${regUser.coder.currentSchool.gpaScale==4}"><OPTION value="4.00" selected="true">4.00</OPTION></c:when>
                    <c:otherwise><OPTION value="4.00">4.00</OPTION></c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${regUser.coder.currentSchool.gpaScale==5}"><OPTION value="5.00" selected="true">5.00</OPTION></c:when>
                    <c:otherwise><OPTION value="5.00">5.00</OPTION></c:otherwise>
                </c:choose>
            </SELECT>
        </p>
    </c:if>


    <a href="Javascript:document.secondaryForm.submit();">Submit</a>

</form>

</body>
</html>

