<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
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
					<td colspan="2" align="left" valign="middle"> <img src="/i/events/javaone04/javaone04_logo.gif" width="166" height="80" border="0"/>
					<img src="/i/clear.gif" width="420" height="80" border="0"/>
					<a href="http://www.topcoder.com/"><img src="/i/events/javaone04/pbtc_logo.gif" width="166" height="80" border="0"/></a><br/>
					<img src="/i/events/javaone04/purple_dot.gif" width="800" height="25" border="0"></td></tr>
				<tr>
					<td valign="top" width="164"><jsp:include page="links.jsp" /></td>
					<td valign="top">
				<!-- start breadcrumb -->
  						<table border="0" cellspacing="0" cellpadding="0" bgcolor="#F0F0F0" >
   							<tr><td width="19"><img src="/i/clear.gif" width="634" height="20"></td></tr>
						</table>
  				<!-- end breadcrumb -->
  				
  						<span class="title"><br/>Prizes</span>
						<p class="middle">From each day's Qualification Round, the top four Qualifiers will be invited back in the evening to compete 
						in a <br/>one-hour head-to-head competition for these exciting grand prizes. In addition, the first 1000 participants 
						receive a JavaOne Coding Challenge t-shirt and messenger bag.</p>

						
			<table width="600" align="left" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td width="30%" class="sidebarTitle">Participant(s)</td>
                    <td width="70%" class="sidebarTitle">Prize</td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText">Grand Prize (3)*</td>
                    <td width="70%" class="sidebarText">One complimentary full Conference pass to the 2005 JavaOne conference,valued at $1,995 (travel and lodging excluded)</td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText">1st Runner Up (3)*</td>
                    <td width="70%" class="sidebarText">$500 gift certificate to redeem in the JavaOne conference Retail Store</td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText">2nd Runner Up (3)*</td>
                    <td width="70%" class="sidebarText">$250 gift certificate to redeem in the JavaOne conference Retail Store</td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText">3rd Runner Up (3)*</td>
                    <td width="70%" class="sidebarText">$125 gift certificate to redeem in the JavaOne conference</td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText">1st 1,000 Participants*</td>
                    <td width="70%" class="sidebarText">One JavaOne Coding Challenge T-Shirt and Messenger Bag</td>
                </tr>
                <tr>
                    <td width="100%" class="sidebarText" colspan="2">*Note: One Grand Prize and one 1st, 2nd, and 3rd Runner-Up prize awarded daily</td>
                    
                </tr>
            </table>
					
					
					</td>
				</tr>
			</table>
			<jsp:include page="foot.jsp" />
		</div>
	</body>
</html>