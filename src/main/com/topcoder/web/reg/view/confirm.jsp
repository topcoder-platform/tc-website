<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.model.RegistrationType" %>
<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="reg-tags" prefix="rt" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Signup Personal Information</title>
        <script type="text/javascript" src="/js/regReskin20080904.js"></script>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
        <jsp:include page="style.jsp">
            <jsp:param name="key" value="tc_reg"/>
        </jsp:include>
    </head>

    <body>
        
        <div id="wrapper">
        
            <div id="box-head">
                <jsp:include page="header.jsp" />
                <div id="page-head">
                    <h3 id="registration-signup"><span>Registration Signup: Personal Information</span></h3>
                </div>
            </div>
            
            <div id="box-body">            
                  
                    <div class="sidebox">

                      <h4 class="floated">Is this information correct?</h4>
                      <p class="bigRed">
                          NOTE: You have not updated your information yet. You MUST click SUBMIT at the bottom of this page to complete registration.   
                      </p>

                    </div>

                    <div class="content">
                    
                        <h4 class="floated">
                            <span>General</span><span class="end">&nbsp;</span>
                            <a href="${sessionInfo.secureAbsoluteServletPath}?<%=Constants.MODULE_KEY%>=Main" class="edit">Edit</a>
                        </h4>

                        <div class="content-body">
                        
                    <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="confirmForm">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Submit"/>

                    
                            <table width="100%" class="plain">


<c:set value="<%=Constants.GIVEN_NAME%>" var="givenName"/>
<c:if test="${cf:contains(fields, givenName)}">
    <tr>
        <td class="field-name">
            Given Name:
        </td>
        <td class="field-value">
                ${regUser.firstName}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.SURNAME%>" var="surname"/>
<c:if test="${cf:contains(fields, surname)}">
    <tr>
        <td class="field-name">
            Surname:
        </td>
        <td class="field-value">
                ${regUser.lastName}
        </td>
    </tr>
</c:if>


<c:set value="<%=Constants.NAME_IN_ANOTHER_LANGUAGE%>" var="nameInAnotherLanguage"/>
<c:if test="${cf:contains(fields, nameInAnotherLanguage)}">
    <tr>
        <td class="field-name">
            Name in Another Language:
        </td>
        <td class="field-value">
                ${regUser.nameInAnotherLanguage}
        </td>
    </tr>
</c:if>

<c:set value="<%=RegistrationType.COMPETITION_ID%>" var="competition"/>
<c:set value="<%=Constants.REG_TYPES%>" var="regTypes"/>
<c:if test="${!cf:contains(requestScope[regTypes], competition)}">
    <c:set value="<%=Constants.TITLE%>" var="title"/>
    <c:if test="${cf:contains(fields, title)}">
        <tr>
            <td class="field-name">
                Job Title:
            </td>
            <td class="field-value">
                    ${regUser.contact.title}
            </td>
        </tr>
    </c:if>

    <c:set value="<%=Constants.COMPANY_NAME%>" var="companyName"/>
    <c:if test="${cf:contains(fields, companyName)}">
        <tr>
            <td class="field-name">
                Company:
            </td>
            <td class="field-value">
                    ${regUser.contact.company.name}
            </td>
        </tr>
    </c:if>
</c:if>

<c:set value="<%=Constants.ADDRESS1%>" var="address1"/>
<c:if test="${cf:contains(fields, address1)}">
    <tr>
        <td class="field-name">
            Current Address1:
        </td>
        <td class="field-value">
                ${regUser.homeAddress.address1}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.ADDRESS2%>" var="address2"/>
<c:if test="${cf:contains(fields, address2)}">
    <tr>
        <td class="field-name">
            Current Address2:
        </td>
        <td class="field-value">
                ${regUser.homeAddress.address2}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.ADDRESS3%>" var="address3"/>
<c:if test="${cf:contains(fields, address3)}">
    <tr>
        <td class="field-name">
            Current Address3:
        </td>
        <td class="field-value">
                ${regUser.homeAddress.address3}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.CITY%>" var="city"/>
<c:if test="${cf:contains(fields, city)}">
    <tr>
        <td class="field-name">
            City:
        </td>
        <td class="field-value">
                ${regUser.homeAddress.city}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.STATE_CODE%>" var="stateCode"/>
<c:if test="${cf:contains(fields, stateCode)}">
    <tr>
        <td class="field-name">
            State:
        </td>
        <td class="field-value">
                ${regUser.homeAddress.state.name}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.POSTAL_CODE%>" var="postalCode"/>
