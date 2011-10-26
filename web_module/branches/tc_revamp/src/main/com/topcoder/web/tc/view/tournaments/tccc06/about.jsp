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
<jsp:param name="tabLev2" value="details"/>
<jsp:param name="tabLev3" value=""/>
</jsp:include>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<span class="bigTitle">2006 TopCoder Collegiate Challenge</span>
<br><br>
Calling all college students! Welcome to the 2006 TopCoder Collegiate Challenge - the tournament that gathers the most talented college minds for an academic challenge. We are excited to announce $200,000 worth of prize money and two competitions worth your while. This year's TCCC will conclude in sunny San Diego, so get your beach gear and sun glasses ready.
<br><br>
<span class="bodySubtitle">Here's what you'll need to know:</span><br>
<ul>
<li>Algorithm Competition
<ul><li>Registration begins August 28, 2006</li></ul></li>
<li>Component Design Competition 
<ul><li>Registration begins July 31, 2006</li></ul></li>
<li>Component Development Competition
<ul><li>Registration begins July 31, 2006</li></ul></li>
</ul>
Not a TopCoder Member? You need to be one to participate. <A href="/reg">Join now.</A>
<br><br>
<span class="bodySubtitle">TCCC Competitors:</span><br>
All registered TopCoder members over the age of 18 who are matriculated full time at an accredited college or university may compete.
<br><br>
<span class="bodySubtitle">TCCC Finals:</span><br>
November 15 - 17, 2006 at the San Diego Marriott Mission Valley, San Diego, California, USA
<br><br>
<span class="bodySubtitle">TCCC Prize Money:</span><br>
Prizes for the Algorithm and Component competitions total $200,000
<br><br>
<%--
<span class="bodySubtitle">Want to win a trip to the TCCC?</span><br>
Refer your friends and classmates to TopCoder, and you could be our top <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=student_reps">Student Representative</A>.
<br><br>
--%>
<%--<span class="bodySubtitle">Don't forget to take part in the 2006 TCCC Complete Coder Incentive Program!</span><br>
<A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=ccip_description">Learn how</A> you can earn more prize money by participating in both Component and Algorithm competitions.
<br><br>--%>
See the official <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_rules">Algorithm</A> and <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_rules">Component</A> rules and regulations for full details.
<br><br>
<span class="smallText">This tournament is brought to you by TopCoder, Inc. (<A href="/">http://www.topcoder.com/</A>) 703 Hebron Avenue (now 95 Glastonbury Blvd), Glastonbury, CT 06033. AOL LLC is not responsible for any aspect of the Tournament.</span>
<br><br>
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
