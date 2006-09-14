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
   <jsp:param name="tabLev2" value="arena"/>
</jsp:include>

<table width="750" align="center" valign="top" cellpadding="0" cellspacing="0">
	<tr>
		<td class="dc_headerPic">
	      <img src="/i/events/doubleclick/image2.gif" border="0" width="163" height="180"/>
	  	</td>
		<td class="dc_bodyText">
         <p class="pageTitle">Competition Arena</p>

                        <p>
                        Click <a class="bodyText_link" href="Javascript:openWin('?module=Static&d1=doubleclick&d2=dc_quick_launch','comp',300,275);">here</a> to run the Competition Arena as a Java Applet.
                        <br/><br/>
                        Click <a class="bodyText_link" href="/contest/arena/ContestAppletDblClk.jnlp" target="_blank">here</a> to run the Competition Arena as a Java Web Start Application.
                        <br/><br/>
                        Note:  If you wish to install Java Web Start click <a class="bodyText_link" href="http://java.sun.com/products/javawebstart/index.html" target="_blank">here</a>.
                        <br/><br/>
                        If you experience problems loading or running the Competition Arena please contact  <A class="bodyText_link" href="mailto:dccc@topcoder.com">dccc@topcoder.com</A>.
                        </p>

		</td>
	</tr>
</table>
   
<jsp:include page="foot.jsp" />

</body>
</html>