<c:if test="${cf:contains(fields, postalCode)}">
    <tr>
        <td class="field-name">
            Postal Code:
        </td>
        <td class="field-value">
                ${regUser.homeAddress.postalCode}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.PROVINCE%>" var="province"/>
<c:if test="${cf:contains(fields, province)}">
    <tr>
        <td class="field-name">
            Province:
        </td>
        <td class="field-value">
                ${regUser.homeAddress.province}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.COUNTRY_CODE%>" var="countryCode"/>
<c:if test="${cf:contains(fields, countryCode)}">
    <tr>
        <td class="field-name">
            Country:
        </td>
        <td class="field-value">
                ${regUser.homeAddress.country.name}
        </td>
    </tr>
</c:if>


<c:set value="<%=Constants.COMP_COUNTRY_CODE%>" var="compCountryCode"/>
<c:if test="${cf:contains(fields, compCountryCode)}">
    <tr>
        <td class="field-name">
            Country to represent:
        </td>
        <td class="field-value">
                ${regUser.coder.compCountry.name}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.TIMEZONE%>" var="timeZone"/>
<c:if test="${cf:contains(fields, timeZone)}">
    <tr>
        <td class="field-name">
            Timezone:
        </td>
        <td class="field-value">
                ${regUser.timeZone.description}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.PHONE_NUMBER%>" var="phoneNumber"/>
<c:if test="${cf:contains(fields, phoneNumber)}">
    <tr>
        <td class="field-name">
            Phone Number:
        </td>
        <td class="field-value">
                ${regUser.primaryPhoneNumber.number}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.EMAIL%>" var="email"/>
<c:if test="${cf:contains(fields, email)}">
    <tr>
        <td class="field-name">
            Email Address:
        </td>
        <td class="field-value">
                ${regUser.primaryEmailAddress.address}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.HANDLE%>" var="handle"/>
<c:if test="${cf:contains(fields, handle)}">
    <tr>
        <td class="field-name">
            User Name:
        </td>
        <td class="field-value">
                ${regUser.handle}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.PASSWORD%>" var="password"/>
<c:if test="${cf:contains(fields, password)}">
    <tr>
        <td class="field-name">
            Password:
        </td>
        <td class="field-value">
            ********
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.SECRET_QUESTION%>" var="secretQuestion"/>
<c:if test="${cf:contains(fields, secretQuestion)}">
    <tr>
        <td class="field-name">
            Secret Question:
        </td>
        <td class="field-value">
                ${regUser.secretQuestion.question}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.SECRET_QUESTION_RESPONSE%>" var="secretQuestionResponse"/>
<c:if test="${cf:contains(fields, secretQuestionResponse)}">
    <tr>
        <td class="field-name">
            Secret Question Response:
        </td>
        <td class="field-value">
            ********
        </td>
    </tr>
</c:if>


<c:set value="<%=Constants.QUOTE%>" var="quote"/>
<c:if test="${cf:contains(fields, quote)}">
    <tr>
        <td class="field-name">
            Quote:
        </td>
        <td class="field-value">
                ${regUser.coder.quote}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.NOTIFICATION%>" var="notification"/>
<c:if test="${cf:contains(fields, notification)}">
    <c:forEach items="${regUser.notifications}" var="notif">
        <tr>
            <td class="field-name">
                Email Notifications:
            </td>
            <td class="field-value">
                    ${notif.name}
            </td>
        </tr>
    </c:forEach>
</c:if>

<c:set value="<%=Constants.MEMBER_CONTACT%>" var="memberContact"/>
<c:if test="${cf:contains(fields, memberContact)}">
    <tr>
        <td class="field-name">
            Member Contact Enabled:
        </td>
        <td class="field-value">
            <c:if test="${regUser.memberContactEnabled}">yes</c:if>
            <c:if test="${!regUser.memberContactEnabled}">no</c:if>
        </td>
    </tr>
</c:if>


<c:set value="<%=Constants.CODER_TYPE%>" var="coderType"/>
<c:if test="${cf:contains(fields, coderType)}">
    <tr>
        <td class="field-name">
            Coder Type:
        </td>
        <td class="field-value">
                ${regUser.coder.coderType.description}
        </td>
    </tr>
</c:if>
        
<c:set value="<%=Constants.SECURITY_KEY %>" var="securityKey"/>
<c:if test="${cf:contains(fields, securityKey)}">
    <tr>
        <td class="field-name">
            Security Key:
        </td>
        <td class="field-value">
                ${regUser.userSecurityKey.securityKey}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.DEMOG_PREFIX%>" var="demogPrefix"/>
