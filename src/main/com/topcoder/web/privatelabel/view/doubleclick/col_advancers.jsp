<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<title>DoubleClick</title>

<jsp:include page="../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/doubleclick.css"/>

</head>
<body align="center">

<jsp:include page="links.jsp" >
   <jsp:param name="tabLev1" value="collegiate"/>
   <jsp:param name="tabLev2" value="advancers"/>
</jsp:include>

<table width="750" align="center" valign="top" cellpadding="0" cellspacing="0">
	<tr>
		<td class="dc_headerPic">
	      <img src="/i/events/doubleclick/image1.gif" border="0" width="163" height="180"/>
	  	</td>
		<td class="dc_bodyText">
         <p class="pageTitle">Advancers</p>

                      <table class="formFrame" cellpadding=5 cellspacing=2 width="250">
                        <tr>
                           <td class="sidebarTitle">Round</td>
                        </tr>
                        <tr valign="top">
                           <td class="sidebarText" nowrap="nowrap"><a href="/pl/?&module=Static&d1=doubleclick&d2=col_adv_qual1">Qualification Round - Session #1</a></td>
                        </tr>
                        <tr valign="top">
                           <td class="sidebarText" nowrap="nowrap"><a href="/pl/?&module=Static&d1=doubleclick&d2=col_adv_qual2">Qualification Round - Session #2</a></td>
                        </tr>
                     </table>

		</td>
	</tr>
</table>

<jsp:include page="foot.jsp" />

</body>
</html>




