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
<title>Google Code Jam 2003</title>
<link rel=stylesheet href="http://www.google.com/google.css">

<jsp:include page="../script.jsp" />

<style><!--
body,td,font,p,a
{
    font-family:arial,sans-serif
	}
.sidebarBox
{
	border: 1px solid #95D597;
	}
.sidebarText
{
	color: #333;
	line-height: 14px;
	background-color: #EEEEEE;
	}
.sidebarTitle
{
	color: #333;
	background-color: #CCCCCC;
	}
//-->
</style>

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=no,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

</head>

    <body class=corporate bgcolor="#ffffff" text="#000000" link="#0000CC" vlink="#800080" alink="#ff0000" topmargin=2>
	
	<div align="center">
<%-- Google Header--%>
<img width="276" height="110" src="http://www.google.com/codejam/codejam_logo.gif">

<table border=0 cellspacing=5 width="740">
   <tr> 
      <td style="background-color: #006633">
         <table class=sidebar bgcolor="#ffffff" cellpadding=15 cellspacing=0 border=0 width="100%">
            <tr>
               <td valign="top">
                  <div class=content> 
                  <div align="center">
	            <font size="-1">
                     <a href="/pl/?&module=Static&d1=google&d2=google_overview">Overview</a> &nbsp;|&nbsp; 
                     <a href="/pl/?&module=Static&d1=google&d2=google_sched">Schedule</a> &nbsp;|&nbsp; 
                     <a href="/pl/?&module=Static&d1=google&d2=google_rules_overview">Rules</a> &nbsp;|&nbsp; 
                     <font color="006633">Register Now</font> &nbsp;|&nbsp; 
                     <a href="Javascript:openWin('?module=Static&d1=google&d2=google_quick_launch','comp',300,225);">Practice Arena</a>
                  </font>
                  </div><br><br>
                  <b><font size="+1">Registration</font></b><br>

      <table width="100%" cellpadding="1" cellspacing="3" class="bodyText" align="center" >
        <form action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="POST" name="regForm">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.GOOGLE_REG_SUBMIT%>"/>
            <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="CompanyId"/>"/>
            <input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="EventId"/>"/>

            <tr>
                 <td align="right" width="50%"><b>Personal</b>
                 </td>
                <td align="left" width="50%">
                    <a href="<jsp:getProperty name="sessionInfo" property="ServletPath"/>?<%=Constants.MODULE_KEY%>=<%=Constants.GOOGLE_REG_MAIN%>&<%=Constants.COMPANY_ID%>=<jsp:getProperty name="regInfo" property="CompanyId"/>">edit<a/>
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
                    State
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="StateName"/>
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
            <tr>
                <td align="right"><b>Demographics</b>
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
               <td colspan="2" align="center">
                  <p align="center"><a href="javascript: document.regForm.submit();">Submit</a></p>
               </td>
            </tr>

         </form>
         </table>
                  <p><br /></p>
                  <p><a href="http://www.topcoder.com"><img align="right" src="/i/events/google2003/google_pbtc.gif" width="100" height="33" border="0" hspace="5"></a>
                  <font size="-1">This tournament is brought to you by TopCoder, Inc. (<a href="http://www.topcoder.com">http://www.topcoder.com</a>) 703 Hebron Avenue, Glastonbury, CT 06033 and Google Inc. (<a href="http://www.google.com">http://www.google.com</a>) 2400 Bayshore Parkway, Mountain View, CA 94043.
                  </font></p>
                  </div>
               </td>
            </tr>
         </table>
      </td>
   </tr>
</table>
</div>
<p><div class=footer> 
<small> &copy;2003 Google - 
<a href="http://www.google.com/">Home</a> - 
<a href="http://www.google.com/about.html">All About Google</a> - 
<a href="http://www.topcoder.com/?t=about_tc&c=index">About TopCoder</a> - 
<a href="http://www.google.com/jobs/">We're Hiring</a> 
</small>
</p>
</div>
</body>
</html>