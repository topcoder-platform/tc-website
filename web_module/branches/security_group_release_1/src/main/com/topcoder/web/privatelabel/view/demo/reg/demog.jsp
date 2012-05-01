<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 java.util.List" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="privatelabel.tld" prefix="pl" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session" />
<% List questionList = (List)request.getAttribute("questionList");%>
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
	<tr>
		<td>
			<table cellspacing="0" cellpadding="0" border="0" width="100%">
				<tr>
<%--
                    <td class=demoLeftCol valign="top"><a href="/pl/?module=Static&d1=brooks&d2=overview"><img src="/i/events/brooks/overview.gif" alt="" width="146" height="19" border="0"></a></td>
--%>
					<td width="100%" valign="top">
						<form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="regForm" enctype="multipart/form-data">
                                                    <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.DEMO_REG_CONFIRM%>"/>
                                                    <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="companyId"/>"/>
                                                    <input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="eventId"/>"/>
                        <table width="100%" cellpadding="0" cellspacing="3" border="0" >
                            <tr>
                                <td class="demoBodyTitle" align=left>Application Information
                                </td>
                                <td class="demoBodyTitle" align=right nowrap=nowrap>
                                </td>
                           </tr>
                        <pl:questionIterator id="question" list="<%=questionList%>">
                            <tr>
                                <td class="demoErrorText" colspan="2">
                                    <tc-webtag:errorIterator id="err" name="<%=Constants.DEMOG_PREFIX+question.getId()%>"><%=err%><br/></tc-webtag:errorIterator>
                                </td>
                            </tr>
                            <tr>
                                <td class="demoRegQuestion">
                                <%if(question.isRequired()) {%><span class="demoErrorText">*</span><%}%>
                                    <%=question.getText()%>
                                <%if(question.getId() == Constants.QUESTION_AREAS_OF_INTEREST) { %> (Choose up to 3) <br>
                                To select multiple items hold down the <br>Control key and click on each item.<% } %>
                                </td>
                                <td class="demoRegAnswer">
                                    <pl:demographicInput question="<%=question%>"/>
                                </td>
                           </tr>
                        </pl:questionIterator>
                            <tr>
                                <td class="demoErrorText" colspan="2">
                                    <tc-webtag:errorIterator id="err" name="<%=Constants.FILE%>"><%=err%><br/></tc-webtag:errorIterator>
                                </td>
                            </tr>
                           <tr>
                                <td class="demoRegQuestion">
                                    Resume
                                </td>
                                <td class="demoRegAnswer">
                                    <input type=file name="Resume">
                                </td>
                           </tr>
                           <tr>
                            <td class="demoRegQuestion">
                                <span class="demoErrorText">* Required</span>
                            </td>
                            <td class="demoRegAnswer">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="demoRegQuestion"></td>
                            <td class="demoRegAnswer" nowrap=nowrap>
                            <br/><a class="demoRegAnswer" href="javascript: document.regForm.submit();">Submit</a>
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