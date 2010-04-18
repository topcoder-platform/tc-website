<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Tournaments</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
function changeImage(image, newImage) {
document[image].src=newImage;
return;
}
function open_window(url) {
mywin =
window.open(url,"win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');
}
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div style="margin: 0px 10px 0px 10px;">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="press_room"/>
    <jsp:param name="title" value="TopCoder Press Release"/>
</jsp:include>

<div align="center">
<h3>TopCoder and the Connecticut Association of Schools Announce the 2003 TopCoder High School Challenge</h3>
<p>Java(tm), C&#43;&#43; and C&#35; Computer Programming Tournament Will Crown the Best High School 
Programming Team in Connecticut</p>
</div>

<p><strong>GLASTONBURY, CT&#151;May 14, 2003&#151;</strong>TopCoder, Inc., the leader in promotion of 
programming talent through on-line competition, today announced the final round of the 
<a class="bodyText" href="http://highschool.topcoder.com/">2003 TopCoder High School Challenge.</a>  It will be 
held on Tuesday, May 20th at the University of Connecticut's Storrs campus in the Homer Babbidge Library. This computer 
programming tournament is made possible due to the collaborative efforts of TopCoder, Inc. and the Connecticut 
Association of Schools (CAS).</p>

<p>"UConn is proud to support the 2003 TopCoder High School Challenge.  This initiative captures the interest of bright 
high school students here in Connecticut, and promotes their interest in technology.  We look forward to seeing them here 
next week," said Peter Murray, UConn's Director of Library Information Services.</p>

<p>The 2003 TopCoder High School Challenge began in March with an eight-week schedule of qualifying rounds.  These 
competitions welcomed dozens of Connecticut's best young programmers to compete online, in real time, each week.  
Ten Connecticut high school teams have qualified to compete in the tournament finals.  To be eligible for the finals, at 
least three programmers from each school must have competed in four of the eight qualifying rounds.  During these 
qualifying rounds, the average of the top three scores from each school was used to determine which school would win 
for the week.</p>

<p>"The endorsement from CAS has allowed us to offer this real-world, high-tech competition to Connecticut High 
School students.  The 2003 TopCoder High School Challenge brings to these incredibly talented high school students 
the same platform that TopCoder offers to college students and professionals each week," said Rob Hughes, president of 
TopCoder.  "The high school tournament's eight week season has been exciting so far, but the thrill of competition will 
intensify when the coders are together competing head-to-head at UConn."</p>

<p>"CAS is delighted to be able to offer a credible and exciting academic competition to Connecticut high school students.  
With this event, we're seeing the same positive benefits derived from competition among students representing their 
schools that we've seen in athletics," said Mike Savage, executive director of CAS.  "It's great that we're able to partner 
with TopCoder to put technology and real world problems in the hands of high school students.  We are looking forward to 
seeing a great competition at UConn."</p>

<p><br /></p>

<p><strong>About TopCoder, Inc.</strong><br />
TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  
TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated 
rewards create a powerful community of programmers.  Corporate partners access this member base for employment, 
software development and sponsorship.  For registration details or information regarding TopCoder Software, TopCoder 
Employment Services or sponsorship of TopCoder Events, please visit <a class="bodyText" href="http://www.topcoder.com">www.topcoder.com.</a></p>

<p><strong>About the Connecticut Association of Schools</strong><br />
The Connecticut Association of Schools is chartered by the State of Connecticut as a non-profit, tax-exempt educational 
organization serving schools, their students and staff, in all areas of operation.  CAS has emerged as an informed leader 
within Connecticut's education system, providing services to well over 1,100 member schools in areas ranging from 
academics to athletics.  CAS' mission is to serve as advocates for children while striving to strengthen the professional 
skills and talents of the school leaders of Connecticut.</p>

<p>###</p>



   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
