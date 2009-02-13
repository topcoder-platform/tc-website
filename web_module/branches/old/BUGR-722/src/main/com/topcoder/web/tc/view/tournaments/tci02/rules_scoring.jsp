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
                <jsp:param name="node" value="topcoder_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div align="center" style="margin: 0px 10px 0px 10px;">


<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><br>

            <jsp:include page="links.jsp" />
            <jsp:include page="links_rules.jsp" />

  <br><br>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR><TD VALIGN="middle" COLSPAN="3" HEIGHT="16" CLASS="statText"><BR/>
<DIV CLASS="statTextBig">Scoring and Advancing during Online Rounds</DIV><BR/>
<P>After each round of competition, the winners from each of the assigned rooms will be identified and will advance to the next online round. Coder advancement 
in all rounds is determined by comparing the total point values from all three phases of the round (see Competition Round Structure) for each coder. In order 
to advance, a coder must finish each round with a greater-than-zero point total. The structure of the online rounds is as follows:
</P>
<P><B>Online Round #1</B> (to be completed in 2 parts)
<UL>
<LI> A total of 1,024 coders will compete in Round #1 and a total of 512 will advance.  Round #1 will consist of 2 parts, with 512 people competing in each 
part and 256 members advancing from each part.</LI>
<LI> The winner of each of the 128 rooms (64 rooms in each part of Round #1), will automatically advance 
(i.e. receive an automatic berth) to Online Round #2.</LI>
<LI> The remaining 384 spots (192 spots from each part of Round #1) will be wildcards, and 
will be handed out based on total points across all rooms.  (In the event that there are 
not 64 room winners in one part of Round #1, the total number of wildcard spots for that part of 
Round #1 will be equal to 256 minus the number of automatic berths awarded to the room winners.)</LI>
</UL></P>
<P><B>Online Round #2</B><UL>
<LI> 512 coders will compete and 256 will advance.</LI>
<LI> The winner of each of the 64 rooms will automatically advance to Online Round #3.</LI>
<LI> The remaining 192 spots will be wildcards and will be handed out based on total points across all
rooms.  (In the event that there are not 64 room winners in Round #2, the total number of wildcard 
spots will be equal to 256 minus the number of automatic berths awarded to the room winners.)</LI>
</UL></P>
<P><B>Online Round #3</B><UL>
<LI> 256 coders will compete and 64 will advance.</LI>
<LI> The winner of each of the 32 rooms will automatically advance to Online Round #4.</LI>
<LI> The remaining 32 spots will be wildcards and will be handed out based on total points 
across all rooms.  (In the event that there are not 32 room winners in Round #3, the total number 
of wildcard spots will be equal to 64 minus the number of automatic berths awarded to the room winners.)</LI>
</UL></P>
<P><B>Online Round #4</B><UL>
<LI> 64 coders will compete and 16 will advance to the onsite Semifinal round.</LI>
<LI> The winner of each of the 8 rooms will automatically advance to the Semifinal round.  </LI>
<LI> The remaining 8 spots will be wildcards and will be handed out based on total points 
across all rooms.  (In the event that there are not 8 room winners in Round #4, the total number 
of wildcard spots will be equal to 16 minus the number of automatic berths awarded to the room winners.)</LI>
</UL></P>
<P>NOTE:  If a room has no contestants who have more than zero points, the automatic berth for that room will be placed into the wildcard pool. Any tie 
in points for an automatic berth in a room or for the last spot of the wildcard pool will be resolved in the following manner:
<UL>
<LI> Total points acquired (higher is better) during the rounds of the tournament in which all 
of the tied participants were presented with the same set of problems</LI>
<LI> If a tie still remains, then by rating (higher is better) as of October 1, 2002</LI>
<LI> If a tie still remains, all tied coders will advance to the next round</LI></UL></P>
<P><B>Competition Round Structure</B></P>
<P>Each online and onsite round of competition consists of three phases: the Coding Phase, Challenge Phase, and System Testing Phase. (Note: the format 
of these competition rounds is similar to the format of the Single Round Matches.)</P>
<P><UL><LI> The Coding Phase is a timed event where all contestants are presented with the same three questions representing three levels of 
complexity and, accordingly, three levels of point earnings potential. Points for a problem are awarded upon submission of any solution that successfully 
compiles and are calculated on the total time elapsed from the time the problem was opened to the time it was submitted.</LI><LI> The Challenge Phase 
is a timed event wherein each competitor has a chance to challenge the functionality of other competitors' code. A successful challenge will result in 
a loss of the original problem submission points by the defendant, and a 50-point reward for the challenger.  Unsuccessful challengers will incur a point 
reduction of 50 points as a penalty, applied against their total score in that round of competition.</LI><LI> The System Testing Phase is applied to all 
submitted code that has not already been successfully challenged. If the TopCoder System Test finds code that is flawed, the author of that code submission 
will lose all of the points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output 
from the code submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered flawed. 
The same set of input/output test cases will be applied to all code submissions for a given problem. All successful challenges from the Challenge Phase will 
be added to the sets of inputs for the System Testing Phase.</LI>
</UL></P>						
</TD>
</TR>
</TABLE>


      </TD>
   </TR>
</TABLE>

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
