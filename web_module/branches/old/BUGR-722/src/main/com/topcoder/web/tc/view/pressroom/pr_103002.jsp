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

<P><B>TopCoder Competitions Expand to High Schools</B><BR/>
Host of Computer Programming Contests Offer Team Competitions at Connecticut High Schools;
Connecticut Association of Schools (CAS) is the Premier Supporter of Academic Competitions
</P>

<P>
GLASTONBURY, CT., Oct. 30, 2002 - TopCoder, Inc., the leader in on-line programming competition and skills assessment, today announced it has partnered with the Connecticut Association of Schools (CAS) to expand its competitions to the high school level.  These competitions will be a means for academically inclined students to showcase their skills alongside classmates during statewide team competition, and are a natural expansion of TopCoder's competitions given the success of its model at the collegiate and professional levels.    
</P>

<P>
"We are excited about our collaboration with the CAS," said Drew Vaughn, vice president for TopCoder, Inc.  "The executive group of the Connecticut Association of Schools has proven that they are at the forefront of promoting academic excellence alongside athletics in team competitions." 
</P>

<P>
<B>Coding as a High School Sport</B><BR/>
"TopCoder's competition platform will allow students to compete in an academic arena, a direction in which we have been looking to expand. Being able to provide a means for students to represent their respective high schools and compete for school pride in a manner that has not previously been available is very exciting for us," said Mike Savage, Executive Director of CAS.  "Expanding into the high school arena allows TopCoder to deepen its member base and continue to rate the computer scientists of tomorrow.  The Connecticut Association of Schools is proud to promote excellence in mathematics and computer science through this academic team sport."
</P>

<P>
At www.topcoder.com, students will compete online in real-time against students from other schools. Using Java, C++ or C#, the most widely used programming languages in the technology workplace today, contestants will write solutions to algorithmic problems under tight time constraints.  
Scores will be calculated using TopCoder's objective assessment model and unique rating system, designed to fairly and accurately gauge a contestant's performance.  Winning teams will be comprised of individuals who were the fastest to solve the problems with code that withstood the scrutiny of other contestants and TopCoder's system test.  
</P>

<P>
Competing students will receive a rating based upon their performance in the competitions.  This rating is a true indicator of programming talent and problem solving skills.  This competitive experience offers students a way to differentiate themselves in the college admission process, and enables colleges to determine the most proficient programmers at a high school level for admission to their computer science and/or engineering programs. 
</P>

<P>
There is no sign-up fee for schools or students. The program will be funded through corporate sponsorship.  Interested companies should contact Drew Vaughn at (860) 633-5540 or <A HREF="mailto:dvaughn@topcoder.com" CLASS="bodyText">dvaughn@topcoder.com</A>.  
</P>

<P><BR/></P>

<P>
<B>About TopCoder, Inc.</B><BR/>
TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members.  With a global membership database, TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated rewards create a powerful community of programmers.  Access to this community is granted to corporate partners who both promote and profit from the relationship.  For more information, visit www.topcoder.com.</P>

<P>
<B>About the Connecticut Association of Schools</B><BR/>
The Connecticut Association of Schools (CAS) is chartered by the State of Connecticut as a non-profit, tax-exempt educational organization serving schools, their students and staff, in all areas of operation.   CAS has emerged as an informed leader within Connecticut's education system, providing services to well over 1,100 member schools in areas ranging from academics to athletics.  CAS's mission is to serve as advocates for children while striving to strengthen the professional skills and talents of the school leaders of Connecticut. 
</P>



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
