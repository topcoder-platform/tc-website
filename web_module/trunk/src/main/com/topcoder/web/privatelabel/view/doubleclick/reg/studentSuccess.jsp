<%@ page import="com.topcoder.web.privatelabel.Constants"%>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>

<title>DoubleClick</title>

<jsp:include page="../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/doubleclick.css"/>

</head>
<body align="center">

<jsp:include page="../links.jsp" >
   <jsp:param name="tabLev1" value="collegiate"/>
   <jsp:param name="tabLev2" value="registration"/>
</jsp:include>

<table width="750" align="center" valign="top" cellpadding="0" cellspacing="0">
	<tr>
		<td class="dc_headerPic">
	      <img src="/i/events/doubleclick/headers/guyNcode.jpg" border="0" width="163" height="180"/>
	  	</td>
		<td class="dc_bodyText">
         <p class="pageTitle">Registration Successful!</p>
         <p>
            In order to be eligible to compete in the DoubleClick Coding Challenge,
            you must activate your account by following the directions sent to the email
            address provided during registration. You <b>will not</b> be able to compete if you
            do not activate your account.
        </p>
         <span class="dc_errorText"><b>OPTIONAL:</b></span> If you would like to upload a resume, click <a class="bodyText_link" href="JavaScript:void window.open('<jsp:getProperty name="sessionInfo" property="ServletPath"/>resume?&<%=Constants.MODULE_KEY%>=ViewUpload&<%=Constants.COMPANY_ID%>=2998','Resume_Upload','top=2,left=2,width=350,height=300,status=0');">here</a></p>

        <p>
        Be sure to spend time in the Practice Room by clicking the Practice Arena link above.<br/><br/>

        Good luck to you in the Arena!
        </p>

		</td>
	</tr>
</table>

<jsp:include page="../foot.jsp" />

</body>
</html>