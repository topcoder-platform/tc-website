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


<P CLASS="bodyTextBold"> 02.19.2002 <IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/>Field Announced for 2002 Sun Microsystems and TopCoder Collegiate Challenge<BR/><SPAN CLASS="bodyTextItal">Students From Top U.S. Universities Will Vie for a Share of $150,000 in Prize Money</SPAN></P>
<P>GLASTONBURY, CT., Feb. 19, 2002 - TopCoder, Inc., a company committed to identifying and promoting computer programming talent through competition, today announced the field for its 2002 Collegiate Challenge, sponsored by Sun Microsystems.  The tournament, which will award a total prize purse of $150,000, begins tonight.</P>
<P>Elimination rounds will crown Regional Champions and reduce the field to 16<BR/>The 2002 Sun Microsystems and TopCoder Collegiate Challenge brings together 512 of the highest-rated TopCoder college-level members, identified based upon their performance in TopCoder competitions, for four rounds of online regional competition.  The winner of each region will be crowned the Regional Champion, win $5,000 and automatically advance to the final field of 16 competitors.  This elite 16 will compete in the tournament's final two onsite rounds and vie for their share of $150,000.  The Semifinal and Championship rounds will be held April 19 and 20, 2002 at the University Park Hotel @ MIT in Cambridge, Massachusetts.  There, the tournament champion will win $100,000.</P>
<P><DIV CLASS="bodyTextBold">Top U.S. Schools represented</DIV>The top-five schools, and number of students from each, that will be represented in the Collegiate Challenge are:  MIT (37), the University of Michigan (24), Georgia Tech (22), Stanford University (20), and the University of Texas-Austin (16).  Stanford junior Jon McAlister is ranked first in the West region and is the highest rated member entering the tournament.  McAlister was the runner-up in last year's Collegiate Challenge, and followed that performance with a first-place win at the 2001 TopCoder Invitational held in November 2001, which featured TopCoder's top-rated collegiate and professional members.</P>
<P>Other schools that will be strongly represented in the tournament include Virginia Polytechnic Institute and State University, Cornell University, Duke University, Carnegie Mellon University, the University of Illinois Urbana-Champlain, Iowa State University, the California Institute of Technology and UCLA.</P>
<P>THis is the second annual Collegiate Challenge and third major programming tournament hosted by TopCoder.  The 2001 TopCoder Collegiate Challenge was held in June 2001, and was won by Jason Woolever, a Massachusetts Institute of Technology graduate student.  Woolever is currently a Senior Research and Development Engineer at Synopsys, Inc. of Sunnyvale, California.</P>
<P>"Each year a new class of graduates enters the IT workforce," said TopCoder Chairman and founder, Jack Hughes.  "TopCoder competitions enable technology companies and recruiters to identify and objectively assess candidates through testing and rating coding skills under real-world conditions.  TopCoder offers services to assist companies looking to hire top programming talent."  </P>
<P>More information regarding TopCoder employment services, as well as sponsorship of weekly single-round matches and future major tournaments, can be found at www.topcoder.com or by calling 1-866-867-2633.</P>
<P CLASS="smallText">About TopCoder, Inc.<BR/>TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members.  With a global membership database, TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated rewards create a powerful community of programmers.  Access to this community is granted to corporate partners who both promote and profit from the relationship.</P>
<P CLASS="smallText">About the Sun Developer Connection Program<BR/>Building on Sun's vision to enable services on demand with the latest open technologies, the Sun Developer Connection (SDC) offers individual developers and software development partners a single, worldwide entry point to build a technical and business relationship with Sun.  As one of the largest developer communities in the world, the SDC is the connection to Sun for comprehensive resources to build and market solutions leveraging Sun's open technologies, products, business development, and community forums.</P>
<P CLASS="smallText">Sun, Sun Microsystems, the Sun logo, Sun Developer Connection, Java, Solaris, and The Network Is The Computer are trademarks of Sun Microsystems in the United States and other countries.</P>
<A CLASS="bodyText" href="/reg/">:: Register with TopCoder to compete</A>


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
