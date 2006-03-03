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

<P><B>Sixteen Finalists Announced in 2002 TopCoder Invitational</B><BR/>
Computer Programming Tournament Will Award $50,000 to Champion</P>

<P>
GLASTONBURY, CT., Nov. 11, 2002 - TopCoder, Inc., the leader in on-line programming competition and skills assessment, today announced the 16 finalists who have advanced to the final rounds of the 2002 TopCoder Invitational.  The second annual tournament, which will award cash prizes totaling $150,000, will hold its semifinal and championship rounds November 22 - 23 at Mohegan Sun in Uncasville, CT.  The tournament champion will take home $50,000.  
</P>

<P>
The "Sweet 16" field of onsite competitors is comprised of the following top programmers:
</P>
<P>
Derek Kisman, Waterloo, Ontario, Canada<BR/>
Reid Barton, Arlington, MA<BR/>
Nathan Bronson, Chapel Hill, NC<BR/>
John Dethridge, Camberwell, Victoria, Australia<BR/>
Ben Wilhelm, Seattle, WA<BR/>
Tomas Rokicki, Palo Alto, CA<BR/>
Daniel Wright, Lafayette, CO<BR/>
Dan Adkins, Berkeley, CA<BR/>
Ambrose Feinstein, Orlando, FL<BR/>
David Arthur, Durham, NC<BR/>
Ruoming Pang, Princeton, NJ<BR/>
Tom Sirgedas, Novi, MI<BR/>
Lars Hellsten, Toronto, Canada<BR/>
Sergey Kalinichenko, San Francisco, CA<BR/>
Jared Showalter, Cambridge, MA<BR/>
Zhiyan Liu, Princeton, NJ <BR/>   
</P>

<P>
Over the past several months, thousands of developers around the world have competed at TopCoder for the coveted tournament spots.  All finalists advanced to the tournament's onsite rounds based on their performance in a series of online elimination rounds, which began in October.  After these rounds, only the best 16 remain standing.  "TopCoder's objective programming tournaments identify and promote some of the best and brightest developers in the world.  These individuals represent the future leaders of software development and of the technology industry," said TopCoder founder and chairman, Jack Hughes.  "TopCoder has more than 20,000 members from around the globe, and our membership increases each day.  These 16 have elevated themselves above a crowded field and should be proud of the fact that they have made it to the final onsite rounds.  I'm sure some of them are quite relieved as well.  We look forward to seeing them all at Mohegan Sun."
</P>

<P>
<B>Global Representation</B> <BR/>
The field of finalists includes citizens from Australia, Canada, China and the United States.  Due to travel limitations, three would-be finalists will be unable to attend the onsite finals in Connecticut.  Jiazhi Wu and Jiqing Tang, both students from Zhejiang University in Hangzhou, China, and Yi Chen, a student at South China University of Technology in Guangzhou, China, advanced to the finals based on their performance in the most recent elimination round.  Their tournament spots went to the next highest scoring competitors.  
</P>

<P>
In addition, TopCoder welcomes Zhiyan Liu as the first female to advance to the finals of its major tournaments.  Liu, a student at Princeton University, is making her second TopCoder tournament appearance. 
</P>

<P>
Despite being open to both student and professional TopCoder members, college students outnumber professional programmers in the tournament.  In total, 10 students are making an appearance in the onsite finals.  Princeton University and MIT each have two representatives in the tournament finals.  Other schools represented are Duke University, Oberlin College, Stanford University, University of California - Berkeley, University of Central Florida, University of Melbourne (Australia), University of Michigan - Ann Arbor, and the University of Waterloo (Canada).
</P>

<P>
This is the second annual Invitational tournament and fourth major programming tournament hosted by TopCoder.  The 2002 Sun Microsystems and TopCoder Collegiate Challenge was held in April 2002, and was won by Daniel Wright, then a junior at Stanford University in Stanford, CA.  "We are not surprised to see Daniel back in the finals of this tournament.  He is typically a force to be reckoned with in our competitions," added Hughes.
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
