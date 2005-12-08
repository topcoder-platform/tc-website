<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder College Tour</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value=""/>
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="cardCell" width="100%" align="center">
<div class="myTCBody">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="college_tour"/>
<jsp:param name="title" value="Overview"/>
</jsp:include>

      <div align=center>
      <img src="/i/collegetour/college_logo.gif" alt="College Logo" border=0 clear="all">
      </div>

      <p>
      <h2>TopCoder College Tour SRM Overview</h2>
      
      <h3>The Event</h3> 
      TopCoder is sponsoring an onsite programming competition at SCHOOL NAME on SRM DATE. <br/><br/>
      
      <span class="bigRed">The last date for sign up for the event is DAY BEFORE SRM DATE.</span><br/><br/>
      
      The event is from SRM START TIME -30 MINS until SRM START TIME +120 MINS in the NAME OF BUILDING/LAB. This event is being run in conjunction with <A href="/?RoundId=8078&t=schedule&c=srm">SRM #281</A>. In addition to registering with TopCoder, all competitors must register <A href="//tc?module=registrants.jsp">here</a> and be onsite for the competition. After the event ends, pizza will be served and a TopCoder representative will be present to discuss TopCoder competitions and employment services. 
      
      <h3>Prizes</h3>
      
      <ul>
      <li>1st place prize - TBD </li>
      <li>2nd place prize - TBD </li>
      <li>3rd place prize - TBD </li>
      </ul><br/>
      
      All competitors will receive a TopCoder t-shirt.  Placement in the SRM will be determined by the total number of points at the conclusion of the SRM.  The competitor with the highest total positive (i.e., greater than zero) points will finish in 1st place.  The overall winner will receive the 1st place prize, the 2nd place finisher will receive the 2nd place prize, and the 3rd place finisher will receive the 3rd place prize.  
      
      <h3>Event Schedule</h3>
      
      The timeline for the day of the event: 
      <ul>
      <li>SRM START TIME -30 MINS - Computer lab opens & competitors set up  </li>
      <li>SRM START TIME - Competition starts  </li>
      <li>SRM START TIME +95 MINS - Competition ends  </li>
      <li>SRM START TIME +100 MINS - Pizza, Results, TopCoder presentation </li>
      </ul><br/>
      
      <strong>RECRUITER NAME</strong>, a TopCoder representative, will be present to explain the TopCoder algorithm, design and development competitions, TopCoder Employment Services, and other aspects of TopCoder. 

      <br/><br/>
      </p>

</div>

</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
