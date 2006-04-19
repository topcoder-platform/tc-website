<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="join_us"/>
<jsp:param name="tabLev3" value="pickme"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">

<span class="bigTitle">I feel you should "pick me" to receive a free trip to the TCO 2006</span>
<br><br>
<img src="/i/m/dplass_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="251184" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
I feel you should "pick me" to receive a free trip to the TCO 2006 because I have "earned" this trip already for a variety of reasons. 
<br><br>
First of all, last year, in the 2005 TCO CDDC, I had enough points to compete in the on-line development finals, but had a conflict with both the on-line finals and on-site finals.  As a result, I missed out on the trip to the on-site finals last year.  If I could go on-site this year, it would be as if I had made it both last year AND this year.  (Unfortunately, this year, I got sick during week 2 of the CDDC and didn't recover enough to enter in either week 2 or week 3.  Since my week 1 submission came in 6th place, I wasn't able to submit enough to make it into the top 8 this year.)
<br><br>
Secondly, I am an AVID TopCoder fanatic.  I have competed in 70 algorithm competitions over the last 5 years, I almost never miss a night-time (eastern-time) SRM.    Also, I have submitted over a dozen design and development competitions (combined)  and I have won seven of those competitions, providing quality designs and implementations of TopCoder components for its customers.  To improve the TopCoder community in general, I have made over 2000 posts to the forums, pointing out bugs on the website, answering questions, and having a good time with the other coders there, which fosters happy feelings among the user base.  Meeting many other "famous" TopCoders in person would be an added thrill - while I have made "friends" with them online, I have yet to meet any of the "in real life". 
<br><br>
Thirdly, I already write about my TopCoder "adventures" on my blog at Livejournal.com.   My personal blog contains my own triumphs (and frustrations), and I participate in a community which writes their own reviews of the problems in the SRMs and discusses other algorithms.  Similarly, I have already been written about in the media with my TopCoder adventures. I was interviewed by Inc magazine (January 2006 issue) regarding my TopCoder experience in both design/development and algorithms. Sending me to Las Vegas will allow us to build upon this publicity and I would easily be able to provide the required blog entries.
<br><br>
Finally, I would really like to win the trip to meet all the great TopCoder employees who have been so helpful and hard-working (especially <tc-webtag:handle coderId="132456" darkBG="true" />, <tc-webtag:handle coderId="7267401" darkBG="true" /> and <tc-webtag:handle coderId="156859" darkBG="true" />) so I can thank them in person for putting up with me and providing, and improving, such a great website.  Meeting Mr. Hughes  in person would also be an added "plus".
<br><br>
So, as you can see, I am "the ideal candidate!"  I look forward to meeting all of you in person in May. :-)
<br><br>
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
