<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<title>DoubleClick</title>

<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" href="/css/doubleclick05.css"/>

</head>
<body align="center">

<jsp:include page="links.jsp" >
   <jsp:param name="tabLev1" value="internal"/>
   <jsp:param name="tabLev2" value="advancers"/>
</jsp:include>

<table width="750" align="center" valign="top" cellpadding="0" cellspacing="0">
	<tr>
		<td class="dc_headerPic">
	      <img src="/i/events/doubleclick05/image1.gif" border="0" width="163" height="180"/>
	  	</td>
		<td class="dc_bodyText">
         <p class="bigTitle">Advancers</p>

                      <table class="formFrame" cellpadding=5 cellspacing=2 width="250">
                        <tr>
                           <td class="sidebarTitle">Round</td>
                        </tr>
                        <tr>
                           <td class="sidebarText" nowrap="nowrap"><a class="bodyText_link" href="/pl/?&module=Static&d1=doubleclick05&d2=adv_main">Main Competition Round</a></td>
                        </tr>
                        <tr>
                           <td class="sidebarText" nowrap="nowrap"><a class="bodyText_link" href="/pl/?&module=Static&d1=doubleclick05&d2=adv_finals">Finals</a></td>
                        </tr>
                     </table>

		</td>
	</tr>
</table>

<jsp:include page="foot.jsp" />

</body>
</html>




