<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Private Label Registration</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins -->
         <td>
         <p><img src="/i/clear.gif" width="180" height="60" border="0"/><br />
         <a href="/" ><img src="/i/tournament/vcc03/vcc03_left.gif" width="180" height="74" border="0"/></a><br />
         <img src="/i/clear.gif" width="180" height="60" border="0"/><br />
         <img src="/i/tournament/vcc03/vcc03_right.gif" width="180" height="400" border="0"/><br />
         <img src="/i/clear.gif" width="180" height="40" border="0"/>
         </p>
         </td>         
<!-- Left Column Ends -->
  
<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%">
<!-- TCO Header -->
         <p><br /></p>
         <div align="center"><img src="/i/tournament/vcc03/vcc03.gif" alt="Verizon Coding Challenge" width="500" height="120" border="0" vspace="0" /></div>
         <p><br /></p>
         <table cellpadding="1" cellspacing="3" class="bodyText">
        <form action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="POST" name="regForm">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.FULL_REG_DEMOG%>"/>
            <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="CompanyId"/>"/>
            <tr>
                <td colspan="2">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Handle
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.HANDLE%>"  size="15" maxlength="<%=Constants.MAX_HANDLE_LENGTH%>"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.FIRST_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    First Name
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.FIRST_NAME%>"  size="15" maxlength="50"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.MIDDLE_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Middle Initial
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.MIDDLE_NAME%>"  size="1" maxlength="1"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.LAST_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Last Name
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.LAST_NAME%>"  size="15" maxlength="50"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Password
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.PASSWORD%>" passw="true" size="15" maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD_CONFIRM%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Confirm Password
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.PASSWORD_CONFIRM%>" passw="true" size="15" maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Email Address
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.EMAIL%>"  size="15" maxlength="50"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL_CONFIRM%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Confirm Email Address
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.EMAIL_CONFIRM%>"  size="15" maxlength="50"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS1%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Address1
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.ADDRESS1%>"  size="15" maxlength="50"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS2%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Address2
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.ADDRESS2%>"  size="15" maxlength="50"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS3%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Address3
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.ADDRESS3%>"  size="15" maxlength="50"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.CITY%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    City
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.CITY%>"  size="15" maxlength="50"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.ZIP%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Zip Code
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.ZIP%>"  size="10" maxlength="15"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.STATE_CODE%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    State
                </td>
                <td align="left">
                    <% ResultSetContainer stateRsc = (ResultSetContainer)request.getAttribute("stateList"); %>
                    <tc-webtag:rscSelect name="<%=Constants.STATE_CODE%>" list="<%=stateRsc%>" fieldText="state_name" fieldValue="state_code"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.COUNTRY_CODE%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Country
                </td>
                <td align="left">
                    <% ResultSetContainer countryRsc = (ResultSetContainer)request.getAttribute("countryList"); %>
                    <tc-webtag:rscSelect name="<%=Constants.COUNTRY_CODE%>" list="<%=countryRsc%>" fieldText="country_name" fieldValue="country_code"/>
                </td>
            </tr>


            <tr>
                <td colspan="2">
                    <a href="javascript: document.regForm.submit();">submit</a>
                    <p class="button" align="center"> <a href="javascript: document.regForm.submit();">submit</a></p>
                </td>
            </tr>

            </form>

         </table>
      </td>
   </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>