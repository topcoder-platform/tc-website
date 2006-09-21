<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="details"/>
<jsp:param name="tabLev3" value="description"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
<span class="bigTitle">2006 TopCoder Collegiate Challenge - Component Design and Development Competition </span>
<br><br>
<span class="bodySubtitle">Registration</span><br>
Begins: July 31, 2006 9:00AM EDT<br>
Ends: September 14, 2006 9:00AM EDT
<br><br>

<span class="bodySubtitle">Online Rounds</span><br>
August 17, 2006 - September 14, 2006
<br><br>

<span class="bodySubtitle">Online Finals</span><br>
October 5, 2006 - November 2, 2006
<br><br>

<span class="bodySubtitle">Onsite Finals</span><br>
November 15-17, 2006<br>
San Diego Marriott Mission Valley, San Diego, California, USA 
<br><br>
The competition is free and you must be 18 years or older as well as a matriculated full-time student at an accredited college or university to be eligible.
<br><br>
See the official <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_rules">rules and regulations</A> for full details.
<br><br>
<%--
<span class="bigTitle">How to Register for the Component Competition</span>
<br><br>
<strong>Already a TopCoder Member?</strong><br>
Click <A href="/tc?module=TCCC06ComponentTerms">here</A> to register for the TCCC Component Design and Development Competition.
<br><br>
<strong>Not Yet a TopCoder Member?</strong><br>
Click <A href="/reg/">here</A> to register as a TopCoder member.<br>
Check your email and activate your new TopCoder account.<br>
Click <A href="/tc?module=TCCC06ComponentTerms">here</A> to register for the TCCC Component Design and Development Competition
--%>
<br><br><br><br>
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
