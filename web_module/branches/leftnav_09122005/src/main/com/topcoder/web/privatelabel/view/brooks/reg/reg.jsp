<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>Brooks Automation, Inc. - Screening</title>

<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/brooks.css"/>

</head>
<body>

<table width="770" align="left" valign="top" cellpadding=0 cellspacing=0 border=0>
	<tr><td><img src="/i/events/brooks/brooks_logo.gif" border="0" width="122" height="66"/><img src="/i/events/brooks/header.gif" border="0" width="409" height="66"/></td></tr>
	<tr><td><div class=brHead><img src="/i/clear.gif" height="23" width="1"></div></td></tr>
	<tr><td><div class=brHeadSpacer><img src="/i/clear.gif" height="4" width="1"></div></td></tr>
	<tr>
		<td>

        <p>Sorry registration has closed</p>

        <%--
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
                <td width="100%" valign="top">
                    <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="regForm">
        <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.BROOKS_REG_DEMOG%>"/>
        <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="companyId"/>"/>
        <input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="eventId"/>"/>
                    <table width="100%" cellpadding="0" cellspacing="3" border="0" >
                        <tr>
                            <td class="brBodyTitle" align=left>Application Information
                            </td>
                            <td class="brBodyTitle" align=right width="50%" nowrap=nowrap><A href="http://www.brooks.com/pages/2730_software.cfm" target="_blank" class="brBodyTitle">Learn about Brooks Software</A>
                            </td>
                       </tr>
                    <tr>
                        <td class="brBody" colspan="2" align=center>
                        If you encounter any technical problems while using the <br/>Technical Assessment Tool, please contact us at <A href="mailto:brooks@topcoder.com?subject=Question regarding the Brooks Automation Technical Assessment Tool">brooks@topcoder.com</A><br/>.
                        </td>
                    </tr>
                    <tr>
                        <td class="brErrorText" colspan="2">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.FIRST_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr>
                        <td class="brRegTableQuestion"><span class="brErrorText">*</span> First Name</td>
                        <td class="brRegTableAnswer"><tc-webtag:textInput name="<%=Constants.FIRST_NAME%>"  size="15" maxlength="50"/></td>
                    </tr>
                    <tr>
                        <td class="brErrorText" colspan="2">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.MIDDLE_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr>
                        <td class="brRegTableQuestion">Middle Initial</td>
                        <td class="brRegTableAnswer"><tc-webtag:textInput name="<%=Constants.MIDDLE_NAME%>"  size="1" maxlength="1"/></td>
                    </tr>
                    <tr>
                        <td class="brErrorText" colspan="2">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.LAST_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr>
                        <td class="brRegTableQuestion"><span class="brErrorText">*</span> Last Name</td>
                        <td class="brRegTableAnswer"><tc-webtag:textInput name="<%=Constants.LAST_NAME%>"  size="15" maxlength="50"/></td>
                    </tr>
                    <tr>
                        <td class="brErrorText" colspan="2">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.PHONE_NUMBER%>"><%=err%><br/></tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr>
                        <td class="brRegTableQuestion"><span class="brErrorText">*</span> Phone Number</td>
                        <td class="brRegTableAnswer"><tc-webtag:textInput name="<%=Constants.PHONE_NUMBER%>"  size="15" maxlength="50"/></td>
                    </tr>
                    <tr>
                        <td class="brErrorText" colspan="2">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><%=err%><br/></tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr>
                        <td class="brRegTableQuestion"><span class="brErrorText">*</span> Email</td>
                        <td class="brRegTableAnswer"><tc-webtag:textInput name="<%=Constants.EMAIL%>"  size="30" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>"/></td>
                    </tr>
                    <tr>
                        <td class="brErrorText" colspan="2">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS1%>"><%=err%><br/></tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr>
                        <td class="brRegTableQuestion"><span class="brErrorText">*</span> Address1</td>
                        <td class="brRegTableAnswer"><tc-webtag:textInput name="<%=Constants.ADDRESS1%>"  size="30" maxlength="50"/></td>
                    </tr>
                    <tr>
                        <td class="brErrorText" colspan="2">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS2%>"><%=err%><br/></tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr>
                        <td class="brRegTableQuestion">Address2</td>
                        <td class="brRegTableAnswer"><tc-webtag:textInput name="<%=Constants.ADDRESS2%>"  size="30" maxlength="50"/></td>
                    </tr>
                    <tr>
                        <td class="brErrorText" colspan="2">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS3%>"><%=err%><br/></tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr>
                        <td class="brRegTableQuestion">Address3</td>
                        <td class="brRegTableAnswer"><tc-webtag:textInput name="<%=Constants.ADDRESS3%>"  size="30" maxlength="50"/></td>
                    </tr>
                    <tr>
                        <td class="brErrorText" colspan="2">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.CITY%>"><%=err%><br/></tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr>
                        <td class="brRegTableQuestion"><span class="brErrorText">*</span> City</td>
                        <td class="brRegTableAnswer"><tc-webtag:textInput name="<%=Constants.CITY%>"  size="15" maxlength="50"/></td>
                    </tr>
                    <tr>
                        <td class="brErrorText" colspan="2">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.PROVINCE%>"><%=err%><br/></tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr>
                        <td class="brRegTableQuestion">Province</td>
                        <td class="brRegTableAnswer">
                            <tc-webtag:textInput name="<%=Constants.PROVINCE%>"  size="15" maxlength="50"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="brErrorText" colspan="2">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.ZIP%>"><%=err%><br/></tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr>
                        <td class="brRegTableQuestion">Pin/Zip Code</td>
                        <td class="brRegTableAnswer"><tc-webtag:textInput name="<%=Constants.ZIP%>"  size="10" maxlength="15"/></td>
                    </tr>
                    <tr>
                        <td class="brErrorText" colspan="2">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.COUNTRY_CODE%>"><%=err%><br/></tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr>
                        <td class="brRegTableQuestion"><span class="brErrorText">*</span> Country</td>
                        <td class="brRegTableAnswer">
                            <% ResultSetContainer countryRsc = (ResultSetContainer)request.getAttribute("countryList"); %>
                            <tc-webtag:rscSelect name="<%=Constants.COUNTRY_CODE%>" list="<%=countryRsc%>" fieldText="country_name" fieldValue="country_code"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="brErrorText" align="center">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.CODER_TYPE%>"><%=err%><br/></tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr>
                        <td class="brRegTableQuestion">
                            <span class="brErrorText">*</span> Student/Professional
                        </td>
                        <td class="brRegTableAnswer">
                            Student: <input type="radio" name="<%=Constants.CODER_TYPE%>" value ="<%=Constants.STUDENT%>" <%=regInfo.isStudent()?"checked":""%>/>
                            Professional: <input type="radio" name="<%=Constants.CODER_TYPE%>" value ="<%=Constants.PROFESSIONAL%>" <%=regInfo.isProfessional()?"checked":""%>/>
                        </td>
                    </tr>
                    <tr>
                        <td class="brRegTableQuestion">
                            <span class="brErrorText">* Required</span>
                        </td>
                        <td class="brRegTableAnswer">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="brRegTableQuestion"></td>
                        <td class="brRegTableAnswer">
                        <br/><a class="brRegTableAnswer" href="javascript: document.regForm.submit();">Submit</a>
                        </td>
                    </tr>
                    </table>
                    </form>

                    <p><br/></p>
                </td>

            </tr>
        </table>--%>
		</td>
	</tr>
</table>

</body>
</html>