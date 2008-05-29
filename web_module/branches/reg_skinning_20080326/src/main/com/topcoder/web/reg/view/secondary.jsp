<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.model.Referral" %>
<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="reg-tags" prefix="rt" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib prefix="reg_tags" tagdir="/WEB-INF/tags" %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Registration</title>
    <jsp:include page="script.jsp"/>
    <reg_tags:style/>
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
        <c:if test="${cf:contains(fields, referral)}">onload="referralSelection()"</c:if>
        >

<%-- THE align="center" IS REQUIRED TO EVER CENTER IT, BUT THAT CAN BE OVERRULED TO LEFT OR RIGHT WITH CSS --%>
<div id="pageBranding" align="center">
    <a href="http://<%=ApplicationServer.SERVER_NAME%>">&nbsp;</a>
</div>

<div id="pageAligner" align="center">
    <div id="pageSpacer">
    
    <div id="pageTitle"><div>&nbsp;</div></div>

        <c:choose>
        <c:when test="${!sessionInfo.loggedIn}">
            <div id="topMessage" class="small" align="center">
                (<a href="/reg/?nrg=false">Click here</a> if you're already a registered member and would like to update
                your profile.)
            </div>
        </c:when>
        <c:otherwise>
            <div id="logoutLink" class="small" align="center">
                <a href="${sessionInfo.servletPath}?module=Logout">Log out</a>
            </div>
        </c:otherwise>
        </c:choose>

<div id="regBcContainer">
    <div class="regBc">
        <div class="title">
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

<div class="regSection">
    Demographics Information
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

<table cellpadding="0" cellspacing="0" border="0" class="regFields">
<tbody>
<%int i = 0;%>

<%--Demographics--%>
<c:set value="<%=Constants.DEMOG_PREFIX%>" var="demogPrefix"/>
<c:if test="${cf:contains(fields, demogPrefix)}">
    <rt:questionIterator id="assignment" list="${demographicAssignments}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
                        <tc-webtag:errorIterator id="err" name="${demogPrefix}${assignment.question.id}">${err}
                            <br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${assignment.required}">
                    *
                </c:if>
                    ${assignment.question.text}
                :
            </td>
            <td class="value">
                <rt:demographicInput question="${assignment.question}"/>
                <c:if test="${assignment.question.description!=null}"><br />
                    <span class="small">${assignment.question.description}</span></c:if>
            </td>
        </tr>
        <%i++;%>
    </rt:questionIterator>
</c:if>


<c:if test="${cf:contains(fields, schoolName)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="${schoolName}">${err}<br /></tc-webtag:errorIterator>
            <tc-webtag:errorIterator id="err" name="${schoolCity}">${err}<br /></tc-webtag:errorIterator>
            <tc-webtag:errorIterator id="err" name="${schoolProvince}">${err}<br /></tc-webtag:errorIterator>
            <tc-webtag:errorIterator id="err" name="${schoolCountry}">${err}<br /></tc-webtag:errorIterator>
            <tc-webtag:errorIterator id="err" name="${schoolState}">${err}<br /></tc-webtag:errorIterator>
            <tc-webtag:errorIterator id="err" name="${schoolId}">${err}<br /></tc-webtag:errorIterator>
        </td>
    </tr>
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            <c:if test="${cf:contains(reqFields, schoolName)}">*</c:if>
            School:
        </td>
        <td class="value">
            <span id="schoolName"><tc-webtag:textInput name="${schoolName}" size="36"
                                                       maxlength="<%=Constants.MAX_SCHOOL_NAME_LENGTH%>"
                                                       editable="false"/></span>
                <%--School widget--%>
            <br />
            <a href="Javascript:openWin('${sessionInfo.secureAbsoluteServletPath}?<%=Constants.MODULE_KEY%>=ViewSchoolSearch','school',600,560);">Choose
                School</a>
        </td>
    </tr>
        <%i++;%>
    <c:set value="<%=Constants.VISIBLE_SCHOOL%>" var="visibleSchool"/>
    <c:if test="${cf:contains(fields, visibleSchool)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="${visibleSchool}">${err}<br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, visibleSchool)}">*</c:if>
                Show / hide my school:
            </td>
            <td class="value">
                <tc-webtag:radioButton name="${visibleSchool}" value="show"/>
                Show
                <br />
                <tc-webtag:radioButton name="${visibleSchool}" value="hide"/>
                Hide
            </td>
        </tr>
        <%i++;%>
    </c:if>


