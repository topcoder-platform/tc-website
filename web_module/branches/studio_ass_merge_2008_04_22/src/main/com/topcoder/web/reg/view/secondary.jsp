<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.model.Referral" %>
<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="reg-tags" prefix="rt" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>TopCoder Registration</title>
    <jsp:include page="script.jsp"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_reg"/>
    </jsp:include>
    <c:set value="<%=Constants.REFERRAL%>" var="referral"/>
    <c:set value="<%=Constants.REFERRAL_CODER%>" var="referralCoder"/>
    <c:set value="<%=Constants.REFERRAL_OTHER%>" var="referralOther"/>
    <c:set value="<%=Constants.RESUME%>" var="resume"/>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
    <c:if test="${cf:contains(fields, referral)}">
        <script language="javascript" type="text/javascript">
            <!--
            function referralSelection() {
                //var selection = getSelectedOption('document.secondaryForm', '${referral}');
                var selection = getValue('document.secondaryForm', '${referral}');
                if (selection) {
                    if (selection == <%=Referral.MEMBER_REFERRAL.toString()%>) {
                        document.getElementById('${referralCoder}_div').style.display = 'block';
                        document.getElementById('${referralOther}_div').style.display = 'none';
                        putValue("document.secondaryForm", "${referralOther}", '');
                    } else if (selection == <%=Referral.DECLINE.toString()%>) {
                        putValue("document.secondaryForm", "${referralOther}", '');
                        putValue("document.secondaryForm", "${referralCoder}", '');
                        hide();
                    } else {
                        document.getElementById('${referralCoder}_div').style.display = 'none';
                        document.getElementById('${referralOther}_div').style.display = 'block';
                        putValue("document.secondaryForm", "${referralCoder}", '');

                    }
                } else {
                    hide();
                }
            }
            function hide() {
                document.getElementById('${referralCoder}_div').style.display = 'none';
                document.getElementById('${referralOther}_div').style.display = 'none';
            }

            // -->
        </script>
    </c:if>
    <script language="javascript" type="text/javascript">
        <!--
        function submitForm() {
            var resInput = document.secondaryForm.${resume};
            if (resInput) {
                var val = resInput.value;
            <%--
                we're doing this nastiness because of IE 6.  I would appear
                that there is a bug when you have a multipart form, being posted
                via https and the user does not select a file.  The request either
                dies client side, or spins indefinately.  This code will make it
                so that the form is not multipart when they are not submitting a resume.
            --%>
                if (val == null || trim(val) == "") {
                    document.secondaryForm.removeAttribute("enctype");
                    resInput.parentNode.removeChild(resInput);
                }
            }
            document.secondaryForm.submit();

        }
        // -->
    </script>

</head>

<body
        <c:if test="${cf:contains(fields, referral)}">onLoad="referralSelection()"</c:if>
        >

<div align="center" style="padding:6px 0px 6px; 0px;">
    <A href="http://<%=ApplicationServer.SERVER_NAME%>"><img src="/i/registration/tc_logo.gif" alt="TopCoder"
                                                             border="0"/></A>
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
                <div style="float:left;"><A href="${sessionInfo.servletPath}?module=Logout" class="small">logout</A>
                </div>
            </c:if>
            Step <strong>3</strong> of
            <c:choose>
                <c:when test="${isNewReg}">
                    <strong>6</strong>
                </c:when>
                <c:otherwise>
                    <strong>5</strong>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="off">Select Your Registration</div>

        <div class="off">General</div>

        <div class="on">Demographics</div>

        <div class="off">Confirm</div>

        <div class="off">Success</div>
        <c:if test="${isNewReg}">
            <div class="off">Activation</div>
        </c:if>
    </div>
</div>

<form action="${sessionInfo.secureAbsoluteServletPath}" name="secondaryForm"
        <c:if test="${cf:contains(fields, resume)}">enctype="multipart/form-data"</c:if> method="post">
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

<table cellpadding="0" cellspacing="0" border="0" class="regFields" style="width:400px; margin-right: 200px;">
<tbody>


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
                <c:if test="${assignment.question.description!=null}"><br>
                    <span class="small">${assignment.question.description}</span></c:if>
            </td>
        </tr>
    </rt:questionIterator>
</c:if>


