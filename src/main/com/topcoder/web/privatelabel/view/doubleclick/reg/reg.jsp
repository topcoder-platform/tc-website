<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>

<title>DoubleClick</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../nocache.jsp"/>

<link type="text/css" rel="stylesheet" href="/css/doubleclick.css"/>

</head>
<body align="center">

<% if (regInfo.getCoderType()==Constants.STUDENT) {%>
    <jsp:include page="../links.jsp" >
        <jsp:param name="tabLev1" value="collegiate"/>
       <jsp:param name="tabLev2" value="registration"/>
    </jsp:include>
<% } else { %>
    <jsp:include page="../links.jsp" >
        <jsp:param name="tabLev1" value="internal"/>
       <jsp:param name="tabLev2" value="registration"/>
    </jsp:include>
<% } %>

<table width="750" align="center" valign="top" cellpadding="0" cellspacing="0"> 
	<tr>
		<td class="dc_headerPic">
	      <img src="/i/events/doubleclick/headers/guyNcode.jpg" border="0" width="163" height="180"/>
	  	</td>
		<td class="dc_bodyText">
         <p class="pageTitle">Registration</p>
         <p>Registration is open through 12:00 PM (noon) on Sunday, February 15, 2004</p>

        <form action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="POST" name="regForm">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.DC_REG_DEMOG%>"/>
            <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="CompanyId"/>"/>
            <input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="EventId"/>"/>

             <table width="100%" cellpadding="0" cellspacing="3" border="0">
                <tr>
                   <td class="dc_errorText" colspan="2">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>"><%=err%><br/></tc-webtag:errorIterator>
                   </td>
                </tr>
                <tr>
                   <td class="dc_regTableQuestion">Handle</td>
                   <td class="dc_regTableAnswer"><tc-webtag:textInput name="<%=Constants.HANDLE%>"  size="15" maxlength="<%=Constants.MAX_HANDLE_LENGTH%>" editable="<%=regInfo.isNew()%>"/></td>
                </tr>
                <tr>
                   <td class="dc_errorText" colspan="2">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.FIRST_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
                   </td>
                </tr>
                <tr>
                   <td class="dc_regTableQuestion">First Name</td>
                   <td class="dc_regTableAnswer"><tc-webtag:textInput name="<%=Constants.FIRST_NAME%>"  size="15" maxlength="50"/>
                </tr>
                <tr>
                   <td class="dc_errorText" colspan="2">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.MIDDLE_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
                   </td>
                </tr>
                <tr>
                   <td class="dc_regTableQuestion">Middle Initial</td>
                   <td class="dc_regTableAnswer"><tc-webtag:textInput name="<%=Constants.MIDDLE_NAME%>"  size="1" maxlength="1"/>
                </tr>
                <tr>
                   <td class="dc_errorText" colspan="2">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.LAST_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
                   </td>
                </tr>
                <tr>
                   <td class="dc_regTableQuestion">Last Name</td>
                   <td class="dc_regTableAnswer"><tc-webtag:textInput name="<%=Constants.LAST_NAME%>"  size="15" maxlength="50"/>
                </tr>
                <tr>
                   <td class="dc_errorText" colspan="2">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD%>"><%=err%><br/></tc-webtag:errorIterator>
                   </td>
                </tr>
                <tr>
                   <td class="dc_regTableQuestion">Password</td>
                   <td class="dc_regTableAnswer"><tc-webtag:textInput name="<%=Constants.PASSWORD%>"  passw="true" size="15" maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>"/> (<%=Constants.MIN_PASSWORD_LENGTH%> to <%=Constants.MAX_PASSWORD_LENGTH%> characters)
                </tr>
                <tr>
                   <td class="dc_errorText" colspan="2">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD_CONFIRM%>"><%=err%><br/></tc-webtag:errorIterator>
                   </td>
                </tr>
                <tr>
                   <td class="dc_regTableQuestion">Confirm Password</td>
                   <td class="dc_regTableAnswer"><tc-webtag:textInput name="<%=Constants.PASSWORD_CONFIRM%>"  passw="true" size="15" maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>"/>
                </tr>
                <tr>
                   <td class="dc_errorText" colspan="2">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><%=err%><br/></tc-webtag:errorIterator>
                   </td>
                </tr>
                <tr>
                   <td class="dc_regTableQuestion">Email</td>
                   <td class="dc_regTableAnswer"><tc-webtag:textInput name="<%=Constants.EMAIL%>"  size="30" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>"/>
                   <div class="bodyText">
                      <% if (regInfo.getCoderType()==Constants.STUDENT) { %>
                          (You must provide either a columbia.edu or nyu.edu email address)
                      <% }%>
                   </div>
                   </td>
                </tr>
                <tr>
                    <td class="dc_errorText" colspan="2">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS1%>"><%=err%><br/></tc-webtag:errorIterator>
                    </td>
                </tr>
                <tr>
                    <td class="dc_regTableQuestion">Address1</td>
                    <td class="dc_regTableAnswer"><tc-webtag:textInput name="<%=Constants.ADDRESS1%>"  size="30" maxlength="50"/></td>
                </tr>

                <tr>
                    <td class="dc_errorText" colspan="2">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS2%>"><%=err%><br/></tc-webtag:errorIterator>
                    </td>
                </tr>
                <tr>
                    <td class="dc_regTableQuestion">Address2</td>
                    <td class="dc_regTableAnswer"><tc-webtag:textInput name="<%=Constants.ADDRESS2%>"  size="30" maxlength="50"/></td>
                </tr>

                <tr>
                    <td class="dc_errorText" colspan="2">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS3%>"><%=err%><br/></tc-webtag:errorIterator>
                    </td>
                </tr>
                <tr>
                    <td class="dc_regTableQuestion">Address3</td>
                    <td class="dc_regTableAnswer"><tc-webtag:textInput name="<%=Constants.ADDRESS3%>"  size="30" maxlength="50"/></td>
                </tr>

                <tr>
                    <td class="dc_errorText" colspan="2">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.CITY%>"><%=err%><br/></tc-webtag:errorIterator>
                    </td>
                </tr>
                <tr>
                    <td class="dc_regTableQuestion">City</td>
                    <td class="dc_regTableAnswer"><tc-webtag:textInput name="<%=Constants.CITY%>"  size="15" maxlength="50"/></td>
                </tr>

                <tr>
                    <td class="dc_errorText" colspan="2">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.STATE_CODE%>"><%=err%><br/></tc-webtag:errorIterator>
                    </td>
                </tr>
                <tr>
                    <td class="dc_regTableQuestion">State</td>
                    <td class="dc_regTableAnswer">
                        <% ResultSetContainer stateRsc = (ResultSetContainer)request.getAttribute("stateList"); %>
                        <tc-webtag:rscSelect name="<%=Constants.STATE_CODE%>" list="<%=stateRsc%>" fieldText="state_name" fieldValue="state_code"/>
                    </td>
                </tr>

                <tr>
                    <td class="dc_errorText" colspan="2">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.ZIP%>"><%=err%><br/></tc-webtag:errorIterator>
                    </td>
                </tr>
                <tr>
                    <td class="dc_regTableQuestion">Zip Code</td>
                    <td class="dc_regTableAnswer"><tc-webtag:textInput name="<%=Constants.ZIP%>"  size="10" maxlength="15"/></td>
                </tr>

                <tr>
                    <td class="dc_errorText" colspan="2">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.COUNTRY_CODE%>"><%=err%><br/></tc-webtag:errorIterator>
                    </td>
                </tr>
                <tr>
                    <td class="dc_regTableQuestion">Country</td>
                    <td class="dc_regTableAnswer">
                        <% ResultSetContainer countryRsc = (ResultSetContainer)request.getAttribute("countryList"); %>
                        <tc-webtag:rscSelect name="<%=Constants.COUNTRY_CODE%>" list="<%=countryRsc%>" fieldText="country_name" fieldValue="country_code"/>
                    </td>
                </tr>
                <tr>
                   <td class="dc_regTableQuestion"></td>
                   <td class="dc_regTableAnswer"><a class="bodyText_link" href="javascript: document.regForm.submit();">Submit</a>
                   </td>
                </tr>

             </table>
        </form>
		</td>
	</tr>
</table>

<jsp:include page="../foot.jsp" />

</body>
</html>