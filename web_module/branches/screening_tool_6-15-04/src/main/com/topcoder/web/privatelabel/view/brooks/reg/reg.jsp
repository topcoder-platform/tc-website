<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session" />
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
			<table cellspacing="0" cellpadding="0" border="0" width="100%"> 
				<tr> 
					<td class=brLeftCol valign="top"><a href="/pl/?&module=Static&d1=brooks&d2=overview"><img src="/i/events/brooks/overview.gif" alt="" width="146" height="19" border="0"></a></td> 
					<td width="100%" valign="top">
					    <p class="brBody"><span class="brBodyTitle">Registration</span><br/><br/>
						Registration explanation goes here.
						</p>
						<form action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="POST" name="regForm">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.BROOKS_REG_DEMOG%>"/>
            <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="CompanyId"/>"/>
            <input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="EventId"/>"/>
                        <table width="100%" cellpadding="0" cellspacing="3" border="0" >
                        <tr>
                            <td class="brErrorText" colspan="2">
                                <tc-webtag:errorIterator id="err" name="<%=Constants.FIRST_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
                            </td>
                        </tr>
                        <tr>
                            <td class="brRegTableQuestion">First Name</td>
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
                            <td class="brRegTableQuestion">Last Name</td>
                            <td class="brRegTableAnswer"><tc-webtag:textInput name="<%=Constants.LAST_NAME%>"  size="15" maxlength="50"/></td>
                        </tr>
                        <tr>
                            <td class="brErrorText" colspan="2">
                                <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD%>"><%=err%><br/></tc-webtag:errorIterator>
                            </td>
                        </tr>
                        <tr>
                            <td class="brErrorText" colspan="2">
                                <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><%=err%><br/></tc-webtag:errorIterator>
                            </td>
                        </tr>
                        <tr>
                            <td class="brRegTableQuestion">Email</td>
                            <td class="brRegTableAnswer"><tc-webtag:textInput name="<%=Constants.EMAIL%>"  size="30" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>"/></td>
                        </tr>
                        <tr>
                            <td class="brErrorText" colspan="2">
                                <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS1%>"><%=err%><br/></tc-webtag:errorIterator>
                            </td>
                        </tr>
                        <tr>
                            <td class="brRegTableQuestion">Address1</td>
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
                            <td class="brRegTableQuestion">City</td>
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
                                <% ResultSetContainer stateRsc = (ResultSetContainer)request.getAttribute("stateList"); %>
                                <tc-webtag:rscSelect name="<%=Constants.STATE_CODE%>" list="<%=stateRsc%>" fieldText="state_name" fieldValue="state_code"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="brErrorText" colspan="2">
                                <tc-webtag:errorIterator id="err" name="<%=Constants.ZIP%>"><%=err%><br/></tc-webtag:errorIterator>
                            </td>
                        </tr>
                        <tr>
                            <td class="brRegTableQuestion">Zip Code</td>
                            <td class="brRegTableAnswer"><tc-webtag:textInput name="<%=Constants.ZIP%>"  size="10" maxlength="15"/></td>
                        </tr>
                        <tr>
                            <td class="brErrorText" colspan="2">
                                <tc-webtag:errorIterator id="err" name="<%=Constants.COUNTRY_CODE%>"><%=err%><br/></tc-webtag:errorIterator>
                            </td>
                        </tr>
                        <tr>
                            <td class="brRegTableQuestion">Country</td>
                            <td class="brRegTableAnswer">
                                <% ResultSetContainer countryRsc = (ResultSetContainer)request.getAttribute("countryList"); %>
                                <tc-webtag:rscSelect name="<%=Constants.COUNTRY_CODE%>" list="<%=countryRsc%>" fieldText="country_name" fieldValue="country_code"/>
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