<c:if test="${cf:contains(fields, schoolName)}">
    <tr>
        <td colspan="2"><span class="bigRed">
        <tc-webtag:errorIterator id="err" name="${schoolName}">${err}<br></tc-webtag:errorIterator>
            <tc-webtag:errorIterator id="err" name="${schoolCity}">${err}<br></tc-webtag:errorIterator>
            <tc-webtag:errorIterator id="err" name="${schoolProvince}">${err}<br></tc-webtag:errorIterator>
            <tc-webtag:errorIterator id="err" name="${schoolCountry}">${err}<br></tc-webtag:errorIterator>
            <tc-webtag:errorIterator id="err" name="${schoolState}">${err}<br></tc-webtag:errorIterator>
            <tc-webtag:errorIterator id="err" name="${schoolId}">${err}<br></tc-webtag:errorIterator>
        </td>
    </tr>
    <tr>
        <td class="name">
            <c:if test="${cf:contains(reqFields, schoolName)}">*</c:if>
            School:
        </td>
        <td class="value">
            <span id="schoolName"><tc-webtag:textInput name="${schoolName}" size="36"
                                                       maxlength="<%=Constants.MAX_SCHOOL_NAME_LENGTH%>"
                                                       editable="false"/></span>
                <%--School widget--%>
            <br>
            <a href="Javascript:openWin('${sessionInfo.secureAbsoluteServletPath}?<%=Constants.MODULE_KEY%>=ViewSchoolSearch','school',600,500);">Choose
                School</a>
        </td>
    </tr>
    <c:set value="<%=Constants.VISIBLE_SCHOOL%>" var="visibleSchool"/>
    <c:if test="${cf:contains(fields, visibleSchool)}">
        <tr>
            <td colspan="2"><span class="bigRed">
            <tc-webtag:errorIterator id="err" name="${visibleSchool}">${err}<br></tc-webtag:errorIterator></span>
            </td>
        </tr>
        <tr>
            <td class="name">
                <c:if test="${cf:contains(reqFields, visibleSchool)}">*</c:if>
                Show / hide my school:
            </td>
            <td class="value">
                <tc-webtag:radioButton name="${visibleSchool}" value="show"/>
                Show
                <br/>
                <tc-webtag:radioButton name="${visibleSchool}" value="hide"/>
                Hide
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
    <c:if test="${cf:contains(reqFields, gpa)}">*</c:if>
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
        <c:if test="${cf:contains(reqFields, gpaScale)}">*</c:if>
        GPA Scale:
    </td>
    <td class="value">
        <c:set value="<%=Constants.GPA_SCALES%>" var="scales"/>
        <tc-webtag:stringSelect name="${gpaScale}" list="${scales}"/>
    </td>
</tr>
</c:if>


<c:set value="<%=Constants.TITLE%>" var="title"/>
<c:if test="${cf:contains(fields, title)}">
<tr>
    <td colspan="2"><span class="bigRed">
            <tc-webtag:errorIterator id="err" name="${title}">${err}<br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td class="name">
        <c:if test="${cf:contains(reqFields, title)}">*</c:if>
        Job Title:
    </td>
    <td class="value">
        <tc-webtag:textInput name="${title}" size="15" maxlength="<%=Constants.MAX_TITLE_LENGTH%>" editable="true"/>
    </td>
</tr>
</c:if>

<c:set value="<%=Constants.COMPANY_NAME%>" var="companyName"/>
<c:if test="${cf:contains(fields, companyName)}">
<tr>
    <td colspan="2"><span class="bigRed">
            <tc-webtag:errorIterator id="err" name="<%=Constants.COMPANY_NAME%>"><%=err%><br>
            </tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td class="name">
        <c:if test="${cf:contains(reqFields, companyName)}">*</c:if>
        Company:
    </td>
    <td class="value">
        <tc-webtag:textInput name="<%=Constants.COMPANY_NAME%>" size="15" maxlength="<%=Constants.MAX_COMPANY_NAME_LENGTH%>" editable="true"/>
    </td>
</tr>
</c:if>


<%--Resume--%>
<c:if test="${cf:contains(fields, resume)}">
    <%--
    <tc-webtag:hiddenInput name="<%=Constants.FILE_NAME%>"/>
    --%>
<tr>
    <td colspan="2"><span class="bigRed">
            <tc-webtag:errorIterator id="err" name="${resume}"><%=err%><br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td class="name">
        <c:if test="${cf:contains(reqFields, resume)}">*</c:if>
        Resume:
    </td>
    <td class="value">
            <%--there should be only one--%>
        <c:forEach items="${regUser.coder.resumes}" var="res">
            <a href="${sessionInfo.servletPath}?module=DownloadResume" target="_blank">${res.fileName}</a>
        </c:forEach>
        <input type="file" name="${resume}">
    </td>
</tr>
</c:if>


<c:if test="${cf:contains(fields, referral)}">
<tr>
    <td colspan="2"><span class="bigRed">
            <tc-webtag:errorIterator id="err" name="${referral}"><%=err%><br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td class="name">
        <c:if test="${cf:contains(reqFields, referral)}">*</c:if>
        How did you hear<br>about TopCoder?:
    </td>
    <td class="value">
        <tc-webtag:objectSelect name="${referral}" list="${referrals}" valueField="id" textField="description" onChange="referralSelection()"/>

        <div id="${referralCoder}_div">
            <span class="bigRed">Referring member's handle:</span><br>
            <tc-webtag:textInput name="${referralCoder}" size="15" maxlength="<%=Constants.MAX_HANDLE_LENGTH%>" editable="true"/>
        </div>

        <div id="${referralOther}_div">
            <span class="bigRed">Details:</span><br>
            <tc-webtag:textInput name="${referralOther}" size="25" maxlength="<%=Constants.MAX_REFERRAL_OTHER_LENGTH%>" editable="true"/>
        </div>
    </td>
</tr>

</c:if>

</tbody>
</table>
* = required

<br><br>

<div align="center">
    <a href="javascript:void submitForm();">Submit</a>
</div>

</form>

</div>
</div>

<br><br>

</body>
</html>