<c:set value="<%=Constants.RESUME%>" var="resume"/>
<c:set value="<%=Constants.GPA%>" var="gpa"/>
<c:set value="<%=Constants.GPA_SCALE%>" var="gpaScale"/>
<c:set value="<%=Constants.SCHOOL_NAME%>" var="schoolName"/>
<c:set value="<%=Constants.REFERRAL%>" var="referral"/>

<c:if test="${cf:contains(fields, demogPrefix)||cf:contains(fields, resume)||(cf:contains(fields, gpa)&&cf:contains(fields, gpaScale))||cf:contains(fields, schoolName)||cf:contains(fields, referral)}">
    
    <%-- Close General information section first--%>
                        </table>
                      </div>
                    </div>
                    
    <%--Open Demographics section--%>                     
                    <div class="sidebox" style="visibility: hidden;">
                        <h4>&nbsp;</h4>
                    </div>
                    <div class="content">
                        <h4 class="floated">
                            <span>Demographics</span><span class="end">&nbsp;</span>
                            <a href="${sessionInfo.secureAbsoluteServletPath}?<%=Constants.MODULE_KEY%>=Secondary" class="edit">Edit</a>    
                        </h4>
                        <div class="content-body">
                            <table width="98%" class="plain" align="center">
</c:if>

<c:if test="${cf:contains(fields, demogPrefix)}">


    <rt:responseIterator id="resp" collection="${regUser.transientResponses}">
        <tr>
            <td class="field-name">
                <rt:demographicQuestionText response="${resp}"/>
                :
            </td>
            <td class="field-value">
                <rt:demographicAnswerText response="${resp}"/>
            </td>
        </tr>
    </rt:responseIterator>
</c:if>


<c:if test="${cf:contains(fields, resume)}">
    <tr>
        <td class="field-name">
            Resume:
        </td>
        <td class="field-value">
            <c:forEach items="${regUser.coder.resumes}" var="resume">
                ${resume.fileName}
            </c:forEach>
        </td>
    </tr>
</c:if>

<c:if test="${cf:contains(fields, gpa)&&cf:contains(fields, gpaScale)}">
    <tr>
        <td class="field-name">
            GPA:
        </td>
        <td class="field-value">
            <c:if test="${regUser.coder.currentSchool.GPA!=null&&regUser.coder.currentSchool.GPAScale!=null}">
                ${regUser.coder.currentSchool.GPA}/${regUser.coder.currentSchool.GPAScale}
            </c:if>
        </td>
    </tr>
</c:if>

<c:if test="${cf:contains(fields, schoolName)}">
    <tr>
        <td class="field-name">
            School:
        </td>
        <td class="field-value">
            <c:choose>
                <c:when test="${regUser.coder.currentSchool!=null}">
                    ${regUser.coder.currentSchool.school.name}
                </c:when>
                <c:otherwise>
                    ${regUser.primaryTeachingSchool.school.name}
                </c:otherwise>
            </c:choose>

        </td>
    </tr>
</c:if>

<c:if test="${cf:contains(requestScope[regTypes], competition)}">
    <c:set value="<%=Constants.TITLE%>" var="title"/>
    <c:if test="${cf:contains(fields, title)}">
        <tr>
            <td class="field-name">
                Title:
            </td>
            <td class="field-value">
                    ${regUser.contact.title}
            </td>
        </tr>
    </c:if>

    <c:set value="<%=Constants.COMPANY_NAME%>" var="companyName"/>
    <c:if test="${cf:contains(fields, companyName)}">
        <tr>
            <td class="field-name">
                Company:
            </td>
            <td class="field-value">
                    ${regUser.contact.company.name}
            </td>
        </tr>
    </c:if>
</c:if>


<c:if test="${cf:contains(fields, referral)}">
    <tr>
        <td class="field-name">
            How did you hear<br>about TopCoder?:
        </td>
        <td class="field-value">
                ${regUser.coder.coderReferral.referral.description} ${regUser.coder.coderReferral.referenceCoder.user.handle} ${regUser.coder.coderReferral.other}
        </td>
    </tr>
</c:if>
</table>
                            <div class="form-bottom">
                                <button type="submit" id="submit">Submit</button>
                                <p>
                                    Or cancel and go to 
                                    <a href="http://<%=ApplicationServer.SERVER_NAME%>/" title="TopCoder">TopCoder</a> or 
                                    <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/" title="Studio">Studio</a>
                                </p>
                                <p>&nbsp;</p>
                            </div>
</form>

</div>
                    </div>
            </div>

            <jsp:include page="footer.jsp" />
            
        </div>
        
    </body>
</html>