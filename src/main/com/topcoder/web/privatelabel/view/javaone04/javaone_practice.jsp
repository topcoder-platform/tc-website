<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<link type="text/css" rel=stylesheet href="http://java.sun.com/javaone/javaone2004.css">


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
  						<p class="regmiddle"><strong><font size="4">Practice Arena</font></strong></p>
						<p class="regmiddle">Practice now for the JavaOne Coding Challenge!  In the practice room, you get to code, compile, test, 
						and submit algorithmic problems similar to the ones in the JavaOne Coding Challenge. Log in anytime and give yourself a 
						better chance at walking away with one of the grand prizes.</p>
						
					<div align="left"><a href=""><img src="/i/clear.gif" width="7" height="1"><img src="/i/events/javaone04/practice_button.gif" width="200" height="37" border="0"></a></div>
					<p class="regmiddle">Click <a href="">here</a> to run the Practice Arena as a Java Web Start Application.</p>
					
					 <p class="regmiddle">Note: If you wish to install Java Web Start click <a href="http://java.sun.com/products/javawebstart/index.jsp" target="_blank">here</a>. </p>


					
					</td>
				</tr>
			</table>
			<jsp:include page="foot.jsp" />
		</div>
	</body>
</html>