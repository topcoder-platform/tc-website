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
<jsp:param name="tabLev2" value="join_us"/>
<jsp:param name="tabLev3" value="dev_forums"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<span class="bigTitle">Developer Forums</span>
<br><br>
Are you attending the TCCC finals as a spectator or finalist? Either way, 
be sure to attend the Developer Forums. This year's TCCC features three 
rewarding topics:
<br><br>

<span class="bodySubtitle">Wednesday, November 15</span>
<br><br>
<b>3:00PM - 4:00PM<br>
Applying the TopCoder Philosophy to New Frontiers</b><br>
Two TopCoder clients have utilized the core TopCoder philosophies -- 
competition-based business models and objective rating systems - as a 
means of assessing performance and reducing risk. In the first part of 
the forum, Aizling will discuss how the company based its revolutionary 
approach to nursing and the healthcare industry on a competition model, 
feedback system, and shift matching logic. Next up will be Equitrader, 
which will review its simulated trading competitions, its rating system, 
and new technology that enables members to create autonomous trading bots. 
How does the TopCoder approach apply to staffing a medical facility or 
trading stocks? Join in the discussion, and find out!
<br><br>
<span class="bodySubtitle">Thursday, November 16</span>
<br><br>
<b>3:00PM - 4:00PM<br>
Estimating Project Size</b><br>
How long will this take? How much money will it cost? These two simple 
questions can be infuriatingly difficult to answer, especially when it comes 
to an enterprise software project. But there's hope, thanks to the "Use 
Case Points" methodology. Use Case Points can help evaluate a project's 
scope - based on the Use Cases and Actors outlined in the Use Case model - 
as well as a project's complexity. This forum will discuss the features of 
the Use Case Points approach, and highlight how it has been applied to 
TopCoder projects.
<br><br>
<span class="bodySubtitle">Friday, November 17</span>
<br><br>
<b>1:00PM - 2:00PM<br>
Overview of Recent TopCoder Projects</b><br>
New clients and projects have expanded TopCoder's presence in a variety 
of market spaces, from energy and insurance to finance, healthcare, media, 
and retail. TopCoder has built a variety of applications - including data 
warehousing, internal, integration, and mobile device systems - using new 
and emerging technologies like J2ME, RFID, and AJAX. For each project, 
TopCoder has applied its software development methodology to build 
reliable, scalable solutions - and, by leveraging TopCoder's component 
library, these projects have been completed for less money and with fewer 
bugs. In this forum, learn more about the diverse array of projects 
TopCoder is tackling, and what we've learned by applying our methods 
to a wide range of industries. 
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
