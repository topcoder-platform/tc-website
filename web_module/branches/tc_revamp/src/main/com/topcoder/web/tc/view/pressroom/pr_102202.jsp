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

<P><B>TopCoder Expands to Include Employment Services</B><BR/>
Host of Computer Programming Contests Offers More to Members and Clients</P>

<P>
<B>GLASTONBURY, CT., Oct. 22, 2002</B> - TopCoder, Inc., a company committed to identifying and promoting computer programming talent through competition, today announced it has expanded its business offering to include employment services. <A HREF="/corp/?module=Static&amp;d1=corp&amp;d2=tces_home" CLASS="bodyText">TopCoder Employment Services (TCES)</A> is designed to improve an organization's often-inefficient hiring process by providing an unmatched method to identify proficient computer programmers.
</P>

<P>
"We hear from companies every day that receive thousands of resumes each week and dedicate significant resources to find qualified candidates amongst a mountain of paper," said Paul Moriarty, director, employment services for TopCoder. "When hiring programmers, companies lack objective data and history of work samples, which are critical measures in assessing skills and projecting productivity.  TopCoder Employment Services provides recruiters and hiring engineers with an unprecedented amount of quick, valuable information to make more informed decisions about a candidate's abilities."
</P>

<P>
<B>TCES Candidate Recruiting Program</B><BR/>
During the hiring process, companies typically ask engineers to screen candidates for technical prowess, yet those engineers are provided with little technical information about the candidate's programming ability.  TopCoder's Candidate Recruiting Program provides companies with that information.  Data about the TopCoder member base, recently described by Business 2.0 as "one of the richer databases of programming talent ever assembled," effectively supplements a company's recruiting and screening efforts.
Since launching this service in September of 2002, several companies have enlisted in TopCoder's Candidate Recruiting Program; General Electric, NVIDIA Corporation, Google, Apex Data Services and the FBI are using this program in their hiring efforts.
</P>

<P>
"The FBI has a heightened need to attract and identify the nation's top technical talent for our computer scientist special agent position as well as professional support positions," said special agent Joe Bross, who manages national recruiting for the FBI.  "We look to TopCoder to help us in this critical mission."
</P>

<P>
"Given the concentration of TopCoder members at the most elite computer science schools in the country, we're using TCES to identify candidates for our information management leadership program," said Steve Canale, manager, recruiting and staffing services for General Electric.
</P>

<P>
"TopCoder Employment Services taps into a unique pool of talent," said Jay Berkenbilt, vice president, software engineering at Apex, and himself a TopCoder member since January 2002.  "By attracting the kind of person who loves to write code, TopCoder
Employment Services has been able to provide more technically qualified programming candidates for Apex than all our other recruiting sources combined."
</P>

<P>
Companies enlist in the TCES Candidate Recruiting Program for terms of 3 to 12 months.  Based on the duration of the program, companies post job descriptions at www.topcoder.com.  TopCoder members respond to desired positions, and the responses are managed via an easy-to-navigate reporting and tracking application.  Each company creates a private database of interested candidates, which contains specific information about each TopCoder member that has applied, including competition statistics, code samples and resume information.  Unlike traditional job sites that offer nothing in the way of skills assessment, TopCoder's system allows employers to find developers with specific skills and an ability to determine proficiency within that skill set.  This dramatically reduces the amount of time involved in verifying proficiency.
</P>


<P><BR/></P>
<P>
<B>About TopCoder Employment Services (TCES)</B><BR/>
TCES provides companies with an unprecedented way to identify and differentiate skilled programmers.  By providing technical information about employment candidates, TCES enables recruiting and hiring personnel to be more efficient, save time and employ more productive hires.  Subscribing companies post jobs, and TopCoder members respond directly, at www.topcoder.com. </P>

<P>
<B>About TopCoder, Inc.</B><BR/>
TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members.  With a global membership database, TopCoder members extend across all professional and collegiate levels.  The best performing members are invited to compete in annual tournaments.  The attraction of competition and the associated rewards create a powerful community of programmers.  Access to this community is granted to corporate partners who both promote and profit from the relationship.  For more information and registration details visit www.topcoder.com.</P>



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
