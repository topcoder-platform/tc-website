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
					<td valign="top" width="164">
						<jsp:include page="links.jsp" /></td>
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

  						<p class="regmiddle">
  							<a href="/pl/?module=Static&d1=javaone04&d2=javaone_earlybird"><b>Early Bird Discount</b></a>&nbsp; &nbsp; | &nbsp; &nbsp;
      						<b>Student Discount</b></p>
      					<p class="regmiddle"><strong><font size="4">Student Discount</font></strong></p>

						<p class="regmiddle">JavaOne<sup>SM</sup> Conference: TopCoder students and professors SAVE over $1000 with Academic Pricing!</p>

						<p class="regmiddle">REGISTER by June 25 as a full-time student or active faculty and save!<br/>
											Student Rate: $395<br/>
											Faculty Rate: $895</p>

						<p class="regmiddle">Java<sup>TM</sup> technology is everywhere, improving the digital experience for everyone. It all starts at the
						JavaOne Conference, your source for cutting-edge knowledge and proven solutions. </p>

						<p class="regmiddle">Whether you are a student or a faculty member, the JavaOne Conference offers you an unparalleled
						opportunity to tap the sources of innovation for Java technology. </p>

						<p class="regmiddle"><strong>Discover Real World Solutions</strong><br/>
						Engaging technical topics, interactive Birds-of-a-Feather sessions and
						Hands-on Labs, insightful General Sessions, the hottest new products in the JavaOne Pavilion: These are just a few
						reasons why you should be at the Conference. You'll learn how to code simpler and faster, and create dynamic, secure
						applications directly from the experts-the masters and creators at the core of Java technology.</p>

						<p class="regmiddle"><strong>Conference Overview</strong><br/>
							Hundreds of in-depth technical sessions give you the skills and training you need. This year's topics cover seven
							key areas important to you:<br/>
							Topic 1-The Foundations: Core J2SE(TM) Technologies<br/>
							Topic 2-Core Enterprise Technologies<br/>
							Topic 3-Java Technology on the Desktop<br/>
							Topic 4-Java Technology for the Web<br/>
							Topic 5-Java Technology for Mobility<br/>
							Topic 6-Dissecting the Implementation: Solutions<br/>
							Topic 7-Intriguing and Unexpected: "New and Cool"</p>


						<p class="regmiddle">To register, call 1-888-886-8769 and identify yourself as a student or faculty member from the
						TopCoder program.* </p>

						<p class="regmiddle">Find all your solutions at the 2004 JavaOne conference.</p>

						<p class="regmiddle">We look forward to seeing you in San Francisco this June!</p>

						<p class="regmiddle">*This offer is available to full-time students and faculty or staff only. Full-time student
						status will be verified with a copy of your valid student identification card from an accredited college or university
						and a copy of your current course schedule with no less than eight credits. For faculty or staff, a letter on school
						letterhead from your department head or dean must be submitted to verify full-time status.</p>

						<p class="regmiddle">This offer is not valid for Web-based registration. Offer expires June 26, 2004. </p>




					</td>
				</tr>
			</table>
			<jsp:include page="foot.jsp" />
		</div>
	</body>
</html>