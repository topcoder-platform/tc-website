<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.privatelabel.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.VerizonRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Verizon Coding Challenge Powered by TopCoder - Registration</title>

<jsp:include page="../nocache.jsp"/>
<jsp:include page="../script.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/verizon.js"></script>

</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" class="background">

<table border="0" cellspacing="0" cellpadding="0" class="black"  width="100%">
   <tr>

 <!-- Verizon logo-->
        <td width="147" valign="top"><A href="http://www.verizon.com"><img src="/i/events/verizon2003/logo_black_147x41.gif" width="147" height="37" alt="Verizon" border="0"></A></td>
        <td class="red"><img alt="" src="/i/spacer.gif" width="1" height="37"></td>
        <td valign="top" class="black" width="440"><img src="/i/events/verizon2003/vcc03_logo_secondary.gif" width="440" height="37" alt="Verizon Coding Contest" border="0"></td>
        <td class="red"><img alt="" src="/i/spacer.gif" width="1" height="37"></td>
        <td valign="top" class="black" width="99%"><A href="http://www.topcoder.com"><img src="/i/events/verizon2003/pbtc_secondary2.gif" width="134" height="37" alt="Contest Powered by TopCoder" border="0"></A></td>
    </tr>

<!-- Top Ad -->
    <tr>
      <td class="red" height="1" colspan="5"><img alt="" src="/i/spacer.gif" width="10" height="1"></td>
   </tr>

<table width="740" border="0" cellspacing="0" cellpadding="0">
    <tr>

<!-- Left Column Begins -->
        <td valign="top" width="146">
            <table width="146" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="146" class="white" align="center"><img src="/i/events/verizon2003/ps_banner.jpg" width="146" height="61" border="0" alt="Verizon Coding Contest">

                        <jsp:include page="../verizon/verizon_links_secondary.jsp" />

                    </td>
                </tr>
            </table>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="14"><img src="/i/clear.gif" width="14" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column -->
        <td valign="top" width="579"><img src="/i/clear.gif" width="574" height="10" border="0"/><br />
            <table width="427" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="427" class="bodyCopy">

                        <h2 class="pgTitle">Registration</h2>

                        <% if (regInfo.isRegFull()) { %>
                        <p class="redsubhead">
                            Registration for the Verizon Coding Challenge is full. However, you may continue to
                                provide your information below to be notified of future Verizon coding events.
                          </p>
                        <% } %>

                            <table cellpadding="0" cellspacing="3" class="bodyText" align="center" border="0">
                                <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="regForm">
                                <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.VERIZON_REG_DEMOG%>"/>
                                <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="CompanyId"/>"/>
                                <input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="EventId"/>"/>
                                <tr>
                                    <td colspan="2" class="errorText">
                                        <tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>"><%=err%><br/></tc-webtag:errorIterator>
                                    </td>
                                </tr>

            <tr>
                <td align="right" nowrap>
                    Handle (nickname)
                </td>
                <td align="left" width="100%">
                    <tc-webtag:textInput name="<%=Constants.HANDLE%>"  size="15" maxlength="<%=Constants.MAX_HANDLE_LENGTH%>"/>
                </td>
            </tr>

            <tr>
                <td colspan="2" class="errorText">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.GIVEN_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right" nowrap>
                    First Name
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.GIVEN_NAME%>"  size="15" maxlength="50"/>
                </td>
            </tr>

            <tr>
                <td colspan="2" class="errorText">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.MIDDLE_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right" nowrap>
                    Middle Initial
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.MIDDLE_NAME%>"  size="1" maxlength="1"/>
                </td>
            </tr>

            <tr>
                <td colspan="2" class="errorText">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.SURNAME%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right" nowrap>
                    Last Name
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.SURNAME%>"  size="15" maxlength="50"/>
                </td>
            </tr>

            <tr>
                <td colspan="2" class="errorText">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right" nowrap>
                    Password
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.PASSWORD%>" passw="true" size="15" maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>"/> (<%=Constants.MIN_PASSWORD_LENGTH%> to <%=Constants.MAX_PASSWORD_LENGTH%> characters)
                </td>
            </tr>

            <tr>
                <td colspan="2" class="errorText">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD_CONFIRM%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right" nowrap>
                    Confirm Password
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.PASSWORD_CONFIRM%>" passw="true" size="15" maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>"/>
                </td>
            </tr>

            <tr>
                <td colspan="2" class="errorText">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right" nowrap>
                    Email Address
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.EMAIL%>"  size="30" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>"/>
                </td>
            </tr>

            <tr>
                <td colspan="2" class="errorText">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL_CONFIRM%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right" nowrap>
                    Confirm Email Address
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.EMAIL_CONFIRM%>"  size="30" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>"/>
                </td>
            </tr>

            <tr>
                <td colspan="2" class="errorText">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS1%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right" nowrap>
                    Address1
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.ADDRESS1%>"  size="30" maxlength="50"/>
                </td>
            </tr>

            <tr>
                <td colspan="2" class="errorText">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS2%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right" nowrap>
                    Address2
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.ADDRESS2%>"  size="30" maxlength="50"/>
                </td>
            </tr>

            <tr>
                <td colspan="2" class="errorText">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS3%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right" nowrap>
                    Address3
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.ADDRESS3%>"  size="30" maxlength="50"/>
                </td>
            </tr>

            <tr>
                <td colspan="2" class="errorText">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.CITY%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right" nowrap>
                    City
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.CITY%>"  size="15" maxlength="50"/>
                </td>
            </tr>

            <tr>
                <td colspan="2" class="errorText">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.PROVINCE%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Province
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.PROVINCE%>"  size="15" maxlength="50"/>
                </td>
            </tr>

            <tr>
                <td colspan="2" class="errorText">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.POSTAL_CODE%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>
            <tr>
                <td align="right" nowrap>
                    Zip Code
                </td>
                <td align="left">
                    <tc-webtag:textInput name="<%=Constants.POSTAL_CODE%>"  size="10" maxlength="15"/>
                </td>
            </tr>

            <tr>
                <td colspan="2" class="errorText">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.COUNTRY_CODE%>"><%=err%><br/></tc-webtag:errorIterator>
                </td>
            </tr>

                            <tr>
                                <td align="right" nowrap>Country</td>
                                <td align="left">
                                    <% ResultSetContainer countryRsc = (ResultSetContainer)request.getAttribute("countryList"); %>
                                    <tc-webtag:rscSelect name="<%=Constants.COUNTRY_CODE%>" list="<%=countryRsc%>" fieldText="country_name" fieldValue="country_code"/>
                                </td>
                            </tr>

                            <tr>
                                <td></td>
                                <td align="right">
                                    <p><br /></p>
                                    <p><a href="javascript: document.regForm.submit();"><img src="/i/events/verizon2003/button_continue.gif" alt="continue" width="71" height="23" align="right" border="0"></a></p>
                                    <p><br /></p>
                                </td>
                            </form></tr>
                        </table>

                        <p><img src="/i/clear.gif" width="427" height="20" border="0"/></p>
                    </td>

<!-- Gutter Begins -->
                    <td width="14"><img src="/i/clear.gif" width="14" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
<jsp:include page="../verizon/verizon_right.jsp" />
<!-- Right Column Ends -->

                </tr>
            </table>
        </td>
   </tr>
</table>

<!-- Footer Begins -->
<jsp:include page="../verizon/verizon_foot.jsp" />
<!-- Footer Ends -->

</body>
</html>
