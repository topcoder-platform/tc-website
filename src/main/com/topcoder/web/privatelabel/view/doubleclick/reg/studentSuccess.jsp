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

<div class="dc_bodyTable">
   <div CLASS="dc_headerPic">
      <img src="/i/events/doubleclick/headers/guyNcode.jpg" border="0" width="163" height="180"/>
   </div>

   <div CLASS="dc_bodyText">
         <p class="pageTitle">Registration</p>
         <p>Description of registration goes here</p>
         <p>You are registered Mr. College Student</p>
         <b><font color="#FF0000">OPTIONAL:</font></b> If you would like to upload a resume, click <a href="JavaScript:void window.open('<jsp:getProperty name="sessionInfo" property="ServletPath"/>resume?&<%=Constants.MODULE_KEY%>=ViewUpload&<%=Constants.COMPANY_ID%>=2998','Resume_Upload','top=2,left=2,width=350,height=300,status=0');">here</a><br/><br/>

   </div>
</div>

<jsp:include page="../foot.jsp" />

</body>
</html>