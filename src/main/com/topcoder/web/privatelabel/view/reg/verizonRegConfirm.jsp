<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="/privatelabel.tld" prefix="pl" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session" />
<jsp:usebean id="responseList" class="java.util.List" scope="request" />
<jsp:usebean id="questionMap" class="java.util.Map" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Verizon Coding Challenge Powered by TopCoder - Registration</title>

<jsp:include page="../script.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/verizon.js"></script>

</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" class="background">

<table border="0" cellspacing="0" cellpadding="0" class="black"  width="100%">
   <tr>

 <!-- Verizon logo-->
        <td width="147" valign="top"><a href="http://www22.verizon.com/"><img src="/i/events/verizon2003/logo_black_147x41.gif" width="147" height="37" alt="Verizon" border="0"></a></td>
        <td class="red"><img alt="" src="/images/spacer.gif" width="1" height="37"></td>
        <td valign="top" class="black" width="440"><img src="/i/events/verizon2003/vcc03_logo_secondary.gif" width="440" height="37" alt="Verizon Coding Contest" border="0"></td>
        <td class="red"><img alt="" src="/images/spacer.gif" width="1" height="37"></td>
        <td valign="top" class="black" width="99%"><img src="/i/events/verizon2003/pbtc_secondary.gif" width="134" height="37" alt="Powered by TopCoder" border="0"></td>
    </tr>

<!-- Top Ad -->
    <tr>
      <td class="red" height="1" colspan="5"><img alt="" src="/images/spacer.gif" width="10" height="1"></td>
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
                        
        <table cellpadding="0" cellspacing="3" class="bodyText" align="center" border="0">
        <form action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="POST" name="regForm">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.VERIZON_REG_SUBMIT%>"/>
            <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="CompanyId"/>"/>
            <input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="EventId"/>"/>

            <tr style="background: #eee;">
                 <td align="right" nowrap>Personal
                 </td>
                <td align="left"width="100%">
                    <a href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?<%=Constants.MODULE_KEY%>=<%=Constants.VERIZON_REG_MAIN%>&<%=Constants.COMPANY_ID%>=<jsp:getProperty name="regInfo" property="CompanyId"/>">edit<a/>
                </td>
            </tr>
            <tr>
                <td align="right" nowrap>
                    Handle
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Handle"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    First Name
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="FirstName"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Middle Initial
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="MiddleName"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Last Name
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="LastName"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Password
                </td>
                <td align="left">
                    ********
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Confirm Password
                </td>
                <td align="left">
                    ********
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Email Address
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Email"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Confirm Email Address
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="EmailConfirm"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Address1
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Address1"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Address2
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Address2"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Address3
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Address3"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    City
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="City"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Province
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Province"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Zip Code
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Zip"/>
                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Country
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="CountryName"/>
                </td>
            </tr>
            <tr style="background: #eee;">
                <td align="right" nowrap>
                    Demographics
                </td>
                <td align="left">
                    <a href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?<%=Constants.MODULE_KEY%>=<%=Constants.VERIZON_REG_DEMOG%>&<%=Constants.COMPANY_ID%>=<jsp:getProperty name="regInfo" property="CompanyId"/>">edit<a/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">

                </td>
            </tr>

            <tr>
                <td align="right" nowrap>
                    Student/Professional
                </td>
                <td align="left">
                    <%=regInfo.isStudent()?"Student":"Professional"%>
                </td>
            </tr>

            <pl:responseIterator id="resp" list="<%=responseList%>">
                <tr>
                    <td align="right" nowrap>
                        <pl:demographicQuestionText questions="<%=questionMap%>" response="<%=resp%>"/>
                    </td>
                    <td align="left">
                        <pl:demographicAnswerText questions="<%=questionMap%>" response="<%=resp%>"/>
                    </td>
                </tr>
            </pl:responseIterator>

            <tr>
               <td>
               </td>
               <td align="left">
                  <p><br /></p>
                  <p align="left"><a href="javascript: document.regForm.submit();" class="button" align="center">Submit</a></p>
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
