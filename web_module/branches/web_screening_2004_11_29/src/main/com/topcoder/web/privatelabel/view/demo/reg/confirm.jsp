<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="privatelabel.tld" prefix="pl" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.ResumeRegInfo" scope="session" />
<jsp:usebean id="responseList" class="java.util.List" scope="request" />
<jsp:usebean id="questionMap" class="java.util.Map" scope="request" />
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
	<tr><td><div class=demoHead><img src="/i/clear.gif" height="23" width="1"></div></td></tr>
	<tr><td><div><img src="/i/clear.gif" height="4" width="1"></div></td></tr>
	<form action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="POST" name="regForm">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.DEMO_REG_SUBMIT%>"/>
            <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="CompanyId"/>"/>
            <input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="EventId"/>"/>
	<tr>
		<td>
			<table cellspacing="0" cellpadding="0" border="0" width="100%"> 
				<tr> 
<%--
                    <td class=demoLeftCol valign="top"><a href="/pl/?&module=Static&d1=brooks&d2=overview"><img src="/i/events/brooks/overview.gif" alt="" width="146" height="19" border="0"></a></td> 
--%>
					<td width="100%" valign="top">
                        <table width="100%" cellpadding="0" cellspacing="3" border="0" >
                            <tr>
                                <td class="demoBodyTitle" align=left>Application Information
                                </td>
                                <td class="demoBodyTitle" align=right nowrap=nowrap>
                                </td>
                           </tr>
                        <tr>
                            <td class="demoRegQuestion"><b>Personal</b></td>
                            <td class="demoRegAnswer">
                                <a class="demoRegAnswer" href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?<%=Constants.MODULE_KEY%>=<%=Constants.BROOKS_REG_MAIN%>&<%=Constants.COMPANY_ID%>=<jsp:getProperty name="regInfo" property="CompanyId"/>">edit<a/>
                            </td>
                        </tr>
                        <tr>
                            <td class="demoRegQuestion">First Name</td>
                            <td class="demoRegAnswer"><jsp:getProperty name="regInfo" property="FirstName"/></td>
                        </tr>

                        <tr>
                            <td class="demoRegQuestion">Middle Initial</td>
                            <td class="demoRegAnswer"><jsp:getProperty name="regInfo" property="MiddleName"/></td>
                        </tr>

                        <tr>
                            <td class="demoRegQuestion">Last Name</td>
                            <td class="demoRegAnswer"><jsp:getProperty name="regInfo" property="LastName"/></td>
                        </tr>
                        <tr>
                            <td class="demoRegQuestion">Email Address</td>
                            <td class="demoRegAnswer"><jsp:getProperty name="regInfo" property="Email"/></td>
                        </tr>

                        <tr>
                            <td class="demoRegQuestion">Address1</td>
                            <td class="demoRegAnswer"><jsp:getProperty name="regInfo" property="Address1"/></td>
                        </tr>

                        <tr>
                            <td class="demoRegQuestion">Address2</td>
                            <td class="demoRegAnswer"><jsp:getProperty name="regInfo" property="Address2"/></td>
                        </tr>

                        <tr>
                            <td class="demoRegQuestion">Address3</td>
                            <td class="demoRegAnswer"><jsp:getProperty name="regInfo" property="Address3"/></td>
                        </tr>

                        <tr>
                            <td class="demoRegQuestion">City</td>
                            <td class="demoRegAnswer"><jsp:getProperty name="regInfo" property="City"/></td>
                        </tr>
                        <tr>
                            <td class="demoRegQuestion">State</td>
                            <td class="demoRegAnswer"><jsp:getProperty name="regInfo" property="StateCode"/></td>
                        </tr>
                        <tr>
                            <td class="demoRegQuestion">Pin/Zip Code</td>
                            <td class="demoRegAnswer"><jsp:getProperty name="regInfo" property="Zip"/></td>
                        </tr>

                        <tr>
                            <td class="demoRegQuestion">Country</td>
                            <td class="demoRegAnswer"><jsp:getProperty name="regInfo" property="CountryName"/></td>
                        </tr>
                        </table>

                        <p><br/></p>
						
                        <table width="100%" cellpadding="0" cellspacing="3" border="0" >
                        <tr>
                            <td class="demoRegQuestion"><b>Demographics</b></td>
                            <td class="demoRegAnswer">
                                <a class="demoRegAnswer" href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?<%=Constants.MODULE_KEY%>=<%=Constants.BROOKS_REG_DEMOG%>&<%=Constants.COMPANY_ID%>=<jsp:getProperty name="regInfo" property="CompanyId"/>">edit<a/>
                            </td>
                        </tr>
                        <pl:responseIterator id="resp" list="<%=responseList%>">
                            <tr>
                                <td class="demoRegQuestion">
                                    <pl:demographicQuestionText questions="<%=questionMap%>" response="<%=resp%>"/>
                                </td>
                                <td class="demoRegAnswer">
                                    <pl:demographicAnswerText questions="<%=questionMap%>" response="<%=resp%>"/>
                                </td>
                            </tr>
                        </pl:responseIterator>
                        
                        <tr>
                            <td class="demoRegQuestion">Resume</td>
                            <td class="demoRegAnswer"><jsp:getProperty name="regInfo" property="UploadStatus"/></td>
                        </tr>
                        <tr>
                            <td class="demoRegQuestion"></td>
                            <td class="demoRegAnswer"><br/>
                            <a class="demoRegAnswer" href="javascript: document.regForm.submit();">Submit</a>
                            </td>
                        </tr>
                        </table>

						<p><br/></p>
					</td> 

				</tr>
			</table>
		</td>
	</tr>
	</form>
</table>
	

</body>
</html>