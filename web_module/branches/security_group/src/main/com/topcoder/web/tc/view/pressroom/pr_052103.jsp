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
<h3>TopCoder and CAS Announce Amity Regional Senior High School As the Connecticut High School State Champion Programming Team</h3>
Java<span class="super">TM</span>, C&#43;&#43; and C&#35; Computer Programming Tournament Concludes; Amity Regional is Connecticut's Best High School Programming Team

</div>

<p><strong>STORRS, CT&#151;May 21, 2003&#151;</strong>TopCoder, Inc., the leader in promotion of 
programming talent through online competition, today announced the winning team of the 2003 TopCoder High School 
Challenge.  Amity Regional Senior High School out-performed 7 other Connecticut high school teams to claim the 
victory in the tournament, which concluded yesterday at UConn's Homer Babbidge Library.  "UConn was thrilled to 
host this programming competition.  The computer lab in the Babbidge library is ideally suited for such an event, and 
we were proud to have these accomplished high school students demonstrate their skills here at UConn," said Peter 
Murray, UConn's Director of Library Information Services.</p>


<p>Amity clinched the title with a score of nine points (the lowest point total wins).  This score bested their closest 
challenger, Norwich Free Academy, who finished with a score of twenty-eight points.  Tolland High School finished 
third with a score of thirty-two points.</p>

<p>The Amity team was made up of senior Dany Qumsiyeh, and juniors Nathan Perelman and Bradford Galiette.  The 
team's coach, Frank Barretta, has been with the school for three years as a faculty member in the Mathematics/Computer 
Science Department.  In addition to coaching this championship programming team, Coach Barretta is also an Amity 
youth football coach.  "My team is pretty modest.  They claim that they are not really better programmers than the 
others here today, rather they simply drank more Coke," said Barretta with a smile.  He continued by saying, "This 
accomplishment is the result of the tremendous amount of effort they've put forth to be the best.  They are obviously 
very bright kids and when you combine that with the hard work and great competitive attitudes, well, I'm just glad 
that it all paid off today.  I'm proud of the whole team and we are all grateful to TopCoder, CAS and UConn for hosting 
such a great event.  We are looking forward to next year."</p>

<p>The 2003 TopCoder High School Challenge began in March with an eight-week schedule of qualifying rounds.  
These competitions saw dozens of Connecticut's best young programmers competing online in real time each week.  
To be eligible for the finals, at least three coders from each school must have competed in four of the eight qualifying 
rounds.  During these qualifying rounds, the average of the top three scorers from each school was used to determine 
which school would win for the week.  For more details and photos of the competition, please visit 
<A href="http://highschool.topcoder.com" targe="_blank">http://highschool.topcoder.com</A>.</p>

<p>"This competition brings the same platform that we use for college students and professionals every week to these 
incredibly talented high school students," said Rob Hughes, President of TopCoder, Inc.  "It is clear that these students 
will be amongst the best and the brightest at whatever institution they pursue following high school.  I'm sure we will 
see some of these same students in our collegiate and professional tournaments in years to come."</p>

<p>"CAS strives to bring academic competitions to the same level of excitement as high school athletic events here in 
Connecticut.   The 2003 TopCoder High School Challenge has allowed us to take a giant step in that direction," said Mike 
Savage, Executive Director of CAS.  "Putting technology and real-world problems in the hands of these high school 
students created a great competition."</p>

<p><br /></p>

<p><strong>About TopCoder, Inc.</strong><br />
TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  
TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated 
rewards create a powerful community of programmers.  Corporate partners access this member base for employment, 
software development and sponsorship.  For registration details or information regarding TopCoder Software, TopCoder 
Employment Services or sponsorship of TopCoder Events, please visit <a class="bodyText" href="http://www.topcoder.com">www.topcoder.com.</a></p>

<p><strong>About the Connecticut Association of Schools</strong><br />
The Connecticut Association of Schools is chartered by the State of Connecticut as a non-profit, tax-exempt educational 
organization serving schools, their students and staff, in all areas of operation. CAS has emerged as an informed leader 
within Connecticut's education system, providing services to well over 1,100 member schools in areas ranging from 
academics to athletics. CAS' mission is to serve as advocates for children while striving to strengthen the professional 
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
