<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>Amazon.com: Jobs</title>

<link type="text/css" rel="stylesheet" href="/css/amazon.css"/>

</head>
<body bgcolor="#FFFFFF" link="#003399" alink="#FF9933" vlink="#996633" topmargin=0 text="#000000">

<table width="100%" valign=top cellpadding=0 cellspacing=0 border=0 class=bodyFrame>
	<tr>
		<td colspan=4 align=center valign=bottom><jsp:include page="../head.jsp" /></td>
	</tr>
	<tr>
		<td class=blueBar colspan=4><img src="/i/clear.gif" width=1 height=29 border=0/></td>
	</tr>
	<tr>
		<td class=foilTop colspan=4><img src="/i/screening/amazon/foil_top.gif" border=0/></td>
	</tr>
	<tr>
		<td class=foilLeft><img src="/i/clear.gif" width=13 height=1 border=0 /></td>
		<td class=foilCorner><img src="/i/screening/amazon/foil_corner.gif" border=0 /></td>
		<td class=bodyCol>
			<div class=bodySpacer>

			<span class=pageTitle>Registration</span>
			<br/><br/>

            Registration has now closed.

<%--
						<form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="regForm">
			            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.AMAZON_REG_CONFIRM%>"/>
			            <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="CompanyId"/>"/>
			            <input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="EventId"/>"/>
                        <table width="100%" cellpadding="0" cellspacing="3" border="0" >
                            <tr>
                                <td align=left colspan=2>Application Information
                                </td>
                           </tr>
                        <tr>
                            <td colspan="2" align=center>
                            If you encounter any technical problems while using the <br/>Technical Assessment Tool, please contact us at <A href="mailto:amazon@topcoder.com?subject=Question regarding the Amazon Technical Assessment Tool">amazon@topcoder.com</A><br/>.
                            </td>
                        </tr>
                        <tr>
                            <td class="errorText" colspan="2">
                                <tc-webtag:errorIterator id="err" name="<%=Constants.FIRST_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
                            </td>
                        </tr>
                        <tr>
                            <td class="regTableQuestion"><span class="errorText">*</span> First Name</td>
                            <td class="regTableAnswer"><tc-webtag:textInput name="<%=Constants.FIRST_NAME%>"  size="15" maxlength="50"/></td>
                        </tr>
                        <tr>
                            <td class="errorText" colspan="2">
                                <tc-webtag:errorIterator id="err" name="<%=Constants.MIDDLE_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
                            </td>
                        </tr>
                        <tr>
                            <td class="regTableQuestion">Middle Initial</td>
                            <td class="regTableAnswer"><tc-webtag:textInput name="<%=Constants.MIDDLE_NAME%>"  size="1" maxlength="1"/></td>
                        </tr>
                        <tr>
                            <td class="errorText" colspan="2">
                                <tc-webtag:errorIterator id="err" name="<%=Constants.LAST_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
                            </td>
                        </tr>
                        <tr>
                            <td class="regTableQuestion"><span class="errorText">*</span> Last Name</td>
                            <td class="regTableAnswer"><tc-webtag:textInput name="<%=Constants.LAST_NAME%>"  size="15" maxlength="50"/></td>
                        </tr>
                        <tr>
                            <td class="errorText" colspan="2">
                                <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><%=err%><br/></tc-webtag:errorIterator>
                            </td>
                        </tr>
                        <tr>
                            <td class="regTableQuestion"><span class="errorText">*</span> Email</td>
                            <td class="regTableAnswer"><tc-webtag:textInput name="<%=Constants.EMAIL%>"  size="30" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>"/></td>
                        </tr>
                        <tr>
                            <td class="regTableQuestion">
                                <span class="errorText">* Required</span>
                            </td>
                            <td class="regTableAnswer">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="regTableQuestion"></td>
                            <td class="regTableAnswer">
                            <br/><a href="javascript: document.regForm.submit();">Submit</a>
                            </td>
                        </tr>
                        </table>
                        </form>
--%>


 			</div>
		</td>
		<td valign=top width="100%">&#160;</td>
	</tr>
	<tr>
		<td colspan=4 class=foot align=center><jsp:include page="../foot.jsp" /></td>
	</tr>
</table>

</body>
</html>