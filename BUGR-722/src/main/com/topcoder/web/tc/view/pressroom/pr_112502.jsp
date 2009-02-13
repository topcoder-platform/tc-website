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

<P><B>Australian Programmer Wins 2002 TopCoder Invitational Tournament</B><BR/>
Melbourne Resident John Dethridge 'Out-Codes' 15 Top Competitors For $50,000 Grand Prize</P>

<P>
GLASTONBURY, Conn., Nov. 25 /PRNewswire/ -- John Dethridge of Melbourne,
Australia won the second annual 2002 TopCoder Invitational, held at the
Mohegan Sun Casino in Uncasville, CT on November 22-23.  Dethridge beat 15 of
the world's best computer programmers during the semifinal and championship
rounds for the $50,000 grand prize.
</P>
    
<P>
    The 2002 TopCoder Invitational is Dethridge's first appearance at an
onsite TopCoder competition.  "This is really exciting for me," said
Dethridge.  "Although this is my first appearance in a TopCoder tournament, I
have quite a bit of experience in programming competitions.  The TopCoder
finals are unlike any competition I've been in, and I am proud to represent
Australia in the tournament."
</P>

<P>
    At the start of the tournament, Dethridge was the 4th seed and the #4
rated member among more than 20,000 developers in the TopCoder community.  As
a result of his victory, he has now become the #1 rated TopCoder member.  He
"out-coded" Derek Kisman, the previous top rated member and a programmer at a
bioinformatics company in Waterloo, Ontario; David Arthur, a junior at Duke
University; and Zhiyan Liu, a doctorate student at Princeton University in the
Championship round.  Although TopCoder competitions offer competitors the
choice of three programming languages -- Java, C++ and C# -- all the finalists
used C++ in the Championship round.
</P>

<P>
    "John is arguably the best computer programmer in the world," said
TopCoder founder and chairman, Jack Hughes.  "Winning this global competition,
which started with more than 700 programmers from eight different countries,
is a tremendous accomplishment.  He should be very proud of his performance in
the tournament."
</P>

<P>
    Semifinalists in the tournament were Ben Wilhelm (Seattle, WA), Tom
Sirgedas (Novi, MI), Nathan Bronson (Chapel Hill, NC), Reid Barton (Arlington,
MA), Ruoming Pang (Princeton, NJ), Ambrose Feinstein (Orlando, FL), Dan Adkins
(Berkeley, CA), Daniel Wright (Stanford, CA), Jared Showalter (Cambridge, MA),
Lars Hellsten (Waterloo, CA), Tomas Rokicki (Palo Alto, CA), and Sergey
Kalinichenko (San Francisco, CA).
</P>

<P>
    The results of TopCoder's major tournaments and weekly competitions create
a global database of objectively rated and talent-differentiated student and
professional programmers.  "Companies use our competition platform and the
valuable information and statistics derived from our competitions to identify
the proficiency of programmers," said Hughes, a veteran programmer.  "Our
programming competitions test and reflect real-world coding skills in a way
that's valuable to our constituents.  Our fast growing list of blue-chip
clients, including Microsoft, the FBI, and Google, is proof of that.  By
hosting these competitions, TopCoder provides the means for leading companies
to access the upper echelon of computer programmers."
</P>


<P><BR/></P>

<P>
<B>About TopCoder, Inc.</B><BR/>
TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members.  With a global membership database, TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated rewards create a powerful community of programmers.  Access to this community is granted to corporate partners who both promote and profit from the relationship.  For more information, visit www.topcoder.com.</P>

<P>
<B>About TopCoder Employment Services (TCES)</B><BR/>
    TCES provides companies with an unprecedented way to identify and
differentiate skilled programmers.  By providing technical information about
employment candidates, TCES enables recruiting and hiring personnel to be more
efficient, save time and employ more productive hires.  Subscribing companies
post jobs, and TopCoder members respond directly, at http://www.topcoder.com.</P>



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
