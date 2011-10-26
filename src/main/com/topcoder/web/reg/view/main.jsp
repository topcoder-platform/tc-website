<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.HSRegistrationHelper,
                 com.topcoder.web.common.tag.AnswerInput,
                 com.topcoder.web.reg.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc.tld" prefix="tc" %>

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
        
        
        <script language="javascript" type="text/javascript">
            <!--
            function openWin(url, name, w, h) {
                win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width=" + w + ",height=" + h);
                win.location.href = url;
                win.focus();
            }
            function applyError(row, span) {
                // Find row to be marked
                var obj = document.getElementById(row);
                obj.className = 'form-row field-error';
                // Find span where error will be written
                var messageHolder = document.getElementById(span);
                messageHolder.style.visibility = 'visible';
            }
            function enableSubmit() {
                var flag = document.getElementById('<%=Constants.TERMS_OF_USE_ID%>');
                document.getElementById('submit').disabled = !flag.checked;
            }
            function hideBorder() {
                var arr = document.getElementsByTagName('input');
                for (var i=0; i < arr.length; i++) {
                    if (arr[i].id=='answerInput_radio') {
                        arr[i].style.borderWidth=0;
                    }
                }
            }
			function showhide(id){
				if (document.getElementById){
					obj = document.getElementById(id);
					if (obj.style.display == "none"){
						obj.style.display = "";
					} else {
						obj.style.display = "none";
					}
				}
			}

            // -->
        </script>
    
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

<%-- <c:if test="${!sessionInfo.loggedIn}">
    <div align="center" class="small" style="padding-bottom: 6px;">
        (<A href="/reg/?nrg=false">Click here</A> if you're already a registered member and would like to update
        your profile.)
    </div>
</c:if> 

<div id="regBcContainer">
    <div class="regBc">
        <div class="title">
            <c:if test="${sessionInfo.loggedIn}">
                <div style="float:left;"><A href="${sessionInfo.servletPath}?module=Logout" class="small">logout</A>
                </div>
            </c:if>
            Step <strong>2</strong> of
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

        <div class="on">General</div>

        <div class="off">Demographics</div>

        <div class="off">Confirm</div>

        <div class="off">Success</div>
        <c:if test="${isNewReg}">
            <div class="off">Activation</div>
        </c:if>
    </div>
