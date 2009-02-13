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
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="student_reps"/>
<jsp:param name="tabLev3" value="details"/>
</jsp:include>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<span class="bigTitle">Student Representatives</span>
<br><br>
It's that time of year again - time to start advertising for the 2006 TopCoder Collegiate Challenge, Sponsored by AOL.  We want participation in the TCCC06 to reach record levels, and we need your help in order to make that happen. TopCoder wants Student Representatives for colleges and universities world wide!
<br><br>
<span class="bodySubtitle">What would your responsibilities be as a Student Rep?</span><br>
Your sole responsibility would be to help increase the number of participants in the 2006 TopCoder Collegiate Challenge. To help you achieve that goal, TopCoder will provide you with flyers to hand out to your classmates around campus. Click <A href="Javascript:openWin('/tc?module=Static&d1=tournaments&d2=tccc06&d3=flyer_front','comp',380,530);">here</A> to see the flyer.
<br><br>
<span class="bodySubtitle">What do you get for being a Student Rep?</span><br>
<ol>
<li>We will send a Limited Edition 2006 TopCoder Collegiate Challenge student Rep t-shirt to each Rep who gets at least one person from his/her school to register as a TopCoder member and compete in the Qualification Round of the Algorithm Competition or submit during the Component Design & Development Competition of the TCCC06. Each person must state your handle as the reason for registering at TopCoder.</li>
<li>The Rep who gets the most new people to register at TopCoder and compete in the TCCC06 will receive a trip to attend the onsite finals of the TCCC06 in San Diego, California, November 14 - 17, 2006. See <A href="Javascript:openWin('/tc?module=Static&d1=about&d2=student_rep_rules','comp',530,500);">official rules</A> for details.</li>
</ol>

<span class="bodySubtitle">How to get started:</span><br>
<ol>
<li><A href="mailto:jdamato@topcoder.com">Contact us</A> if you're interested in advertising for TopCoder on your campus*.</li>
<li>Include the name of the college/university you will be distributing flyers to.</li>
<li>Include your TopCoder handle.</li>
<li>Include your full name and postal mailing address in the e-mail. This will be the address where the flyers are sent.</li>
</ol>

*There is no limit to the amount of Reps on one campus.  You don't even have to be a college/university student to participate!
 
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
