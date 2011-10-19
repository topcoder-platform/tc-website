<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<link rel=stylesheet href="http://java.sun.com/javaone/javaone2004.css">
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/doubleclick.css"/>

<title>2004 JavaOne Coding Challenge</title>



<jsp:include page="../script.jsp" />

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
  				<img src="/i/clear.gif" width="7" height="1"><img src="/i/events/javaone04/coding_challenge.gif" width="351" height="27" border="0">
  				<img src="/i/clear.gif" width="140" height="1"><a href="http://www.topcoder.com/"><img src="/i/events/javaone04/pbtc_logo.gif" width="130" height="27" border="0"/></a>
  				<p></p>
  				<p class="regmiddle"><strong><font size="4">Schedule</font></strong></p>
  				<p></p>

			<table width="604" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td width="33%" class="sidebarTitle">Date</td>
                    <td width="34%" class="sidebarTitle">Problem Set Theme</td>
                    <td width="33%" class="sidebarTitle">Time</td>
                </tr>

                <tr>
                    <td width="33%" class="sidebarText">Monday, June 28</td>
                    <td width="34%" class="sidebarText">Web Services - Qualification</td>
                    <td width="33%" class="sidebarText">11:00 am - 4:00 pm</td>
                </tr>

                <tr>
                    <td width="33%" class="sidebarText">Monday, June 28</td>
                    <td width="34%" class="sidebarText">Web Services - Competition</td>
                    <td width="33%" class="sidebarText">5:00 pm - 6:30 pm</td>
                </tr>

                <tr>
                    <td width="33%" class="sidebarText">Tuesday, June 29</td>
                    <td width="34%" class="sidebarText">Enterprise Services - Qualification</td>
                    <td width="33%" class="sidebarText">11:00 am - 3:00 pm</td>
                </tr>

                <tr>
                    <td width="33%" class="sidebarText">Tuesday, June 29</td>
                    <td width="34%" class="sidebarText">Enterprise Services - Competition</td>
                    <td width="33%" class="sidebarText">3:30 pm - 5:00 pm</td>
                </tr>

                <tr>
                    <td width="33%" class="sidebarText">Wednesday, June 30</td>
                    <td width="34%" class="sidebarText">Mobility - Qualification</td>
                    <td width="33%" class="sidebarText">11:00 am - 3:00 pm</td>
                </tr>

                <tr>
                    <td width="33%" class="sidebarText">Wednesday, June 30</td>
                    <td width="34%" class="sidebarText">Mobility - Competition</td>
                    <td width="33%" class="sidebarText">3:30 pm - 5:00 pm</td>
                </tr>
            </table>


					</td>
				</tr>
			</table>
			<jsp:include page="foot.jsp" />
		</div>
	</body>
</html>