<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>TopCoder Technical Assessment Tool - Demo</title>

<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/demo.css"/>

</head>
<body>

<table width="770" align="left" valign="top" cellpadding=0 cellspacing=0 border=0>
	<tr><td valign="middle"><img src="/i/demo/xyz_logo.gif" border="0" width="122" height="66"/><img src="/i/demo/header.gif" border="0" width="409" height="66"/><img src="/i/clear.gif" height="1" width="140" border="0">
	<a href="http://www.topcoder.com/"><img src="/i/demo/pbtc_logo.gif" border="0" width="90" height="66"/></a></td></tr>
	<tr><td><div class=brHead><img src="/i/clear.gif" height="23" width="1"></div></td></tr>
	<tr><td><div><img src="/i/clear.gif" height="4" width="1"></div></td></tr>
	<tr>
		<td>
			<table cellspacing="0" cellpadding="0" border="0" width="100%"> 
				<tr> 
<%--
                    <td class=brLeftCol valign="top"><a href="/pl/?&module=Static&d1=brooks&d2=overview"><img src="/i/events/brooks/overview.gif" alt="" width="146" height="19" border="0"></a></td> 
--%>
					<td width="100%" valign="top">
						<form action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="POST" name="regForm">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.DEMO_REG_DEMOG%>"/>
            <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="CompanyId"/>"/>
            <input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="EventId"/>"/>
                        <table width="100%" cellpadding="0" cellspacing="3" border="0" >
                            <tr>
                                <td class="brBodyTitle" align=left>Application Information
                                </td>
                                <td class="brBodyTitle" align=right width="50%" nowrap=nowrap><A href="/corp/?module=Static&d1=corp&d2=testing&d3=index" target="_blank" class="brRegTableAnswer">Learn more about the TopCoder Technical Assessment Tool</A>
                                </td>
                           </tr>
                        <tr>
                            <td class="brBody" colspan="2" align=center>
                            If you encounter any technical problems while using the <br/>Technical Assessment Tool, please contact us at <A href="mailto:service@topcoder.com?subject=Question regarding the TopCoder Technical Assessment Tool">service@topcoder.com</A><br/>.
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
                                <tc-webtag:errorIterator id="err" name="<%=Constants.STATE_CODE%>"><%=err%><br/></tc-webtag:errorIterator>
                            </td>
                        </tr>
                        <tr>
                            <td class="brRegTableQuestion">State</td>
                            <td class="brRegTableAnswer">
                                <tc-webtag:textInput name="<%=Constants.STATE_CODE%>"  size="15" maxlength="50"/>
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
                                Student: <input type="radio" name="<%=Constants.CODER_TYPE%>" value ="<%=Constants.STUDENT%>" <%=regInfo.isStudent()?"checked":""%>>
                                Professional: <input type="radio" name="<%=Constants.CODER_TYPE%>" value ="<%=Constants.PROFESSIONAL%>" <%=regInfo.isProfessional()?"checked":""%>>
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
			</table>
		</td>
	</tr>
</table>

</body>
</html>