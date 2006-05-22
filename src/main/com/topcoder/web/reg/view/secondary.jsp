<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="reg-tags" prefix="rt" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Registration</title>
    <jsp:include page="script.jsp"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_reg"/>
    </jsp:include>
</head>

<body>
<div align="center" style="padding:6px 0px 6px; 0px;">
    <A href="/"><img src="/i/registration/tc_logo.gif" alt="TopCoder" border="0"/></A>
</div>

<div align="center">
<div style="padding: 0px 10px 10px 10px; width: 600px; text-align: left;">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="registration_w"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div id="regBcContainer">
    <div class="regBc">
         <div class="title">
             <c:if test="${sessionInfo.loggedIn}">
                 <div style="float:right;"><A href="${sessionInfo.servletPath}?module=Logout" class="small">logout</A></div>
             </c:if>
         Step <strong>3</strong> of <strong>6</strong></div>
        <div class="off">Select Your Registration</div>
        <div class="off">General</div>
        <div class="on">Demographics</div>
        <div class="off">Confirm</div>
        <div class="off">Success</div>
        <div class="off">Activation</div>
    </div>
</div>

<form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="secondaryForm" <c:if test="${cf:contains(fields, resume)}">enctype="multipart/form-data"</c:if>>
<table cellpadding="0" cellspacing="0" border="0" class="regFields" width="400">
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
        <tr>
            <td colspan="2"><span class="bigRed">
                        <tc-webtag:errorIterator id="err" name="${demogPrefix}${assignment.question.id}">${err}
                            <br></tc-webtag:errorIterator></span>
            </td>
        </tr>
        <tr>
            <td class="name">
                <c:if test="${assignment.required}">
                    *
                </c:if>
                    ${assignment.question.text}
                :
            </td>
            <td class="value">
                <rt:demographicInput question="${assignment.question}"/>
                <c:if test="${assignment.question.description!=null}"><br/>
                    <span class="small">${assignment.question.description}</span></c:if>
            </td>
        </tr>
    </rt:questionIterator>
</c:if>


<c:if test="${cf:contains(fields, schoolName)}">
    <tr>
        <td colspan="2"><span class="bigRed">
        <tc-webtag:errorIterator id="err" name="${schoolCity}">${err}<br></tc-webtag:errorIterator>
        <tc-webtag:errorIterator id="err" name="${schoolProvince}">${err}<br></tc-webtag:errorIterator>
        <tc-webtag:errorIterator id="err" name="${schoolCountry}">${err}<br></tc-webtag:errorIterator>
        <tc-webtag:errorIterator id="err" name="${schoolState}">${err}<br></tc-webtag:errorIterator>
        <tc-webtag:errorIterator id="err" name="${schoolId}">${err}<br></tc-webtag:errorIterator>
        <tc-webtag:errorIterator id="err" name="${schoolVisible}">${err}<br></tc-webtag:errorIterator></span>
        </td>
    </tr>
    <tr>
        <td class="name">
            School:
        </td>
        <td class="value">
            <span id="schoolName"><tc-webtag:textInput name="${schoolName}" size="36" maxlength="<%=Constants.MAX_SCHOOL_NAME_LENGTH%>" editable="false"/></span>
                <%--School widget--%>
            <br><a href="Javascript:openWin('${sessionInfo.secureAbsoluteServletPath}?<%=Constants.MODULE_KEY%>=ViewSchoolSearch','school',600,500);">Choose School</a>
        </td>
    </tr>

    <c:if test="${cf:contains(fields, visibleSchool)}">
        <tr>
        <td class="name">
            Allow others to see my school:
        </td>
        <td class="value">
            <tc-webtag:chkBox name="${visibleSchool}"/>
        </td>
    </tr>
    </c:if>


</c:if>



<c:set value="<%=Constants.GPA%>" var="gpa"/>
<c:if test="${cf:contains(fields, gpa)}">
<tr>
    <td colspan="2"><span class="bigRed">
            <tc-webtag:errorIterator id="err" name="<%=Constants.GPA%>"><%=err%><br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td class="name">
        GPA:
    </td>
    <td class="value">
        <tc-webtag:textInput name="<%=Constants.GPA%>" size="4" maxlength="<%=Constants.MAX_GPA_LENGTH%>" editable="true"/>
    </td>
    </c:if>

    <c:set value="<%=Constants.GPA_SCALE%>" var="gpaScale"/>
    <c:if test="${cf:contains(fields, gpaScale)}">
    <tr>
        <td colspan="2"><span class="bigRed">
            <tc-webtag:errorIterator id="err" name="<%=Constants.GPA_SCALE%>"><%=err%><br>
            </tc-webtag:errorIterator></span>
        </td>
    </tr>
    <tr>
        <td class="name">
            GPA Scale:
        </td>
        <td class="value">
            <c:set value="<%=Constants.GPA_SCALES%>" var="scales"/>
            <tc-webtag:stringSelect name="${gpaScale}" list="${scales}"/>
        </td>
    </tr>
    </c:if>

    <%--Resume--%>
    <c:set value="<%=Constants.RESUME%>" var="resume"/>
    <c:if test="${cf:contains(fields, resume)}">
    <tr>
        <td colspan="2"><span class="bigRed">
            <tc-webtag:errorIterator id="err" name="${resume}"><%=err%><br></tc-webtag:errorIterator></span>
        </td>
    </tr>
    <tr>
        <td class="name">
            Resume:
        </td>
        <td class="value">
            <tc-webtag:textInput name="<%=Constants.FILE_NAME%>" editable="false"/>
            <input type="file" name="${resume}">
        </td>
    </tr>
    </c:if>
</table>

<br><br>

<div align="center">
    <a href="Javascript:document.secondaryForm.submit();">Submit</a>
</div>

</form>

</div>
</div>

<br><br>

</body>
</html>

