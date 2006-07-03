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
                <jsp:param name="node" value="topcoder_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div align="center" style="margin: 0px 10px 0px 10px;">

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif">
<TR>
<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
<TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

<jsp:include page="links.jsp" />
<jsp:include page="links_rules.jsp" />
<BR/><BR/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR><TD VALIGN="middle" COLSPAN="3" HEIGHT="16" CLASS="statText"><BR/>
<DIV CLASS="statTextBig">Onsite Semifinal and Championship Rounds</DIV><BR/>
The sixteen (16) advancers from the online Regional rounds will participate in the Semifinal rounds of the 2002 Sun Microsystems and TopCoder Collegiate Challenge 
being held on April 19th, 2002.  Each contestant and one (1) guest of his/her choice will travel to the onsite competition to be held in Cambridge, MA.  All contestants 
must arrive at the University Park Hotel @ MIT in Cambridge, MA no later than 4:00pm EST on Thursday, April 18, 2002.<BR/><BR/>
TopCoder will determine the room assignments for the Semifinal rooms prior to the start of each Semifinal round, in a manner such that the average competitor rating 
(as of February 14, 2002) for each room will be similar.  All those who compete in the Semifinal and Championship rounds will be competing for a range of prizes up to and 
including the Grand Prize.  If a contestant is unable to attend the onsite Semifinal and Championship rounds, he/she will forfeit his/her eligibility to receive a prize, and 
his/her spot in the competition will be given to the next highest overall scorer from the final online Regional round.  The dates and times of the onsite Semifinal and 
Championship rounds are as follows: <BR/><BR/>
<DIV ALIGN="center"><TABLE WIDTH="75%" BORDER="1" CELLPADDING="6" CELLSPACING="0">
<TR>
<TD WIDTH="50%" ALIGN="center" VALIGN="middle" HEIGHT="21" BGCOLOR="#000000" CLASS="statText">Round of Competition</TD>
<TD WIDTH="50%" ALIGN="center" VALIGN="middle" HEIGHT="21" BGCOLOR="#000000" CLASS="statText">Date</TD>
</TR>
<TR>
<TD WIDTH="50%" ALIGN="left" VALIGN="top" BGCOLOR="#666666"><FONT FACE="arial, helvetica, sans-serif" SIZE="1" COLOR="#ffffff"><UL>
<LI>Semifinal Room #1</LI><BR/>
<LI>Semifinal Room #2</LI><BR/>
<LI>Semifinal Room #3</LI><BR/>
<LI>Semifinal Room #4</LI><BR/>
<LI>Championship Round</LI>
</UL>
</FONT></TD>
<TD WIDTH="50%" ALIGN="left" VALIGN="top" BGCOLOR="#666666"><FONT FACE="arial, helvetica, sans-serif" SIZE="1" COLOR="#ffffff">
April 19, 2002 at 8:00am EST<BR/><BR/>
April 19, 2002 at 11:00am EST<BR/><BR/>
April 19, 2002 at 3:00pm EST<BR/><BR/>
April 19, 2002 at 6:00pm EST<BR/><BR/>
April 20, 2002 at 1:00pm EST<BR/>
</FONT></TD>
</TR>
</TABLE></DIV><BR/>
In the Semifinal Round, each competitor will compete in one of four (4) rooms of four (4) coders each.  The winner in each room will advance to the Championship round.<BR/><BR/>
<B>PLEASE NOTE:</B> Due to the structure of the tournament, the coders competing in Semifinal Room #2 will be sequestered for the duration of Semifinal Room #1, and coders 
competing in Semifinal Room #4 will be sequestered for the duration of Semifinal Room #3.  Therefore, the coders seeded in Semifinal Room #2 are required to be at the 
University Park Hotel prior to the start of Semifinal Room #1 competition, and coders seeded in the Semifinal Room #4 competition are required to be at the University Park Hotel prior to the start of 
the Semifinal Room #3 competition.   If the competitors are not present when required, he/she will be disqualified and will not be allowed to compete.  More details regarding sequestering 
will be provided to the 16 semifinalists when those competitors are identified.<BR/><BR/>
<B>The Championship Round</B> will be a single match of four (4) coders.  The winner of this round will be crowned the Sun Microsystems and TopCoder Collegiate Challenge Champion and will be awarded 
the tournament Grand Prize.<BR/><BR/>
First, second, third and fourth place in the Championship round are determined by comparing the total points of each coder, with the highest point 
value placing first.  The winner of the Championship Round will be the coder with the highest point total for the round.  In the event of a tie in the Semifinal and/or 
Championship rounds, the tie will be resolved in the following manner (in order):<UL>
<LI>Total points acquired (higher is better) in the 2002 Collegiate Challenge to date</LI><BR/>
<LI>If a tie still remains, then by rating (higher is better) as of February 14, 2002</LI></UL><BR/>
<DIV ALIGN="center" CLASS="statTextBig">Visit <A HREF="http://www.sun.com" CLASS="statTextBig">Sun Microsystems</A> - exlcusive sponsor of the 2002 TopCoder Collegiate Challenge</DIV><BR/>
</TD>
</TR>
</TABLE>
<P><BR/></P>
</TD>
<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
</TR>
<TR>
<TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
</TR>   
<TR>
<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>
<TR>
<TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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
