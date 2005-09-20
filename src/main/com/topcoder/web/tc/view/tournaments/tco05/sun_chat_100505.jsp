<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
<jsp:include page="../../script.jsp" />
<STYLE TYPE="text/css">
.light
{
background-color: #FFFFFF;
color: #333333;
font-size: 12px;
font-weight: normal;
text-decoration: none;
vertical-align:top;
padding: 3px 5px 3px 5px;
}

.dark
{
background-color: #EEEEEE;
color: #333333;
font-size: 12px;
font-weight: normal;
text-decoration: none;
vertical-align:top;
padding: 3px 5px 3px 5px;
}
</STYLE>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="sponsors"/>
<jsp:param name="tabLev3" value="sun"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<div align="center"><img src="/i/tournament/tco05/sun_logo.gif" alt="Sun" border="0" /></div>
<br><br>
One hour prior to <A href="/?RoundId=8000&t=schedule&c=srm">SRM 267</A> on October 5th, Joe Nuxoll from Sun Microsystems&#174; will be in arena to chat about JSF components and Java Studio Creator.  The chat starts at 8:00PM EDT.
<br><br>
<strong>Already a TopCoder Member?</strong><br>
Launch the Arena.
<br><br>
<strong>Not Yet a TopCoder Member?</strong><br>
Click <A href="/Registration">here</A> to register as a TopCoder member.<br>
Check your email and activate your new TopCoder account.<br>
Launch the Arena.
<br><br>
<strong>How to Launch the Arena</strong><br>
Launch the Arena as an <A class="bodyText" href="Javascript:arena()">Applet</A> or as a <A class="bodyText" href="/contest/arena/ContestAppletProd.jnlp">Java Web Start Application</A><br/>
Don't have JWS? <A class="bodyText" href="http://java.sun.com/products/javawebstart/index.html" target="_blank">Download</A> it on java.sun.com<br/>
Check out the <A class="bodyText" href="/?t=arena&amp;c=plugins">plugins</A> available for the Competition Arena
<br><br>

        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tco05"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
