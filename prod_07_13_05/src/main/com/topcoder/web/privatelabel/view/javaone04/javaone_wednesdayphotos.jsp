<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<link rel=stylesheet type="text/css" href="http://java.sun.com/javaone/javaone2004.css">
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/doubleclick.css"/>

<title>2004 JavaOne Coding Challenge</title>



<jsp:include page="../script.jsp" />

<SCRIPT type="text/javascript">
if ( window.navigator.userAgent.indexOf("Linux")>-1 ) {
  // Linux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/crpfStyle_linux.css"/>');
} else {
  // NonLinux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/crpfStyle.css"/>');
}
</SCRIPT>

<script language="JavaScript">
  function changeImage(image, newImage) {
    document[image].src=newImage;
    return;
  }
</script>

</head>
	<body>
		<div align="center">
			<table border=0 cellspacing=0 width="800">
				<tr>
					<td colspan="2" align="left" valign="middle">
					<img src="/i/events/javaone05/banner_top.gif" width="800" height="106" border="0"/>
					</td>
				</tr>
				<tr>
					<td valign="top" width="164"><jsp:include page="links.jsp" /></td>
					<td valign="top">
				<!-- start breadcrumb -->
  						<table border="0" cellspacing="0" cellpadding="0" bgcolor="#F0F0F0" >
   							<tr><td width="19"><img src="/i/clear.gif" width="634" height="20"></td></tr>
						</table>
  				<!-- end breadcrumb -->
  						<p></p>
  						<img src="/i/clear.gif" width="7" height="1"><img src="/i/events/javaone05/coding_challenge.gif" width="351" height="27" border="0"><img src="/i/clear.gif" width="140" height="1"><a href="http://www.topcoder.com/"><img src="/i/events/javaone05/pbtc_logo.gif" width="130" height="27" border="0"/></a>
  						<p></p>
  						<p class ="regmiddle"><strong><font size="4">Mobility - Wednesday June 30</font></strong></p>
  						<p class ="regmiddle"><a href="/pl/?&module=Static&d1=javaone05&d2=mondayphotos">Monday</a> | <a href="/pl/?&module=Static&d1=javaone05&d2=tuesdayphotos">Tuesday</a> | Wednesday</p>
						
		
                  <div align="center" style="padding: 15px;">
                  <img src="/i/events/javaone05/wednesday/image01.jpg" alt="" class="photoFrameBig" />
                  </div>            

					
					
					</td>
				</tr>
			</table>
			<jsp:include page="foot.jsp" />
		</div>
	</body>
</html>