</c:if>


<c:set value="<%=Constants.GPA%>" var="gpa"/>
<c:if test="${cf:contains(fields, gpa)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
                <tc-webtag:errorIterator id="err" name="<%=Constants.GPA%>"><%=err%><br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, gpa)}">*</c:if>
                GPA:
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.GPA%>" size="4" maxlength="<%=Constants.MAX_GPA_LENGTH%>" editable="true"/>
            </td>
        </tr>
        <%i++;%>
</c:if>

<c:set value="<%=Constants.GPA_SCALE%>" var="gpaScale"/>
<c:if test="${cf:contains(fields, gpaScale)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
                <tc-webtag:errorIterator id="err" name="<%=Constants.GPA_SCALE%>"><%=err%><br />
                </tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, gpaScale)}">*</c:if>
                GPA Scale:
            </td>
            <td class="value">
                <c:set value="<%=Constants.GPA_SCALES%>" var="scales"/>
                <tc-webtag:stringSelect name="${gpaScale}" list="${scales}"/>
            </td>
        </tr>
        <%i++;%>
</c:if>


<c:set value="<%=Constants.TITLE%>" var="title"/>
<c:if test="${cf:contains(fields, title)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
                <tc-webtag:errorIterator id="err" name="${title}">${err}<br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, title)}">*</c:if>
                Title:
            </td>
            <td class="value">
                <tc-webtag:textInput name="${title}" size="15" maxlength="<%=Constants.MAX_TITLE_LENGTH%>" editable="true"/>
            </td>
        </tr>
        <%i++;%>
</c:if>

<c:set value="<%=Constants.COMPANY_NAME%>" var="companyName"/>
<c:if test="${cf:contains(fields, companyName)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
                <tc-webtag:errorIterator id="err" name="<%=Constants.COMPANY_NAME%>"><%=err%><br />
                </tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, companyName)}">*</c:if>
                Company:
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.COMPANY_NAME%>" size="15" maxlength="<%=Constants.MAX_COMPANY_NAME_LENGTH%>" editable="true"/>
            </td>
        </tr>
        <%i++;%>
</c:if>


<%--Resume--%>
<c:if test="${cf:contains(fields, resume)}">
    <%--
    <tc-webtag:hiddenInput name="<%=Constants.FILE_NAME%>"/>
    --%>
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
                <tc-webtag:errorIterator id="err" name="${resume}"><%=err%><br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, resume)}">*</c:if>
                Resume:
            </td>
            <td class="value">
                <%--there should be only one--%>
                <c:forEach items="${regUser.coder.resumes}" var="res">
                <a href="${sessionInfo.servletPath}?module=DownloadResume" target="_blank">${res.fileName}</a>
                </c:forEach>
                <input type="file" name="${resume}"/>
            </td>
        </tr>
        <%i++;%>
</c:if>


<c:if test="${cf:contains(fields, referral)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
                <tc-webtag:errorIterator id="err" name="${referral}"><%=err%><br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, referral)}">*</c:if>
                How did you hear<br />about TopCoder?:
            </td>
            <td class="value">
                <tc-webtag:objectSelect name="${referral}" list="${referrals}" valueField="id" textField="description" onChange="referralSelection()"/>
                
                <div id="${referralCoder}_div">
                <span class="bigRed">Referring member's handle:</span><br />
                <tc-webtag:textInput name="${referralCoder}" size="15" maxlength="<%=Constants.MAX_HANDLE_LENGTH%>" editable="true"/>
                </div>
                
                <div id="${referralOther}_div">
                <span class="bigRed">Details:</span><br />
                <tc-webtag:textInput name="${referralOther}" size="25" maxlength="<%=Constants.MAX_REFERRAL_OTHER_LENGTH%>" editable="true"/>
                </div>
            </td>
        </tr>
        <%i++;%>
</c:if>

</tbody>
</table>

    <div align="center" id="legend">
        * = required
    </div>

    <div align="center" id="submitContainer">
        <button onclick="submitForm();">Submit</button>
    </div>

</form>

    </div>
</div>

</body>
</html>