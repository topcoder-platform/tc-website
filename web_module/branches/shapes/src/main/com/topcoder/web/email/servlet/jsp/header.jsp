<%@ page import="com.topcoder.web.email.servlet.*" %>

<SCRIPT type="text/javascript">
if ( window.navigator.userAgent.indexOf("Linux")>-1 ) {
  // Linux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders_linux.css"/>');
} else {
  // NonLinux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders.css"/>');
}
</SCRIPT>

<form name="frmHome" action="<%=response.encodeURL(EmailConstants.ALIAS)%>" method="post">
	<input type="hidden" name="<%=EmailConstants.TASK%>" value="<%=EmailConstants.HOME_TASK%>">
</form>

<a href="javascript:document.forms.frmHome.submit();">
<!-- <img src="<%=EmailConstants.JSP_ROOT%>images/logo.jpg" border=0> -->
<p class="bodyTextBig"><b>TopCoder Email System</b></p>
</a>
<hr/>
