<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
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
					<img src="/i/events/javaone04/banner_top.gif" width="800" height="106" border="0"/>
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
  						<img src="/i/clear.gif" width="7" height="1"><img src="/i/events/javaone04/coding_challenge.gif" width="351" height="27" border="0"><img src="/i/clear.gif" width="140" height="1"><a href="http://www.topcoder.com/"><img src="/i/events/javaone04/pbtc_logo.gif" width="130" height="27" border="0"/></a>
  						<p></p>
  						<p class ="regmiddle"><strong><font size="4">Web Services - Monday June 28</font></strong></p>
						<p class ="regmiddle">Monday | <a href="/pl/?module=Static&d1=javaone04&d2=javaone_tuesdayphotos">Tuesday</a> | <a href="/pl/?module=Static&d1=javaone04&d2=javaone_wednesdayphotos">Wednesday</a></p>


            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr>
                    <td class="thumbnails" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/javaone04/monday/image1.jpg');"><img src="/i/events/javaone04/monday/image1_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/javaone04/monday/image2.jpg');"><img src="/i/events/javaone04/monday/image2_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/javaone04/monday/image3.jpg');"><img src="/i/events/javaone04/monday/image3_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                    </td>
                </tr>

                <tr>
                    <td class="bodyText" align="center"><img src="/i/events/javaone04/monday/image1.jpg" name="bigVersion" width="432" height="288" class="photoFrameBig" /></td>
                </tr>

                <tr>
                    <td class="thumbnails" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/javaone04/monday/image4.jpg');"><img src="/i/events/javaone04/monday/image4_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/javaone04/monday/image5.jpg');"><img src="/i/events/javaone04/monday/image5_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/javaone04/monday/image6.jpg');"><img src="/i/events/javaone04/monday/image6_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                    </td>
                </tr>
            </table>


					</td>
				</tr>
			</table>
			<jsp:include page="foot.jsp" />
		</div>
	</body>
</html>