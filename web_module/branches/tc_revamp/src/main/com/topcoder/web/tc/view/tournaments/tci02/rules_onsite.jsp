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
<DIV CLASS="statTextBig">Onsite Semifinal and Championship Rounds</DIV><BR/>
<P>The sixteen (16) advancers from Online Round #4 will travel to Mohegan Sun on Thursday, November 21st to compete in the Semifinal round of the 
tournament being held on Friday, November 22nd. All contestants must arrive at Mohegan Sun no later than 4:00 PM on Thursday, November 21st. If a 
contestant is unable to attend the onsite rounds, he/she will forfeit his/her eligibility to receive a prize, and his/her spot in the tournament 
will be given to the next highest overall scorer from Online Round #4.</P> 

<P>TopCoder will provide travel arrangements for each competitor and a guest of his/her choice, up to a cost of $1,000 per person. (That is, if a 
contestant's airfare is greater than $1,000, the contestant will be responsible for the difference between the cost of the airfare and $1,000.) 
In addition, TopCoder will also provide travel arrangements to and from the airport to the Mohegan Sun Casino and accommodations and certain 
meals for each contestant and his/her guest. All other expenses are the responsibility of the contestant and his/her guest.</P> 

<P>TopCoder will determine the room assignments for the Semifinal rooms prior to the start of each Semifinal round, in a manner such that the 
average competitor rating (as of October 1st) for each room will be similar. The dates and times of the onsite Semifinal and Championship rounds 
are as follows:</P>

<TABLE STYLE="border-collapse:collapse;  border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0in 5.4pt 0in 5.4pt" CELLPADDING="0" CELLSPACING="0" BORDER="1"><TR><TD STYLE="width:216.15pt;border:solid windowtext .5pt;   background:#0C0C0C;padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="216"><P CLASS="statText"><B>Round of Competition</B></P></TD><TD STYLE="width:214.85pt;border:solid windowtext .5pt;   border-left:none;mso-border-left-alt:solid windowtext .5pt;background:#0C0C0C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="215"><P CLASS="statText"><B>Date and Time</B></P></TD></TR><TR><TD STYLE="width:216.15pt;border:solid windowtext .5pt;   border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="216"><P CLASS="statText">Semifinal Room #1</P></TD><TD STYLE="width:214.85pt;border-top:none;border-left:   none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;   mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;   background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="215"><P CLASS="statText">Friday, November 22<SUP>nd</SUP>, 8:00 AM</P></TD></TR><TR><TD STYLE="width:216.15pt;border:solid windowtext .5pt;   border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="216"><P CLASS="statText">Semifinal Room #2</P></TD><TD STYLE="width:214.85pt;border-top:none;border-left:   none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;   mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;   background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="215"><P CLASS="statText">Friday, November 22<SUP>nd</SUP>, 11:00 AM</P></TD></TR><TR><TD STYLE="width:216.15pt;border:solid windowtext .5pt;   border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="216"><P CLASS="statText">Semifinal Room #3</P></TD><TD STYLE="width:214.85pt;border-top:none;border-left:   none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;   mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;   background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="215"><P CLASS="statText">Friday, November 22<SUP>nd</SUP>, 3:00 PM</P></TD></TR><TR><TD STYLE="width:216.15pt;border:solid windowtext .5pt;   border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="216"><P CLASS="statText">Semifinal Room #4</P></TD><TD STYLE="width:214.85pt;border-top:none;border-left:   none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;   mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;   background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="215"><P CLASS="statText">Friday, November 22<SUP>nd</SUP>, 6:00 PM</P></TD></TR><TR><TD STYLE="width:216.15pt;border:solid windowtext .5pt;   border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="216"></TD><TD STYLE="width:214.85pt;border-top:none;border-left:   none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;   mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;   background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="215"></TD></TR><TR><TD STYLE="width:216.15pt;border:solid windowtext .5pt;   border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="216" CLASS="statText"><B>Championship Round</B></TD><TD STYLE="width:214.85pt;border-top:none;border-left:   none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;   mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;   background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="215" CLASS="statText"><B>Saturday, November 23<SUP>rd</SUP>, 11:00 AM</B></TD></TR></TABLE>
<P>The Semifinal Round will consist of four (4) rooms of four (4) coders each. The winner in each room will advance to the Championship Round.</P> 

<P>The Championship Round will be a single round of four (4) coders. First, second, third and fourth place in the Championship round are determined 
by comparing the total points of each coder, with the highest point value placing first. The winner of the Championship Round will be the coder 
with the highest point total for the round. In the event of a tie in the Semifinal and/or Championship rounds, the tie will be resolved in the 
following manner (in order):</P> 

<UL>
<LI>Total points acquired (higher is better) during the 2002 TopCoder Invitational to date</LI>
<LI>If a tie still remains, then by rating (higher is better) as of October 1st</LI>
<UL>
<LI>If a tie still remains in the Semifinal round, then all tied coders will advance to the Championship Round</LI>
<LI>If a tie still remains in the Championship round, then the prize money will be distributed equally amongst the tied coders</LI>
</UL></UL>
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
