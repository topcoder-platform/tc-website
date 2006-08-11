<%@ page import="com.topcoder.web.tc.Constants"%>
<%@  page language="java"  %>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>
<head>
<jsp:include page="/script.jsp" />

<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="spon_links.jsp" >
<jsp:param name="tabLev2" value="registration"/>
<jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">

<span class="bigTitle">Registration</span>
<br /><br />

Registration is not currently open.<br>
The registration period is from August 28, 2006 9:00 AM EDT to September 12, 2006 6:00 PM EDT.
<br><br>

<form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="regForm">
    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="TCCC06SponsorTermsAgree"/>
    <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.COMPANY_NAME%>"><%=err%><br /></tc-webtag:errorIterator><br /></span>
    <b>Company name:</b>&#160;&#160;
    <br />
    <tc-webtag:textInput name="<%=Constants.COMPANY_NAME%>" size="30" maxlength="100"/>
    <br /><br />
    <div align="center">
    <iframe width="590" height="300" marginWidth="5" src="/tc?module=Static&d1=tournaments&d2=tccc06&d3=spon_reg_content"></iframe>
    <br /><br />
    <A href="Javascript:document.regForm.submit();">I Agree</A>
    <br /><br />
</form>

<br><br>
        </div>
      </td>


<!-- Right Column-->
<td width="170" align="right">
<img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
<%--
<div align="center" class="bodyText"><strong><A href="/tc?module=Static&d1=calendar&d2=thisMonth">More TopCoder Events</A></strong></div>
--%>
</td>
		

   </tr>

</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
