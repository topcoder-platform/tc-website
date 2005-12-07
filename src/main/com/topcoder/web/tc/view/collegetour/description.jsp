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

      <div align=center>
      <img src="/i/collegetour/collegetour_promo.gif" alt="TopCoder College Tour" border=0 clear="all">
      </div>
          
      <p>
      <h2>2006 TopCoder U.S. College Tour</h2>

      <h3>Is your school on the schedule? <div style="align: right;"><tc-webtag:forumLink forumID="505834" message="Discuss College Tour" /></div></h3>
      
      TopCoder will be touring the U.S. during 2006 to promote TopCoder programs and to grow membership.  We're looking for college CS programs who are interested in hosting TopCoder on campus for an evening of problem solving, food, prizes and fun.
      
      <h3>How will the College Tour work?</h3>
      Each selected campus will receive a visit from TopCoder during a regularly scheduled SRM.  TopCoder will provide a private registration path for each campus prior to the SRM.  At the time of the SRM, the registered students will gather in a computer lab and compete in their own room during the SRM, with everyone solving the same problems.  Everyone who registers and attends the SRM will receive a TopCoder t-shirt and the top performers will receive other prizes.  TopCoder will also provide pizza and beverages for all in attendance.
      <br/><br/>
      Prior to the SRM, TopCoder will provide the school with a web page dedicated to their event, to be used for promotional and informational purposes.  Additionally, TopCoder will provide flyers to be printed and hung around campus to attract attention.
      <br/><br/>
      At the conclusion of the SRM, a TopCoder representative will talk about the benefits of being involved with TopCoder:
      
      <ul>
      <li><strong>SRMs:</strong>  Win cash prizes and chat before the competition with sponsors interested in hiring TopCoder members</li>
      <li><strong>Component Projects:</strong>  Get paid for designing and/or developing real software projects that are used in applications for TopCoder clients</li>
      <li><strong>TopCoder Software:</strong>  Consulting and full-time employment possibilities.</li>
      <li><strong>TopCoder Employment Services:</strong>  Learn how the leading technology companies - Google, Yahoo, Microsoft, National Security Agency, Sun Microsystems, NVIDIA, VeriSign, Motorola, etc. - hire elite talent and how many positions there are available.</li>
      <li><strong>TopCoder tournaments - TopCoder Open & TopCoder Collegiate Challenge:</strong>  Win huge cash prizes, major recognition, and an all-expenses paid trip to the onsite finals with other top-notch programmers from around the world.</li>
      </ul><br/>
      
      Interested in coordinating this event at your school?  Contact <A href="mailto:collegetour@topcoder.com">collegetour@topcoder.com</a> today!      
      
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
