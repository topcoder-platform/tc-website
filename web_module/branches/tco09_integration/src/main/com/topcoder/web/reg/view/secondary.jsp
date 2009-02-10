<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.model.Referral" %>
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
        <title>Edit Personal Information</title>
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
            // -->
        </script>
        
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

    <body <c:if test="${cf:contains(fields, referral)}">onLoad="referralSelection()"</c:if>>
        
        <div id="wrapper">
        
            <div id="box-head">
                <jsp:include page="header.jsp" />
                <div id="page-head">
                    <h3 id="registration-signup"><span>Registration Signup: Personal Information</span></h3>
              </div>
            </div>
            
            <div id="box-body">

            <form action="${sessionInfo.secureAbsoluteServletPath}" name="secondaryForm" <c:if test="${cf:contains(fields, resume)}">enctype="multipart/form-data"</c:if> method="post">
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
                
                    <div class="block">
                        <div class="sidebar">
                            <p>* = required information</p>
                        </div>
                                        
                        <div class="content">
                            <h4><span>Demographic Information</span><span class="end">&nbsp;</span></h4>
                            <div class="content-body">
                            <ul>
                            
                                <c:set value="<%=Constants.DEMOG_PREFIX%>" var="demogPrefix"/>
                                <c:if test="${cf:contains(fields, demogPrefix)}">
                                <rt:questionIterator id="assignment" list="${demographicAssignments}">
                                
                                <li class="form-row" id="${demogPrefix}${assignment.question.id}_row">
                                    <label>
                                    <c:if test="${assignment.required}"><span class="required">*</span></c:if>
                                        ${assignment.question.text}:
                                    </label>
                                    <rt:demographicInput question="${assignment.question}"/>
                                    
                                    <span style="visibility: hidden" id="${demogPrefix}${assignment.question.id}_status">
                                        <tc-webtag:errorIterator id="err" name="${demogPrefix}${assignment.question.id}"><%=err%></tc-webtag:errorIterator>
                                    </span>
                                    <tc-webtag:errorIterator id="err" name="${demogPrefix}${assignment.question.id}">
                                        <script type="text/javascript">applyError('${demogPrefix}${assignment.question.id}_row', '${demogPrefix}${assignment.question.id}_status')</script>
                                    </tc-webtag:errorIterator>
                                    
                                    <c:if test="${assignment.question.description!=null}">
                                        <p class="label-description">${assignment.question.description}</p>
                                    </c:if>
                                </li>
                                </rt:questionIterator>
                                </c:if>


                                <c:if test="${cf:contains(fields, schoolName)}">                            
                                <li class="form-row" id="school_row">
                                    <label>
                                    <c:if test="${cf:contains(reqFields, schoolName)}"><span class="required">*</span></c:if>
                                        School:
                                    </label>
                                    <div id="schoolName" class="schoolName" style="padding-top: 6px;">
                                        <tc-webtag:textInput name="${schoolName}" size="36" maxlength="<%=Constants.MAX_SCHOOL_NAME_LENGTH%>" editable="false"/>
                                        <span style="visibility: hidden" id="school_status">
                                            <tc-webtag:errorIterator id="err" name="${schoolName}">${err}<br></tc-webtag:errorIterator>
                                        </span>
                                    </div>
                                                                               
                                    <tc-webtag:errorIterator id="err" name="${schoolName}"><script type="text/javascript">applyError('school_row', 'school_status')</script></tc-webtag:errorIterator>
                                    
                                </li>
                                
                                <li class="form-row">                                    
                                    <%--School widget--%>
                                    <label></label>
                                    <a href="Javascript:openWin('${sessionInfo.secureAbsoluteServletPath}?<%=Constants.MODULE_KEY%>=ViewSchoolSearch','school',1200,600);">Choose School</a>
                                </li>
                                                                                         
                                   <c:set value="<%=Constants.VISIBLE_SCHOOL%>" var="visibleSchool"/>
                                   <c:if test="${cf:contains(fields, visibleSchool)}">
                                <li class="form-row" id="<%=Constants.VISIBLE_SCHOOL%>_row">
                            
                                    <label for="<%=Constants.VISIBLE_SCHOOL%>">
                                    <c:if test="${cf:contains(reqFields, visibleSchool)}"><span class="required">*</span></c:if>
                                    Show / hide my school:
                                    </label>
                                    <tc-webtag:radioButton name="${visibleSchool}" value="show"/>
                                    Show
                                    <tc-webtag:radioButton name="${visibleSchool}" value="hide"/>
                                    Hide
                                    
                                    <span style="visibility: hidden" id="${visibleSchool}_status">
                                        <tc-webtag:errorIterator id="err" name="${visibleSchool}"><%=err%></tc-webtag:errorIterator>
                                    </span>
                                    <tc-webtag:errorIterator id="err" name="${visibleSchool}">
                                        <script type="text/javascript">applyError('${visibleSchool}_row', '${visibleSchool}_status')</script>
                                    </tc-webtag:errorIterator>
                                    
                                </li>
                                </c:if>
                            </c:if>

                            <c:set value="<%=Constants.GPA%>" var="gpa"/>
                            <c:if test="${cf:contains(fields, gpa)}">
                            <li class="form-row" id="<%=Constants.GPA%>_row">
                            
                                <label for="<%=Constants.GPA%>">
                                <c:if test="${cf:contains(reqFields, gpa)}"><span class="required">*</span></c:if>
                                GPA:
                                </label>
                                <tc-webtag:textInput name="<%=Constants.GPA%>" size="4" maxlength="<%=Constants.MAX_GPA_LENGTH%>" editable="true"/>

                                <span style="visibility: hidden" id="${gpa}_status">
                                    <tc-webtag:errorIterator id="err" name="${gpa}"><%=err%></tc-webtag:errorIterator>
                                </span>
                                <tc-webtag:errorIterator id="err" name="${gpa}">
                                    <script type="text/javascript">applyError('${gpa}_row', '${gpa}_status')</script>
                                </tc-webtag:errorIterator>
                                    
                            </li>
                            </c:if>

                            <c:set value="<%=Constants.GPA_SCALE%>" var="gpaScale"/>
                            <c:if test="${cf:contains(fields, gpaScale)}">
                            <li class="form-row" id="<%=Constants.GPA_SCALE%>_row">
                            
                                <label for="<%=Constants.GPA_SCALE%>">
                                <c:if test="${cf:contains(reqFields, gpaScale)}"><span class="required">*</span></c:if>
                                GPA Scale:
                                </label>
                                <c:set value="<%=Constants.GPA_SCALES%>" var="scales"/>
                                <tc-webtag:stringSelect name="${gpaScale}" list="${scales}"/>

                                <span style="visibility: hidden" id="${gpaScale}_status">
                                    <tc-webtag:errorIterator id="err" name="${gpaScale}"><%=err%></tc-webtag:errorIterator>
                                </span>
                                <tc-webtag:errorIterator id="err" name="${gpaScale}">
                                    <script type="text/javascript">applyError('${gpaScale}_row', '${gpaScale}_status')</script>
                                </tc-webtag:errorIterator>
                                    
                            </li>
                            </c:if>


                            <c:set value="<%=Constants.TITLE%>" var="title"/>
                            <c:if test="${cf:contains(fields, title)}">
                            <li class="form-row" id="<%=Constants.TITLE%>_row">
                            
                                <label for="<%=Constants.TITLE%>">
                                <c:if test="${cf:contains(reqFields, title)}"><span class="required">*</span></c:if>
                                Job Title:
                                </label>
                                <tc-webtag:textInput name="${title}" size="15" maxlength="<%=Constants.MAX_TITLE_LENGTH%>" editable="true"/>

                                <span style="visibility: hidden" id="${title}_status">
                                    <tc-webtag:errorIterator id="err" name="${title}"><%=err%></tc-webtag:errorIterator>
                                </span>
                                <tc-webtag:errorIterator id="err" name="${title}">
                                    <script type="text/javascript">applyError('${title}_row', '${title}_status')</script>
                                </tc-webtag:errorIterator>
                                    
                            </li>
                            </c:if>

                            <c:set value="<%=Constants.COMPANY_NAME%>" var="companyName"/>
                            <c:if test="${cf:contains(fields, companyName)}">
                            <li class="form-row" id="<%=Constants.COMPANY_NAME%>_row">
                            
                                <label for="<%=Constants.COMPANY_NAME%>">
                                <c:if test="${cf:contains(reqFields, companyName)}"><span class="required">*</span></c:if>
                                Company:
                                </label>
                                <tc-webtag:textInput name="<%=Constants.COMPANY_NAME%>" size="15" maxlength="<%=Constants.MAX_COMPANY_NAME_LENGTH%>" editable="true"/>

                                <span style="visibility: hidden" id="${companyName}_status">
                                    <tc-webtag:errorIterator id="err" name="${companyName}"><%=err%></tc-webtag:errorIterator>
                                </span>
                                <tc-webtag:errorIterator id="err" name="${companyName}">
                                    <script type="text/javascript">applyError('${companyName}_row', '${companyName}_status')</script>
                                </tc-webtag:errorIterator>
                                    
                            </li>
                            </c:if>

                            <%--Resume--%>
                            <c:if test="${cf:contains(fields, resume)}">
                            <li class="form-row" id="${resume}_row">

                                <label for="${resume}">
                                <c:if test="${cf:contains(reqFields, resume)}"><span class="required">*</span></c:if>
                                Resume:
                                </label>

                                <%--there should be only one--%>
                                <c:forEach items="${regUser.coder.resumes}" var="res">
                                    <a href="${sessionInfo.servletPath}?module=DownloadResume" target="_blank">${res.fileName}</a>
                                </c:forEach>
                                <input type="file" name="${resume}"></input>

                                <span style="visibility: hidden" id="${resume}_status">
                                    <tc-webtag:errorIterator id="err" name="${resume}"><%=err%></tc-webtag:errorIterator>
                                </span>
                                <tc-webtag:errorIterator id="err" name="${resume}">
                                    <script type="text/javascript">applyError('${resume}_row', '${resume}_status')</script>
                                </tc-webtag:errorIterator>                                
                            </li>
                            </c:if>

                            <c:if test="${cf:contains(fields, referral)}">
                            <li class="form-row" id="${referral}_row">
                                            
                                <label for="${referral}">
                                <c:if test="${cf:contains(reqFields, referral)}"><span class="required">*</span></c:if>
                                How did you hear about TopCoder?:
                                </label>
                                
                                <tc-webtag:objectSelect name="${referral}" list="${referrals}" valueField="id" textField="description" onChange="referralSelection()"/>
                                    
                                <span style="visibility: hidden" id="${referral}_status">
                                    <tc-webtag:errorIterator id="err" name="${referral}"><%=err%></tc-webtag:errorIterator>
                                </span>
                                <tc-webtag:errorIterator id="err" name="${referral}">
                                    <script type="text/javascript">applyError('${referral}_row', '${referral}_status')</script>
                                </tc-webtag:errorIterator>                                
                            </li>
                            
                            <li class="form-row" id="${referralCoder}_div">
                                <label for="${referralCoder}">
                                <c:if test="${cf:contains(reqFields, referral)}"><span class="required">*</span></c:if>
                                Referring member's handle:
                                </label>
                                <tc-webtag:errorIterator id="err" name="${referral}">
                                    <script type="text/javascript">applyError('${referralCoder}_div', '${referral}_status')</script>
                                </tc-webtag:errorIterator>
                                <tc-webtag:textInput name="${referralCoder}" size="15" maxlength="<%=Constants.MAX_HANDLE_LENGTH%>" editable="true"/>
                            </li>
                            
                            <li class="form-row" id="${referralOther}_div">
                                <label for="${referralOther}">
                                <c:if test="${cf:contains(reqFields, referral)}"><span class="required">*</span></c:if>
                                Details:
                                </label>
                                <tc-webtag:errorIterator id="err" name="${referral}">
                                    <script type="text/javascript">applyError('${referralOther}_div', '${referral}_status')</script>
                                </tc-webtag:errorIterator>
                                <tc-webtag:textInput name="${referralOther}" size="25" maxlength="<%=Constants.MAX_REFERRAL_OTHER_LENGTH%>" editable="true"/>
                            </li>
                            </c:if>
    
                            <li class="form-bottom"><br />
                                <button id="submitBtn" onclick="submitForm();">Submit</button>
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
