<%@ page import="com.topcoder.web.privatelabel.Constants"%>
<%@  page language="java"  %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>VeriSign Internal Coding Competition, Powered by TopCoder</title>
<link type="text/css" rel="stylesheet" href="/css/verisign06.css"/>
    <SCRIPT type="text/javascript">
function submitEnter(e) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
     document.frmLogin.submit();
     return false;
    } else return true;
  }
</SCRIPT>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev2" value="registration"/>
<jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">

      <span class="bigTitle">Registration</span>
          <br /><br/>
If you are not already a registered competitor, click
          <a href="<jsp:getProperty name="sessionInfo" property="secureAbsoluteServletPath"/>?module=<%=Constants.VERISIGN_06_REG_MAIN%>&amp;<%=Constants.EVENT_ID%>=6&amp;<%=Constants.COMPANY_ID%>=17942">here</a>
          to register
an account for the VeriSign Internal Coding Competition.
          <br/><br/>

<b>Update your registration information</b><br />
If you have already registered for the VeriSign Internal Coding
Competition and would like to update your registration information,
please login below:
          <br/><br/>

Note: If you participated in the TopCoder VeriSign Sponsor Track
competition, you do NOT need to register a new account.  You may use
your existing account credentials to login to the Competition Arena.

      <br/><br/>
          <form method="post" name="frmLogin" action="<%=sessionInfo.getSecureAbsoluteServletPath()%>">
          <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.VERISIGN_06_LOGIN%>">
          <input type="hidden" name="<%=Constants.EVENT_ID%>" value="5">
          <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="17942">
      <table align="center">
          <tr valign="top">
             <td class="errorText" colspan="3" align="center">
                <tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>"><%=err%><br></tc-webtag:errorIterator>
             </td>
          </tr>
          <tr valign="middle">
             <td nowrap class="bodyText" align="right">Handle:</td>
             <td colspan="2" align="left"><input type="text" name="<%=Constants.HANDLE%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)"></td>
          </tr>

          <tr valign="middle">
             <td nowrap class="bodyText" align="right">Password:</td>
             <td align="left"><input type="password" name="<%=Constants.PASSWORD%>" value="" maxlength="30" size="12" onkeypress="submitEnter(event)"></td>
             <td nowrap class="bodyText">&#160;&#160;<a href="JavaScript:document.frmLogin.submit()">Login&#160;&gt;</a></td>
          </tr>
      </table>
      </form>
         
         
         
         
         
         <br><br><br><br><br><br><br><br><br><br><br><br><br><br>

         <br/><br/>

      </td>


         
         
<!-- Right Column-->
<td width="180" align="right" style="padding: 0px 15px 0px 0px;">
<jsp:include page="right.jsp" />

</td>
      
   </tr>
   
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