</div> --%>

    <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="mainForm">

        <div class="block">
            <div class="sidebar">
                <p>We use this information in order to communicate with you, so please make sure it's up-to-date and accurate.</p>
                <p>Your information will be used only as specified in our <a href="Javascript:openWin('/reg/privacy_policy.jsp','',1200,600);" title="Privacy Policy">privacy policy</a>.</p>
                <p><span class="required">*</span> = required information</p>
            </div>
            
            <div class="content">
                <h4><span>Name and Contact</span><span class="end">&nbsp;</span></h4>
                <div class="content-body">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Secondary"/>
                    <ul>
                        
                        <c:set value="<%=Constants.GIVEN_NAME%>" var="givenName"/>
                        <c:if test="${cf:contains(fields, givenName)}">
                        <li class="form-row" id="<%=Constants.GIVEN_NAME%>_row">
                                
                            <label for="<%=Constants.GIVEN_NAME%>">
                            <c:if test="${cf:contains(reqFields, givenName)}"><span class="required">*</span></c:if>
                            First Name:
                            </label>
                            <tc-webtag:textInput name="<%=Constants.GIVEN_NAME%>" id="<%=Constants.GIVEN_NAME%>" size="40" maxlength="<%=Constants.MAX_GIVEN_NAME_LENGTH%>" editable="${not hasPayments}"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.GIVEN_NAME%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.GIVEN_NAME%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.GIVEN_NAME%>"><script type="text/javascript">applyError('<%=Constants.GIVEN_NAME%>_row', '<%=Constants.GIVEN_NAME%>_status')</script></tc-webtag:errorIterator>
                            
                            <p class="label-description">Given Name</p>
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.SURNAME%>" var="surname"/>
                        <c:if test="${cf:contains(fields, surname)}">
                        <li class="form-row" id="<%=Constants.SURNAME%>_row">
                                
                            <label for="<%=Constants.SURNAME%>">
                            <c:if test="${cf:contains(reqFields, surname)}"><span class="required">*</span></c:if>
                            Last Name:
                            </label>
                            <tc-webtag:textInput name="<%=Constants.SURNAME%>" id="<%=Constants.SURNAME%>" size="40" maxlength="<%=Constants.MAX_SURNAME_LENGTH%>" editable="${not hasPayments}"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.SURNAME%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.SURNAME%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.SURNAME%>"><script type="text/javascript">applyError('<%=Constants.SURNAME%>_row', '<%=Constants.SURNAME%>_status')</script></tc-webtag:errorIterator>
                            
                            <p class="label-description">Surname</p>
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.NAME_IN_ANOTHER_LANGUAGE%>" var="nameInAnotherLanguage"/>
                        <c:if test="${cf:contains(fields, nameInAnotherLanguage)}">
                        <li class="form-row" id="<%=Constants.NAME_IN_ANOTHER_LANGUAGE%>_row">

                            <label for="<%=Constants.NAME_IN_ANOTHER_LANGUAGE%>">
                            <c:if test="${cf:contains(reqFields, nameInAnotherLanguage)}"><span class="required">*</span></c:if>
                            Non-English Name:
                            </label>
                            <tc-webtag:textInput name="<%=Constants.NAME_IN_ANOTHER_LANGUAGE%>" id="<%=Constants.NAME_IN_ANOTHER_LANGUAGE%>" size="40" maxlength="<%=Constants.MAX_NAME_IN_ANOTHER_LANGUAGE_LENGTH%>" editable="${isNewReg or isNameInAnotherLanguageEmpty}"/>

                            <span style="visibility: hidden" id="<%=Constants.NAME_IN_ANOTHER_LANGUAGE%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.NAME_IN_ANOTHER_LANGUAGE%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.NAME_IN_ANOTHER_LANGUAGE%>"><script type="text/javascript">applyError('<%=Constants.NAME_IN_ANOTHER_LANGUAGE%>_row', '<%=Constants.NAME_IN_ANOTHER_LANGUAGE%>_status')</script></tc-webtag:errorIterator>
                            <c:if test="${isNewReg or isNameInAnotherLanguageEmpty}">
                            <p class="label-description">If applicable. Cannot be changed once saved.</p>
                            </c:if>
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.TITLE%>" var="title"/>
                        <c:if test="${cf:contains(fields, title)}">
                        <li class="form-row" id="<%=Constants.TITLE%>_row">
                        
                            <label for="<%=Constants.TITLE%>">
                            <c:if test="${cf:contains(reqFields, title)}"><span class="required">*</span></c:if>
                            Job Title:
                            </label>
                            <tc-webtag:textInput name="<%=Constants.TITLE%>" id="<%=Constants.TITLE%>" size="40" maxlength="<%=Constants.MAX_TITLE_LENGTH%>" editable="true"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.TITLE%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.TITLE%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.TITLE%>"><script type="text/javascript">applyError('<%=Constants.TITLE%>_row', '<%=Constants.TITLE%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.COMPANY_NAME%>" var="companyName"/>
                        <c:if test="${cf:contains(fields, companyName)}">
                        <li class="form-row" id="<%=Constants.COMPANY_NAME%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.COMPANY_NAME%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.COMPANY_NAME%>">
                            <c:if test="${cf:contains(reqFields, companyName)}"><span class="required">*</span></c:if>
                            Company:
                            </label>
                            <tc-webtag:textInput name="<%=Constants.COMPANY_NAME%>" id="<%=Constants.COMPANY_NAME%>" size="40" maxlength="<%=Constants.MAX_COMPANY_NAME_LENGTH%>" editable="true"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.COMPANY_NAME%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.COMPANY_NAME%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.COMPANY_NAME%>"><script type="text/javascript">applyError('<%=Constants.COMPANY_NAME%>_row', '<%=Constants.COMPANY_NAME%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.ADDRESS1%>" var="address1"/>
                        <c:if test="${cf:contains(fields, address1)}">
                        <li class="form-row" id="<%=Constants.ADDRESS1%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS1%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.ADDRESS1%>">
                            <c:if test="${cf:contains(reqFields, address1)}"><span class="required">*</span></c:if>
                            Current Address 1:
                            </label>
                            <tc-webtag:textInput name="<%=Constants.ADDRESS1%>" id="<%=Constants.ADDRESS1%>" size="40" maxlength="<%=Constants.MAX_ADDRESS_LENGTH%>" editable="true"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.ADDRESS1%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS1%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS1%>"><script type="text/javascript">applyError('<%=Constants.ADDRESS1%>_row', '<%=Constants.ADDRESS1%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.ADDRESS2%>" var="address2"/>
                        <c:if test="${cf:contains(fields, address2)}">
                        <li class="form-row" id="<%=Constants.ADDRESS2%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS2%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.ADDRESS2%>">
                            <c:if test="${cf:contains(reqFields, address2)}"><span class="required">*</span></c:if>
                            Current Address 2:
                            </label>
                            <tc-webtag:textInput name="<%=Constants.ADDRESS2%>" id="<%=Constants.ADDRESS2%>" size="40" maxlength="<%=Constants.MAX_ADDRESS_LENGTH%>" editable="true"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.ADDRESS2%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS2%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS2%>"><script type="text/javascript">applyError('<%=Constants.ADDRESS2%>_row', '<%=Constants.ADDRESS2%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>
                        
                        <c:set value="<%=Constants.ADDRESS3%>" var="address3"/>
                        <c:if test="${cf:contains(fields, address3)}">
                        <li class="form-row" id="<%=Constants.ADDRESS3%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS3%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.ADDRESS3%>">
                            <c:if test="${cf:contains(reqFields, address3)}"><span class="required">*</span></c:if>
                            Current Address 3:
                            </label>
                            <tc-webtag:textInput name="<%=Constants.ADDRESS3%>" id="<%=Constants.ADDRESS3%>" size="40" maxlength="<%=Constants.MAX_ADDRESS_LENGTH%>" editable="true"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.ADDRESS3%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS3%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS3%>"><script type="text/javascript">applyError('<%=Constants.ADDRESS3%>_row', '<%=Constants.ADDRESS3%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.CITY%>" var="city"/>
                        <c:if test="${cf:contains(fields, city)}">
                        <li class="form-row" id="<%=Constants.CITY%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.CITY%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.CITY%>">
                            <c:if test="${cf:contains(reqFields, city)}"><span class="required">*</span></c:if>
                            City:
                            </label>
                            <tc-webtag:textInput name="<%=Constants.CITY%>" id="<%=Constants.CITY%>" size="40" maxlength="<%=Constants.MAX_CITY_LENGTH%>" editable="true"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.CITY%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.CITY%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.CITY%>"><script type="text/javascript">applyError('<%=Constants.CITY%>_row', '<%=Constants.CITY%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.STATE_CODE%>" var="stateCode"/>
                        <c:if test="${cf:contains(fields, stateCode)}">
                        <li class="form-row" id="<%=Constants.STATE_CODE%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.STATE_CODE%>"></tc-webtag:errorIterator>

                            <label for="<%=Constants.STATE_CODE%>">
                            <c:if test="${cf:contains(reqFields, stateCode)}"><span class="required">*</span></c:if>
                            State (US Only):
                            </label>
                            <tc-webtag:textInput name="<%=Constants.STATE_CODE%>" id="<%=Constants.STATE_CODE%>" size="40" maxlength="2" editable="true"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.STATE_CODE%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.STATE_CODE%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.STATE_CODE%>"><script type="text/javascript">applyError('<%=Constants.STATE_CODE%>_row', '<%=Constants.STATE_CODE%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.POSTAL_CODE%>" var="postalCode"/>
                        <c:if test="${cf:contains(fields, postalCode)}">
                        <li class="form-row" id="<%=Constants.POSTAL_CODE%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.POSTAL_CODE%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.POSTAL_CODE%>">
                            <c:if test="${cf:contains(reqFields, postalCode)}"><span class="required">*</span></c:if>
                            Postal Code:
                            </label>
                            <tc-webtag:textInput name="<%=Constants.POSTAL_CODE%>" id="<%=Constants.POSTAL_CODE%>" size="40" maxlength="<%=Constants.MAX_POSTAL_CODE_LENGTH%>" editable="true"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.POSTAL_CODE%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.POSTAL_CODE%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.POSTAL_CODE%>"><script type="text/javascript">applyError('<%=Constants.POSTAL_CODE%>_row', '<%=Constants.POSTAL_CODE%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.PROVINCE%>" var="province"/>
                        <c:if test="${cf:contains(fields, province)}">
                        <li class="form-row" id="<%=Constants.PROVINCE%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.PROVINCE%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.PROVINCE%>">
                            <c:if test="${cf:contains(reqFields, province)}"><span class="required">*</span></c:if>
                            Province:
                            </label>
                            <tc-webtag:textInput name="<%=Constants.PROVINCE%>" id="<%=Constants.PROVINCE%>" size="40" maxlength="<%=Constants.MAX_PROVINCE_LENGTH%>" editable="true"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.PROVINCE%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.PROVINCE%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.PROVINCE%>"><script type="text/javascript">applyError('<%=Constants.PROVINCE%>_row', '<%=Constants.PROVINCE%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.COUNTRY_CODE%>" var="countryCode"/>
                        <c:if test="${cf:contains(fields, countryCode)}">
                        <li class="form-row" id="<%=Constants.COUNTRY_CODE%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.COUNTRY_CODE%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.COUNTRY_CODE%>">
                            <c:if test="${cf:contains(reqFields, countryCode)}"><span class="required">*</span></c:if>
                            Country:
                            </label>
                            <tc-webtag:objectSelect name="${countryCode}" list="${countries}" valueField="code" textField="name"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.COUNTRY_CODE%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.COUNTRY_CODE%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.COUNTRY_CODE%>"><script type="text/javascript">applyError('<%=Constants.COUNTRY_CODE%>_row', '<%=Constants.COUNTRY_CODE%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.COMP_COUNTRY_CODE%>" var="compCountryCode"/>
                        <c:if test="${cf:contains(fields, compCountryCode)}">
                        <li class="form-row" id="<%=Constants.COMP_COUNTRY_CODE%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.COMP_COUNTRY_CODE%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.COMP_COUNTRY_CODE%>">
                            <c:if test="${cf:contains(reqFields, compCountryCode)}"><span class="required">*</span></c:if>
                            Country to represent:
                            </label>
                            <tc-webtag:objectSelect name="${compCountryCode}" list="${countries}" valueField="code" textField="name"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.COMP_COUNTRY_CODE%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.COMP_COUNTRY_CODE%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.COMP_COUNTRY_CODE%>"><script type="text/javascript">applyError('<%=Constants.COMP_COUNTRY_CODE%>_row', '<%=Constants.COMP_COUNTRY_CODE%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.TIMEZONE%>" var="timeZone"/>
                        <c:if test="${cf:contains(fields, timeZone)}">
                        <li class="form-row" id="<%=Constants.TIMEZONE%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.TIMEZONE%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.TIMEZONE%>">
                            <c:if test="${cf:contains(reqFields, timeZone)}"><span class="required">*</span></c:if>
                            Timezone:
                            </label>
                            <tc-webtag:objectSelect name="${timeZone}" list="${timeZones}" valueField="id" textField="description"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.TIMEZONE%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.TIMEZONE%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.TIMEZONE%>"><script type="text/javascript">applyError('<%=Constants.TIMEZONE%>_row', '<%=Constants.TIMEZONE%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.PHONE_NUMBER%>" var="phoneNumber"/>
                        <c:if test="${cf:contains(fields, phoneNumber)}">
                        <li class="form-row" id="<%=Constants.PHONE_NUMBER%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.PHONE_NUMBER%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.PHONE_NUMBER%>">
                            <c:if test="${cf:contains(reqFields, phoneNumber)}"><span class="required">*</span></c:if>
                            Phone Number:
                            </label>
                            <tc-webtag:textInput name="<%=Constants.PHONE_NUMBER%>" id="<%=Constants.PHONE_NUMBER%>" size="40" maxlength="<%=Constants.MAX_PHONE_LENGTH%>" editable="true"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.PHONE_NUMBER%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.PHONE_NUMBER%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.PHONE_NUMBER%>"><script type="text/javascript">applyError('<%=Constants.PHONE_NUMBER%>_row', '<%=Constants.PHONE_NUMBER%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.EMAIL%>" var="email"/>
                        <c:if test="${cf:contains(fields, email)}">
                        <li class="form-row" id="<%=Constants.EMAIL%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.EMAIL%>">
                            <c:if test="${cf:contains(reqFields, email)}"><span class="required">*</span></c:if>
                            Email Address:
                            </label>
                            <tc-webtag:textInput name="<%=Constants.EMAIL%>" id="<%=Constants.EMAIL%>" size="40" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>" editable="true"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.EMAIL%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><script type="text/javascript">applyError('<%=Constants.EMAIL%>_row', '<%=Constants.EMAIL%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.EMAIL_CONFIRM%>" var="emailConfirm"/>
                        <c:if test="${cf:contains(fields, emailConfirm)}">
                        <li class="form-row" id="<%=Constants.EMAIL_CONFIRM%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL_CONFIRM%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.EMAIL_CONFIRM%>">
                            <c:if test="${cf:contains(reqFields, emailConfirm)}"><span class="required">*</span></c:if>
                            Confirm Email Address:
                            </label>
                            <tc-webtag:textInput name="<%=Constants.EMAIL_CONFIRM%>" id="<%=Constants.EMAIL_CONFIRM%>" size="40" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>" editable="true"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.EMAIL_CONFIRM%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL_CONFIRM%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL_CONFIRM%>"><script type="text/javascript">applyError('<%=Constants.EMAIL_CONFIRM%>_row', '<%=Constants.EMAIL_CONFIRM%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.NOTIFICATION%>" var="notification"/>
                        <c:if test="${cf:contains(fields, notification)}">
                        <% int i = 0;%>
                        <c:forEach items="${notifications}" var="notif">
                        <% pageContext.setAttribute("isFirst", new Boolean(i==0)); %>
                        <li class="form-row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.NOTIFICATION%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.NOTIFICATION%>">
                            <c:if test="${isFirst}">
                                <c:if test="${cf:contains(reqFields, notification)}"><span class="required">*</span></c:if>
                                Email Notifications:
                            </c:if>
                            </label>
                            
                            <tc-webtag:chkBox name="${notification}${notif.id}"/>
                            <c:out value="${notif.name}"/>        
                        
                        </li>
                        <% i++; %>
                        </c:forEach>
                        </c:if>

                        <c:set value="<%=Constants.MEMBER_CONTACT%>" var="memberContact"/>
                        <c:if test="${cf:contains(fields, memberContact)}">
                        <li class="form-row" id="<%=Constants.MEMBER_CONTACT%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.MEMBER_CONTACT%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.MEMBER_CONTACT%>">
                            <c:if test="${cf:contains(reqFields, memberContact)}"><span class="required">*</span></c:if>
                            Enable Member Contact:
                            </label>
                            <tc-webtag:radioButton name="<%=Constants.MEMBER_CONTACT%>" value="yes"/>
                            Yes
                            <tc-webtag:radioButton name="<%=Constants.MEMBER_CONTACT%>" value="no"/>
                            No
                            <c:if test="${not isNewReg}">
                                To block specific TopCoder members from contacting you, go to the
                                <a target="blackListWindow" href='/tc?module=BlackList'>black list</a> page.
                            </c:if>
                            
                            <span style="visibility: hidden" id="<%=Constants.MEMBER_CONTACT%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.MEMBER_CONTACT%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.MEMBER_CONTACT%>"><script type="text/javascript">applyError('<%=Constants.MEMBER_CONTACT%>_row', '<%=Constants.MEMBER_CONTACT%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.SHOW_EARNINGS%>" var="showEarnings"/>
                        <c:if test="${cf:contains(fields, showEarnings)}">
                        <li class="form-row" id="<%=Constants.SHOW_EARNINGS%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.SHOW_EARNINGS%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.SHOW_EARNINGS%>">
                            <c:if test="${cf:contains(reqFields, showEarnings)}"><span class="required">*</span></c:if>
                            Show/Hide earnings:
                            </label>
                            <tc-webtag:radioButton name="<%=Constants.SHOW_EARNINGS%>" value="show"/>
                            Show
                            <tc-webtag:radioButton name="<%=Constants.SHOW_EARNINGS%>" value="hide"/>
                            Hide
                            
                            <span style="visibility: hidden" id="<%=Constants.SHOW_EARNINGS%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.SHOW_EARNINGS%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.SHOW_EARNINGS%>"><script type="text/javascript">applyError('<%=Constants.SHOW_EARNINGS%>_row', '<%=Constants.SHOW_EARNINGS%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>
                        
                        <c:set value="<%=Constants.HS_REG_QUESTIONS%>" var="hsRegQuestions"/>
                        <c:if test="${cf:contains(fields, hsRegQuestions)}">
                            <c:set var="ansPrefix" value="<%=AnswerInput.PREFIX%>"/>
                            <c:set var="kwdDOB" value="<%=HSRegistrationHelper.DOB%>"/>
                            <tc:questionIterator list="${questions}" id="question">
                            
                            <c:set var="fieldName" value="${ansPrefix}${question.id}"/>
                            <li class="form-row" id="${fieldName}_row">
                            <label for="${fieldName}">
                                <span class="required">*</span>
                                ${question.text}
                            </label>
                            <c:choose>
                                <c:when test="${question.keyword == kwdDOB}">
                                    <tc-webtag:textInput size="10" maxlength="10" name="${fieldName}" id="answerInput" editable="true"/>
                                </c:when>
                                <c:otherwise>
                                <tc:answerInput id="answerInput_radio" question="${question}">
                                    ${answerInput_radio}
                                    <%=answerText%>
                                    &nbsp;&nbsp;&nbsp;
                                </tc:answerInput>
                                </c:otherwise>
                            </c:choose>
                              <script type="text/javascript">hideBorder()</script>
                            
                            <span style="visibility: hidden" id="${fieldName}_status">
                            <tc-webtag:errorIterator id="err" name="${fieldName}"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="${fieldName}"><script type="text/javascript">applyError('${fieldName}_row', '${fieldName}_status')</script></tc-webtag:errorIterator>
                            
                               <c:if test="${question.keyword == kwdDOB}">
                                   <p class="label-description">** Your date of birth will only be used for eligibility purposes **</p>
                               </c:if>
                            </li>
                            
                            </tc:questionIterator>
                        </c:if>                        
                    </ul>
                </div>
            </div>
        </div>
        
        <div class="block">
            <div class="sidebar">
                <p>Choose your username carefully. It cannot be changed, and it is a violation of our <a href="javascript:openWin('/reg/terms_of_use.jsp','',1200,600);" title="Terms of Use">Terms of Use</a> to create more than one account.</p>
                <p>If you ever forget your password and you do not have access to the email address in our system, you will be asked to answer this question in order to reset your password.</p>
            </div>
            <div class="content">
                <h4><span>Account</span><span class="end">&nbsp;</span></h4>
                <div class="content-body">
                    <ul>

                        <c:set value="<%=Constants.HANDLE%>" var="handle"/>
                        <c:if test="${cf:contains(fields, handle)}">
                        <li class="form-row" id="<%=Constants.HANDLE%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.HANDLE%>">
                            <c:if test="${cf:contains(reqFields, handle)}"><span class="required">*</span></c:if>
                            Username:
                            </label>
                            <tc-webtag:textInput name="<%=Constants.HANDLE%>" id="<%=Constants.HANDLE%>" size="40" maxlength="<%=Constants.MAX_HANDLE_LENGTH%>" editable="${isNewReg}"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.HANDLE%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>"><script type="text/javascript">applyError('<%=Constants.HANDLE%>_row', '<%=Constants.HANDLE%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.PASSWORD%>" var="password"/>
                        <c:if test="${cf:contains(fields, password)}">
                        <li class="form-row" id="<%=Constants.PASSWORD%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.PASSWORD%>">
                            <c:if test="${cf:contains(reqFields, password)}"><span class="required">*</span></c:if>
                            Password:
                            </label>
                            <tc-webtag:textInput name="<%=Constants.PASSWORD%>" id="<%=Constants.PASSWORD%>" passw="true" size="40" maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>" editable="true"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.PASSWORD%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD%>"><script type="text/javascript">applyError('<%=Constants.PASSWORD%>_row', '<%=Constants.PASSWORD%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.PASSWORD_CONFIRM%>" var="passwordConfirm"/>
                        <c:if test="${cf:contains(fields, passwordConfirm)}">
                        <li class="form-row" id="<%=Constants.PASSWORD_CONFIRM%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD_CONFIRM%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.PASSWORD_CONFIRM%>">
                            <c:if test="${cf:contains(reqFields, passwordConfirm)}"><span class="required">*</span></c:if>
                            Confirm Password:
                            </label>
                            <tc-webtag:textInput name="<%=Constants.PASSWORD_CONFIRM%>" id="<%=Constants.PASSWORD_CONFIRM%>" passw="true" size="40" maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>" editable="true"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.PASSWORD_CONFIRM%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD_CONFIRM%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD_CONFIRM%>"><script type="text/javascript">applyError('<%=Constants.PASSWORD_CONFIRM%>_row', '<%=Constants.PASSWORD_CONFIRM%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.SECRET_QUESTION%>" var="secretQuestion"/>
                        <c:if test="${cf:contains(fields, secretQuestion)}">
                        <li class="form-row" id="<%=Constants.SECRET_QUESTION%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.SECRET_QUESTION%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.SECRET_QUESTION%>">
                            <c:if test="${cf:contains(reqFields, secretQuestion)}"><span class="required">*</span></c:if>
                            Secret Question:
                            </label>
                            <tc-webtag:textInput name="<%=Constants.SECRET_QUESTION%>" id="<%=Constants.SECRET_QUESTION%>" size="40" editable="true"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.SECRET_QUESTION%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.SECRET_QUESTION%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.SECRET_QUESTION%>"><script type="text/javascript">applyError('<%=Constants.SECRET_QUESTION%>_row', '<%=Constants.SECRET_QUESTION%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.SECRET_QUESTION_RESPONSE%>" var="secretQuestionResponse"/>
                        <c:if test="${cf:contains(fields, secretQuestionResponse)}">
                        <li class="form-row" id="<%=Constants.SECRET_QUESTION_RESPONSE%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.SECRET_QUESTION_RESPONSE%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.SECRET_QUESTION_RESPONSE%>">
                            <c:if test="${cf:contains(reqFields, secretQuestionResponse)}"><span class="required">*</span></c:if>
                            Secret Question Response:
                            </label>
                            <tc-webtag:textInput name="<%=Constants.SECRET_QUESTION_RESPONSE%>" id="<%=Constants.SECRET_QUESTION_RESPONSE%>" passw="true" size="30" editable="true"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.SECRET_QUESTION_RESPONSE%>_status" class="field-error">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.SECRET_QUESTION_RESPONSE%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.SECRET_QUESTION_RESPONSE%>"><script type="text/javascript">applyError('<%=Constants.SECRET_QUESTION_RESPONSE%>_row', '<%=Constants.SECRET_QUESTION_RESPONSE%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.QUOTE%>" var="quote"/>
                        <c:if test="${cf:contains(fields, quote)}">
                        <li class="form-row" id="<%=Constants.QUOTE%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.QUOTE%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.QUOTE%>">
                            <c:if test="${cf:contains(reqFields, quote)}"><span class="required">*</span></c:if>
                            Quote:
                            </label>
                            <tc-webtag:textInput name="<%=Constants.QUOTE%>" id="<%=Constants.QUOTE%>" size="50" maxlength="<%=Constants.MAX_QUOTE_LENGTH%>" editable="true"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.QUOTE%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.QUOTE%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.QUOTE%>"><script type="text/javascript">applyError('<%=Constants.QUOTE%>_row', '<%=Constants.QUOTE%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.PHOTO%>" var="photo"/>
                        <c:if test="${cf:contains(fields, photo)}">
                        <li class="form-row">
                            
                            <label for="<%=Constants.PHOTO%>">
                            <c:if test="${cf:contains(reqFields, photo)}"><span class="required">*</span></c:if>
                            Member Photo:
                            </label>
                            
                            <a href="/tc?module=UserStatic&amp;d1=my_home&amp;d2=submitPhoto">
                            Click here to submit a
                            <c:if test="${regUser.coder.memberPhoto!=null}">different</c:if>
                            photo</a><br>
                            <p class="label-description">Let other TopCoder Members know what you look like. Send us a head shot that is at least 200 pixels (3 inches) across.
                            <a href="JavaScript:void window.open('/tc?module=Static&d1=member_photos&d2=index','Photo_Info','top=2,left=2,resizable=yes,width=600,height=700,status=0');" class="statTextBig">Click here</a> for more info about member photos.
                            </p>
                        </li>
                        </c:if>

                        <c:set value="<%=Constants.CODER_TYPE%>" var="coderType"/>
                        <c:if test="${cf:contains(fields, coderType)}">
                        <li class="form-row" id="<%=Constants.CODER_TYPE%>_row">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.CODER_TYPE%>"></tc-webtag:errorIterator>
                            
                            <label for="<%=Constants.CODER_TYPE%>">
                            <c:if test="${cf:contains(reqFields, coderType)}"><span class="required">*</span></c:if>
                            Student/Professional:
                            </label>
                            <tc-webtag:objectSelect name="${coderType}" list="${coderTypes}" valueField="id" textField="description"/>
                            
                            <span style="visibility: hidden" id="<%=Constants.CODER_TYPE%>_status">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.CODER_TYPE%>"><%=err%></tc-webtag:errorIterator>
                            </span>
                            <tc-webtag:errorIterator id="err" name="<%=Constants.CODER_TYPE%>"><script type="text/javascript">applyError('<%=Constants.CODER_TYPE%>_row', '<%=Constants.CODER_TYPE%>_status')</script></tc-webtag:errorIterator>
                            
                        </li>
                        </c:if>

						<c:if test="${isNewReg}">
							<input type="hidden" name="<%=Constants.SECURITY_KEY%>" value="">						
						</c:if>
                        <c:if test="${not isNewReg}">
							<c:set value="<%=Constants.SECURITY_KEY%>" var="securityKey"/>
							<c:if test="${cf:contains(fields, securityKey)}">
							<li class="form-row" id="<%=Constants.SECURITY_KEY%>_row">
								<tc-webtag:errorIterator id="err" name="<%=Constants.SECURITY_KEY%>"></tc-webtag:errorIterator>


								<label for="<%=Constants.SECURITY_KEY%>" style="padding-top: 0px;" >                            
									SSH Security Key:
								</label>
																
								<a href="javascript:showhide('securityKeyDiv');">Click here to store your SSH public key</a>
								<br>
								<div id="securityKeyDiv">
									<tc-webtag:textArea name="<%=Constants.SECURITY_KEY%>" rows="18" cols="60" />
								</div>

								<span style="visibility: hidden" id="<%=Constants.SECURITY_KEY%>_status">
								<tc-webtag:errorIterator id="err" name="<%=Constants.SECURITY_KEY%>"><%=err%></tc-webtag:errorIterator>
								</span>
								<tc-webtag:errorIterator id="err" name="<%=Constants.SECURITY_KEY%>"><script type="text/javascript">applyError('<%=Constants.SECURITY_KEY%>_row', '<%=Constants.SECURITY_KEY%>_status')</script></tc-webtag:errorIterator>

							</li>
							<c:if test="${empty processor_defaults.sk}">
								<script>
									showhide('securityKeyDiv');
								</script>
							</c:if>
						</c:if>                        
                        </c:if>

                        <li class="form-bottom">
                            <c:if test="${!cf:contains(regUser.terms, regTerms)}">
                            <input type="checkbox" name="<%=Constants.TERMS_OF_USE_ID%>" id="<%=Constants.TERMS_OF_USE_ID%>" onclick="enableSubmit();" />
                            <label for="<%=Constants.TERMS_OF_USE_ID%>">I have read and accept the <a href="javascript:openWin('/reg/terms_of_use.jsp','',1200,600);" title="Terms of Use">Terms of Use</a></label><br />
                            </c:if>
                            <button type="submit" id="submit" <c:if test="${!cf:contains(regUser.terms, regTerms)}">disabled="true"</c:if> >Submit</button>
                            <p>
                                Or cancel and go to 
                                <a href="http://<%=ApplicationServer.SERVER_NAME%>/" title="TopCoder">TopCoder</a> or 
                                <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/" title="Studio">Studio</a>
                            </p>
                            <p>&nbsp;</p>
                        </li>
                   </ul>
             </div>
         </div>
       </div>
                    
    </form>

</div>
<jsp:include page="footer.jsp" />
</div>
</body>
</html>
