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
<title>TopCoder | Private Label Registration</title>
<jsp:include page="../script.jsp" />
</head>

<body>

<!-- TCO Header -->
<a name="top_page"></a>
<!--
            <object 
            type="application/x-shockwave-flash"
            data="/i/tournament/vcc03/vcc03_still.swf"
            width="100%"
            height="125"
            border="0">           
            <param name="movie" value="/i/tournament/vcc03/vcc03_still.swf" />
            <param name="quality" value="high" />
            <param name="salign" value="t">
            </object>
-->
        <img src="/i/tournament/vcc03/vcc03.jpg" width="750" height="120" border="0"/>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Left Column Begins-->
         <td>
         <p><img src="/i/clear.gif" width="180" height="10" border="0"/><br />
         <img src="/i/tournament/vcc03/vcc03_right.gif" width="180" height="400" border="0"/><br />
         <img src="/i/clear.gif" width="180" height="40" border="0"/>
         </p>
         </td>         
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%">

<!-- Tab bar links-->
<jsp:include page="../verizon/verizonLinks.jsp" >
   <jsp:param name="selectedTab" value="register_now"/>
</jsp:include>
<!-- Tab bar sub links-->
<jsp:include page="../verizon/verizonSublinks.jsp" >
   <jsp:param name="selectedList" value="register_now"/>
   <jsp:param name="selectedTab" value=""/>
</jsp:include>

      <blockquote>
      <h2>Registration</h2>
      <table width="100%" cellpadding="1" cellspacing="3" class="bodyText" align="center" >
        <form action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="POST" name="regForm">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.GOOGLE_REG_SUBMIT%>"/>
            <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="CompanyId"/>"/>
            <input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="EventId"/>"/>

            <tr style="background: #eee;">
                 <td align="right" width="49%">Personal
                 </td>
                <td align="left"width="49%">
                    <a href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?<%=Constants.MODULE_KEY%>=<%=Constants.GOOGLE_REG_MAIN%>&<%=Constants.COMPANY_ID%>=<jsp:getProperty name="regInfo" property="CompanyId"/>">edit<a/>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Handle
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Handle"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    First Name
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="FirstName"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Middle Initial
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="MiddleName"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Last Name
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="LastName"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Password
                </td>
                <td align="left">
                    ********
                </td>
            </tr>

            <tr>
                <td align="right">
                    Confirm Password
                </td>
                <td align="left">
                    ********
                </td>
            </tr>

            <tr>
                <td align="right">
                    Email Address
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Email"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Confirm Email Address
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="EmailConfirm"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Address1
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Address1"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Address2
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Address2"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Address3
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Address3"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    City
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="City"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    State
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="StateName"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Zip Code
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Zip"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Country
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="CountryName"/>
                </td>
            </tr>
            <tr style="background: #eee;">
                <td align="right">
                    Demographics
                </td>
                <td align="left">
                    <a href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?<%=Constants.MODULE_KEY%>=<%=Constants.GOOGLE_REG_DEMOG%>&<%=Constants.COMPANY_ID%>=<jsp:getProperty name="regInfo" property="CompanyId"/>">edit<a/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">

                </td>
            </tr>

            <tr>
                <td align="right">
                    Student/Professional
                </td>
                <td align="left">
                    <%=regInfo.isStudent()?"Student":"Professional"%>
                </td>
            </tr>

            <pl:responseIterator id="resp" list="<%=responseList%>">
                <tr>
                    <td align="right">
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
            </tr>

         </form>
         </table>
      </blockquote>
   </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
<!-- Right Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/>
        </td>
<!-- Gutter Ends -->   
</tr>
</table>

<jsp:include page="../verizon/verizon_foot.jsp" />

</body>

</html>