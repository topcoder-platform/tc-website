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

<link rel=stylesheet href="http://www.google.com/google.css">

<title>Google Code Jam 2003</title>

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

<jsp:include page="../script.jsp" />

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

    <body class=corporate bgcolor="#ffffff" text="#000000" link="#0000CC" vlink="#800080" alink="#ff0000" topmargin=2>

	<div align="center">
<%-- Google Header--%>
<img width="276" height="110" src="http://www.google.com/codejam/codejam_logo.gif" alt="Google Code Jam logo">

<table border=0 cellspacing=5 width="740">
   <tr>
      <td style="background-color: #006633">
         <table class=sidebar bgcolor="#ffffff" cellpadding=15 cellspacing=0 border=0 width="100%">
            <tr>
               <td valign="top">
                  <div class=content>
                  <div align="center">
                  
                  <!-- Tab bar links-->
                  <jsp:include page="googlelinks.jsp" >
                     <jsp:param name="selectedTab" value="registration"/>
                  </jsp:include>
                  
                  </div><br><br>
                  <b><font size="+1">Registration</font></b>

                  <table border=0 cellspacing=0 width="100%">
                     <tr>
                        <td valign="top">
                        <img hspace="10" vspace="5" src="/i/events/google2003/codejam_info.gif" width="150" height="390" border="0" align="right" valign="top">

                        <p><font size="-1"><br/>
                        Registration will close on Wednesday, October 15 at 5:00PM EDT.<br/><br/>
                        If you are currently a TopCoder member, you may enter your handle and password below to use your TopCoder account for the Google Code Jam 2003.<br/><br/>
                        Note: Your browser must have cookies enabled in order for this to work.<br/><br/>

                        <form method="post" name="frmLogin" action="https://<%=ApplicationServer.SERVER_NAME%><%=sessionInfo.getServletPath()%>">
                        <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.GOOGLE_LOGIN%>">
                        <input type="hidden" name="<%=Constants.EVENT_ID%>" value="1">
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
                        If you are not currently a TopCoder member or do not want to use your TopCoder account, please click <a href="https://<%=ApplicationServer.SERVER_NAME%><%=sessionInfo.getServletPath()%>?&module=GoogleReg&cid=1865&eid=1">here</a>.
                        </font>
                        </p>

                        </td>
                     </tr>

                     <tr>
                        <td><p><br /></p>
                              <p><a href="/"><img align="right" src="/i/events/google2003/google_pbtc.gif" width="100" height="33" border="0" hspace="5"></a>
                              <font size="-1">This tournament is brought to you by Google Inc. (<a href="http://www.google.com">http://www.google.com</a>) 2400 Bayshore Parkway, Mountain View, CA 94043 and powered by TopCoder, Inc. (<a href="/">http://www.topcoder.com</a>) 703 Hebron Avenue, Glastonbury, CT 06033.
                              </font></p>
                        </td>
                     </tr>
                  </table>
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
<a href="/?t=about_tc&c=index">About TopCoder</a> -
<a href="http://www.google.com/jobs/">We're Hiring</a>
</small>
</p>
</div>
</body>
</html>