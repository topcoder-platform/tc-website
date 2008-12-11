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


<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

            <jsp:include page="links_summary.jsp" />
<BR CLEAR="all"/>         
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
            <!-- <TR>
              <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/index?t=tournaments&c=tourny_sched"><IMG SRC="/i/tournament/sun_banner_white.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
            </TR> -->          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 2 Summary</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<P><IMG SRC="/i/tournament/invit02/tourney_photo_SFR2.jpg" ALT="" WIDTH="200" HEIGHT="435" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>A Nail Biter, Indeed</B></FONT><BR/>
by MaryBeth Biondi, <I>TopCoder Staff</I><BR/>
Friday, November 22, 2002<BR/>
</P>

<P>
The morning's second competition brought a few more spectators onsite, but lots more online.  
Nearly 50 members logged in to cheer on their fellow coders in a tightly contested match, which
 pitted <B>dmwright</B>'s tournament experience against <B>reid</B>'s speed.  <B>dgarthur</B> and <B>lars</B>, in some 
 people's minds, may have only been along for the experience.
</P>

<P>
Once again, everyone opened and submitted the 200-point problem first.  <B>reid</B> submitted his 
first for 193.47.  Seconds later, <B>dgarthur</B> was awarded 190.40 points for his submission.  
<B>dmwright</B> and <B>lars</B> submitted 11 and 13 minutes into the contest for 172.39 and 167.75 points,
 respectively.  Everyone except <B>dmwright</B> moved on to the 550-point problem next.  In a move 
 that may have been part of his downfall, <B>dmwright</B> chose to open the 1000-pointer next.
</P>

<P>
<B>lars</B> pulled into the lead with the fastest submission of the 550-point problem for 415.89
 points.  Once again, <B>dgarthur</B> and <B>reid</B> submitted within seconds of each other, receiving
  353.69 and 352.56 points.  It would be another 43 minutes before <B>reid</B>  and <B>dgarthur</B> 
  made the last two submissions of the contest for 461.94 and 465.73 on the 1000-point 
  problem.  Neither <B>dmwright</B> nor <B>lars</B> was able to submit solutions.  Surprisingly, the 
  scores at the end of the coding phase saw <B>dgarthur</B> in first (1009.82), <B>reid</B> in second 
  (1007.97), <B>lars</B> in third (583.64), and <B>dmwright</B> last (172.39).  It appeared as though
   <B>dmwright</B>'s previous experience had not been enough to advance him to the finals.
</P>

<P>
Much to the crowd's dismay, the 15 minute challenge phase went by without any action.  
Competitors and spectators gathered around the scoreboard as the system test results
 were revealed.  The day's first upset had arrived, with <B>dgarthur</B>'s code passing all 
 system tests.  <B>reid</B> saw his 1000-point problem, and <B>lars</B> his 550-point problem, each 
 fail systests, while <B>dmwright</B>'s 200-point solution survived.
</P>

<P>
As we move into the afternoon contests, we have to wonder - will <B>dgarthur</B> meet fellow 
North Carolinian NDBronson in the finals, or will there be more surprise finishes?
</P>

          </TD>
            </TR>
          </TABLE>
                      
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">            
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><A NAME="photo"></A></TD>
            </TR>          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 2 Photos</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center">
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR201.jpg');"><IMG SRC="/i/tournament/invit02/SFR201_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR202.jpg');"><IMG SRC="/i/tournament/invit02/SFR202_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR203.jpg');"><IMG SRC="/i/tournament/invit02/SFR203_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR204.jpg');"><IMG SRC="/i/tournament/invit02/SFR204_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR205.jpg');"><IMG SRC="/i/tournament/invit02/SFR205_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
              <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" BGCOLOR="#000000">
	<TR>
		<TD><IMG SRC="/i/tournament/invit02/SFR201.jpg" NAME="bigVersion" WIDTH="432" HEIGHT="288" BORDER="0"/></TD>
	</TR>
</TABLE>
              <BR/></TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center">
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR206.jpg');"><IMG SRC="/i/tournament/invit02/SFR206_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR207.jpg');"><IMG SRC="/i/tournament/invit02/SFR207_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR208.jpg');"><IMG SRC="/i/tournament/invit02/SFR208_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR209.jpg');"><IMG SRC="/i/tournament/invit02/SFR209_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR210.jpg');"><IMG SRC="/i/tournament/invit02/SFR210_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>              
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center">
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR211.jpg');"><IMG SRC="/i/tournament/invit02/SFR211_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR212.jpg');"><IMG SRC="/i/tournament/invit02/SFR212_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR214.jpg');"><IMG SRC="/i/tournament/invit02/SFR214_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
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
