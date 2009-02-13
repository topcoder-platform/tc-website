<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.common.BaseServlet,
                 com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/google05.css"/>
<title>Google Code Jam 2005, Powered by TopCoder</title>
<jsp:include page="../script.jsp" />
</head>
<body>

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

<table border=0 width=100% cellpadding=0 cellspacing=0>
	<tr>
		<td width="49%">&#160;</td>
		<td align=center>
			<table border=0 width=100% cellpadding=0 cellspacing=0>
				<tr>
					<td width="49%"></td>
					<td valign=bottom align=center><img border=0 src="/i/events/google2005/codejamLogo.gif" alt="Google Code Jam logo"></td>
					<td width="49%"></td>
				</tr>
			</table>
		</td>
		<td width="49%"></td>
	</tr>
	<tr>
		<td width="49%">&#160;</td>
		<td>
			<div class=greenBigBox>

			<!-- Tab bar links-->
			<div align=center>
			<jsp:include page="links.jsp" >
			<jsp:param name="selectedTab" value="registration"/>
			</jsp:include>
			</div>


			<br><br>
			<div style="float: left">
			<span class="bigTitle">Registration</span>
         </div>
			<div style="float: right">
			<jsp:include page="right_reg.jsp" />
			</div>
			<br><br>
                        Registration will close on Tuesday, August 19 at 2:00PM ET.<br/><br/>
                        If you are currently a TopCoder member or registered for the Google Code Jam 2003/2004, you may enter your handle and password below to use your account for the Google Code Jam 2005.<br/><br/>

                        <form method="post" name="frmLogin" action="<%=sessionInfo.getSecureAbsoluteServletPath()%>">
                        <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.GOOGLE05_LOGIN%>">
                        <input type="hidden" name="<%=Constants.EVENT_ID%>" value="3">
                        <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="1865">
                           <table border="0" cellpadding="3" cellspacing="0" align="center">
                              <tr><td colspan="3"><img src="/i/clear.gif" width="10" height="3" alt="" border="0"></td></tr>

                              <tr valign="top">
                                 <td class="errorText" colspan="3" align="center">
                                    <tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>"><%=err%><br/></tc-webtag:errorIterator>
                                 </td>
                              </tr>
                              <tr valign="middle">
                                 <td nowrap class="bodyText" align="right">Handle:</td>
                                 <td colspan="2" align="left"><input type="text" name="<%=Constants.HANDLE%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)"></td>
                              </tr>

                              <tr valign="middle">
                                 <td nowrap class="bodyText" align="right">Password:</td>
                                 <td align="left"><input type="password" name="<%=Constants.PASSWORD%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)"></td>
                                 <td nowrap class="bodyText">&#160;&#160;<a href="JavaScript:document.frmLogin.submit()" class="bodyText">Login&#160;&gt;</a></td>
                              </tr>
                              <tr><td colspan="3"><img src="/i/clear.gif" width="10" height="3" alt="" border="0"></td></tr>
                           </table>
                           <p><br/></p>

                           <script>
                              document.frmLogin.<%=Constants.HANDLE%>.focus();
                           </script>

                        </form>
                        <br/>
                        If you are not currently a TopCoder member or do not want to use an existing account, please click <a href="<%=sessionInfo.getSecureAbsoluteServletPath()%>?module=<%=Constants.GOOGLE05_REG_MAIN%>&<%=Constants.COMPANY_ID%>=1865&<%=Constants.EVENT_ID%>=3">here</a>.

			<br/><br/>
			To find out more detailed information about the Google Code Jam 2005, including a list of the prizes, please read the <a href="/pl/?&module=Static&d1=google05&d2=rules">Terms and Conditions</a>.
			</div>
		</td>
		<td width="49%">&#160;</td>
	<tr>
</table>
<jsp:include page="foot.jsp" />
</body>
</html>