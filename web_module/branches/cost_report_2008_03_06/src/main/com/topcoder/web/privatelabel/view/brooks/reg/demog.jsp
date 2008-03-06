<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.List" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="privatelabel.tld" prefix="pl" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session" />
<% List questionList = (List)request.getAttribute("questionList");%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>Brooks Automation, Inc. - Screening</title>

<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/brooks.css"/>

</head>
<body>

<%
//hack for extra question, id 61
boolean extra = false;
if(request.getAttribute("extraquestion") != null && request.getAttribute("extraquestion").equals("true")) {
    extra = true;
}
%>
<table width="770" align="left" valign="top" cellpadding=0 cellspacing=0 border=0>
	<tr><td><img src="/i/events/brooks/brooks_logo.gif" border="0" width="122" height="66"/><img src="/i/events/brooks/header.gif" border="0" width="409" height="66"/></td></tr>
	<tr><td><div class=brHead><img src="/i/clear.gif" height="23" width="1"></div></td></tr>
	<tr><td><div class=brHeadSpacer><img src="/i/clear.gif" height="4" width="1"></div></td></tr>
	<tr>
		<td>
			<table cellspacing="0" cellpadding="0" border="0" width="100%">
				<tr>
<%--
                    <td class=brLeftCol valign="top"><a href="/pl/?module=Static&d1=brooks&d2=overview"><img src="/i/events/brooks/overview.gif" alt="" width="146" height="19" border="0"></a></td>
--%>
					<td width="100%" valign="top">
						<form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="regForm" enctype="multipart/form-data">
                                                    <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.BROOKS_REG_CONFIRM%>"/>
                                                    <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="companyId"/>"/>
                                                    <input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="eventId"/>"/>
                        <table width="100%" cellpadding="0" cellspacing="3" border="0" >
                            <tr>
                                <td class="brBodyTitle" align=left>Application Information
                                </td>
                                <td class="brBodyTitle" align=right nowrap=nowrap>
                                </td>
                           </tr>
                        <pl:questionIterator id="question" list="<%=questionList%>">
                            <%if(extra || question.getId() != 61) {%>
                            <tr>
                                <td class="brErrorText" colspan="2">
                                    <tc-webtag:errorIterator id="err" name="<%=Constants.DEMOG_PREFIX+question.getId()%>"><%=err%><br/></tc-webtag:errorIterator>
                                </td>
                            </tr>
                            <tr>
                                <td class="brRegTableQuestion">
                                <%if(question.isRequired()) {%><span class="brErrorText">*</span><%}%>
                                    <%=question.getText()%>
                                <%if(question.getId() == Constants.QUESTION_AREAS_OF_INTEREST) { %> (Choose up to 3) <br>
                                To select multiple items hold down the <br>Control key and click on each item.<% } %>
                                </td>
                                <td class="brRegTableAnswer">
                                    <pl:demographicInput question="<%=question%>"/>
                                </td>
                           </tr>
                           <% }%>
                        </pl:questionIterator>
                            <tr>
                                <td class="brErrorText" colspan="2">
                                    <tc-webtag:errorIterator id="err" name="<%=Constants.FILE%>"><%=err%><br/></tc-webtag:errorIterator>
                                </td>
                            </tr>
                           <tr>
                                <td class="brRegTableQuestion">
                                    Resume
                                </td>
                                <td class="brRegTableAnswer">
                                    <input type=file name="Resume">
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
                            <td class="brRegTableAnswer" nowrap=nowrap>
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