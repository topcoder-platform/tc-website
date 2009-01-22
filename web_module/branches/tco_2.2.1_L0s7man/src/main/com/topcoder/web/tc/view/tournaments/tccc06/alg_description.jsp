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
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="details"/>
<jsp:param name="tabLev3" value="description"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<span class="bigTitle">2006 TopCoder Collegiate Challenge - Algorithm Competition</span>
<br><br>
The TCCC is here, so let the battle of the universities begin!  TopCoder is excited to launch our new and improved Algorithm tournament.  This time you have three chances to qualify!
<br><br>
<span class="bodySubtitle">Registration</span><br>
Begins: August 28, 2006 9:00AM EDT<br>
Ends: September 12, 2006 6:00PM EDT<br>
In order to compete in any qualification round or to auto-qualify, you must be registered for the competition.
<br><br>

<span class="bodySubtitle">Qualification Round</span><br>
Qualification Round 1: Thursday, September 7 at 7:00AM EDT<br>
Qualification Round 2: Saturday, September 9 at 1:00PM EDT<br>
Qualification Round 3: Tuesday, September 12 at 9:00PM EDT
<br><br>

<span class="bodySubtitle">Online Elimination Rounds</span><br>
<b>Round 1</b><br>
Section A - Thursday, September 21 at 7:00AM EDT<br>
Section B - Saturday, September 23 at 1:00PM EDT<br>
Section C - Wednesday, September 27 at 9:00PM EDT
<br><br>
<b>Round 2</b><br>
Section A - Thursday, October 5 at 7:00AM EDT<br>
Section B - Saturday, October 7 at 1:00PM EDT<br>
Section C - Wednesday, October 11 at 9:00PM EDT
<br><br>
<b>Round 3</b><br>
Saturday, October 14 at 1:00PM EDT
<br><br>

<span class="bodySubtitle">Onsite Finals</span><br>
November 15 - 17, 2006<br>
San Diego Marriott Mission Valley, San Diego, California, USA
<br><br>
The competition is free and you must be 18 years or older as well as a matriculated full-time student at an accredited college or university to be eligible.
<br><br>
<%--
<span class="bodySubtitle">New to the 2006 TCCC - the TCCC Complete Coder Incentive Program!</span>
<br><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=ccip_description">Learn how</A> you can earn more prize money by participating in both Component and Algorithm competitions.
<br><br>
<span class="bigTitle">How to Register for the Algorithm Competition</span>
<br><br>
<strong>Already a TopCoder Member?</strong><br>
Click <A href="/tc?module=TCCC06ViewAlgoReg">here</A> to register for the TCCC Algorithm Competition.
<br><br>
<strong>Not Yet a TopCoder Member?</strong><br>
Click <A href="/reg/">here</A> to register as a TopCoder member.<br>
Check your email and activate your new TopCoder account.<br>
Click <A href="/tc?module=TCCC06ViewAlgoReg">here</A> to register for the TCCC Algorithm Competition
<br><br>
--%>

See the official <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_rules">rules and regulations</A> for full details.
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