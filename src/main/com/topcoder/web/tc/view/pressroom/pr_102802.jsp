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

<P><B>Field Announced for 2002 TopCoder Invitational</B><BR/>
Programmers From Around the World to Vie for a Share of $150,000</P>

<P>
GLASTONBURY, CT., Oct. 28, 2002 - TopCoder, Inc., the leader in on-line programming competition and 
skills assessment, today announced the field of 64 finalists for the 2002 TopCoder Invitational.  
The tournament, which will award cash prizes totaling $150,000, began on October 8th and will culminate 
with the final rounds of competition being held November 22nd - 23rd at the Mohegan Sun Casino in Connecticut. 
"Mohegan Sun is pleased to host the final rounds of the 2002 TopCoder Invitational," said Mitchell Etess, 
executive vice president of marketing at Mohegan Sun.  "We welcome TopCoder and all the finalists to our 
facility, and we look forward to the exciting competition ahead."
</P>

<P>
<B>64 Finalists Emerge From Field of Over 1,000 Programmers</B><BR/> 
The 2002 TopCoder Invitational kicked off earlier this month with over 1,000 of the highest-rated 
TopCoder members from around the world competing for the chance to advance in the annual tournament.  
Four online eliminations rounds were held this month.  These elimination rounds resulted in a field of 64 emerging as the best coders in the world.  The 64 competitors will next compete on Wednesday, October 30th, with the 16 highest scoring members in that round advancing to the semifinal round of the tournament.  The "sweet 16" will compete in the tournament's final onsite rounds and will vie for the $50,000 grand prize.  The Semifinal and Championship rounds will be held November 22nd and 23rd at the Mohegan Sun Casino.  
</P>

<P>
<B>The Best of the Best</B><BR/>
Some fierce competition transpired this month during the online rounds, and there are some repeat appearances by some TopCoder veterans.  The reigning TopCoder Invitational Champion, Jon McAlister, has advanced to the field of 64.  The Stanford University senior, along with his classmate, Daniel Wright, continues to dominate the field.  Wright is also a veteran of TopCoder tournaments, as he won the 2002 Sun Microsystems and TopCoder Collegiate Challenge held this past April.  Wright and McAlister are seeded 8th and 23rd, respectively, in the tournament.
</P>

<P>
Five out of the top 10 tournament competitors are college students.  Reid Barton (seeded 2nd) is a sophomore at MIT.  John Dethridge (seeded 4th) has a long trip if he advances to the finals.  Dethridge is pursing his doctorate degree from the University of Melbourne in Australia.  Nathan Paymer (seeded 7th) is a senior at the California Institute of Technology.  Paymer was also a semifinalist in the 2002 Sun Microsystems and TopCoder Collegiate Challenge.  The 10th seed in the tournament is Chuong Do, a junior at Stanford University.
</P>

<P>
Although the tournament is open to both student and professional TopCoder members, college students dominate the field with 43 competitors.  The top three schools (and the number of students from each) that are represented in the 2002 TopCoder Invitational are:  MIT (7), Stanford (5), and the California Institute of Technology (3).
</P>

<P>
This is the second annual Invitational, and fourth major programming tournament hosted by TopCoder.  TopCoder's previous tournaments, and the individuals who won each tournament, are:
<UL>
<LI> 2001 TopCoder Collegiate Challenge (June 2001):  won by Jason Woolever, a graduate student from MIT and currently a Senior Research and Development Engineer at Synopsys, Inc. of Sunnyvale, California.  </LI>
<LI> 2001 TopCoder Invitational (November 2001): won by Jon McAlister, currently a senior at Stanford University</LI>
<LI> 2002 Sun Microsystems and TopCoder Collegiate Challenge (April 2002): won by Daniel Wright, currently a senior at Stanford University.</LI>
</UL>
</P>

<P>
"TopCoder is the authority on identifying developers with specific skills and determining their proficiency within that skill set," said TopCoder chairman and founder, Jack Hughes.  "With our membership now representing over 20,000 collegiate and professional developers working in state of the art technologies from around the world, we have been extremely pleased with our growth.  It is amazing to watch developers at this skill level compete.  All of those that have made it to this round of 64 have shown themselves to be some of the best in the world."    
</P>

<P><BR/></P>

<P>
<B>About TopCoder, Inc.</B><BR/>
TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members.  With a global membership database, TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated rewards create a powerful community of programmers.  Access to this community is granted to corporate partners who both promote and profit from the relationship.  For more information, visit www.topcoder.com.</P>



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
