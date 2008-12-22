<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="privatelabel.tld" prefix="pl" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>Brooks Automation, Inc. - Screening</title>

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

			<form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="regForm">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.AMAZON_REG_SUBMIT%>"/>
            <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="CompanyId"/>"/>
            <input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="EventId"/>"/>

                        <table width="100%" cellpadding="0" cellspacing="3" border="0" >
                            <tr>
                                <td align=left colspan=2>Application Information
                                </td>
                           </tr>
                        <tr>
                            <td class="regTableQuestion"><b>Personal</b></td>
                            <td class="regTableAnswer">
                                <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=<%=Constants.AMAZON_REG_MAIN%>&<%=Constants.COMPANY_ID%>=<jsp:getProperty name="regInfo" property="CompanyId"/>">edit<a/>
                            </td>
                        </tr>
                        <tr>
                            <td class="regTableQuestion">First Name</td>
                            <td class="regTableAnswer"><jsp:getProperty name="regInfo" property="FirstName"/></td>
                        </tr>

                        <tr>
                            <td class="regTableQuestion">Middle Initial</td>
                            <td class="regTableAnswer"><jsp:getProperty name="regInfo" property="MiddleName"/></td>
                        </tr>

                        <tr>
                            <td class="regTableQuestion">Last Name</td>
                            <td class="regTableAnswer"><jsp:getProperty name="regInfo" property="LastName"/></td>
                        </tr>
                        <tr>
                            <td class="regTableQuestion">Email Address</td>
                            <td class="regTableAnswer"><jsp:getProperty name="regInfo" property="Email"/></td>
                        </tr>
                        <tr>
                            <td class="regTableQuestion"></td>
                            <td class="regTableAnswer"><br/>
                            <a href="javascript: document.regForm.submit();">Submit</a>
                            </td>
                        </tr>
                        </table>
			</form>
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