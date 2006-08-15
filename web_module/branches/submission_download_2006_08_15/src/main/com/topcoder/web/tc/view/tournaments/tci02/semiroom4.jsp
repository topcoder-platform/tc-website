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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 4 Summary</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<P><IMG SRC="/i/tournament/invit02/tourney_photo_SFR4.jpg" ALT="" WIDTH="200" HEIGHT="435" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>G'day Mate!</B></FONT><BR/>
by MaryBeth Biondi, <I>TopCoder Staff</I><BR/>
Friday, November 22, 2002<BR/>
</P>

<P>
The 15-hour time difference between Melbourne, Victoria, Australia and Uncasville, 
Connecticut, USA may have taken a toll on <B>John Dethridge</B>'s sleeping patterns, but
 not on his thought process.  In the most dramatic finish of the day, <B>John Dethridge</B> 
 submitted his 1100-point solution with 10 seconds remaining in the contest, becoming 
 only the 4th person today to submit all three problems in the given 75 minutes.
</P>

<P>
This contest started at a quick pace with <B>ZorbaTHut</B> submitting his 200-point problem 
in six minutes for 190.93 points.  Two minutes later, <B>John Dethridge</B> submitted his 
200-point solution for 187.45.  He moved on to the 1100-pointer, while <B>ZorbaTHut</B> opened and
 quickly solved the 400-pointer in six minutes for 381.23 points.  
 <B>jms137</B> was the next coder to weigh in with this submission of the 
 200-point problem for 140.34 points.  <B>DjinnKahn</B> rounded out the 
 200-point submissions five minutes later for 125.78 points, then 
 wasted little time in submitting his 400-point solution nine minutes later for 366.44 points.
</P>

<P>
After struggling with the 1100-pointer for 13 minutes, <B>John Dethridge</B> opened the 
400-point problem.  Fifteen minutes later, he submitted his solution for 315.49 points.  
<B>jms137</B> worked on his 400-point problem for 24 minutes before submitting his solution and
 earning 257.76 points.  At that point, <B>John Dethridge</B> stunned the crowd with his last 
 second submission of the 1100-point problem, arguably the hardest problem any coder 
 had faced today.  Total points after the coding phase were 919.89 (<B>John Dethridge</B>), 
 572.16 (<B>ZorbaTHut</B>), 492.22 (<B>DjinnKahn</B>), and 398.10 (<B>jms137</B>).
</P>

<P>
Room 4 produced one of the two challenges of the day when <B>jms137</B> unsuccessfully 
challenged <B>John Dethridge</B>'s 400-pointer, causing <B>jms137</B> to lose 50 precious points.  
All eyes were on the scoreboard waiting to see if <B>John Dethridge</B>'s 1100-pointer would 
survive.  Incredulously, it did not.  But neither did <B>ZorbaTHut</B>'s 400-pointer, so in 
the end it didn't matter.
</P>

<P>
Tomorrow's championship round promises to be one of the better ones.  Top rated 
and ranked <B>SnapDragon</B> faces formidable foes in <B>John Dethridge</B>, <B>dgarthur</B>, and <B>moira</B>. 
 As today's contests showed, anyone can win a match at any time.  Great job to all
  of today's competitors.  And to tomorrow's contestants - good luck to you in the Arena!
</P>


          </TD>
            </TR>
          </TABLE>
                      
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">            
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><A NAME="photo"></A></TD>
            </TR>          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 4 Photos</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center">
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR401.jpg');"><IMG SRC="/i/tournament/invit02/SFR401_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR402.jpg');"><IMG SRC="/i/tournament/invit02/SFR402_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR403.jpg');"><IMG SRC="/i/tournament/invit02/SFR403_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR404.jpg');"><IMG SRC="/i/tournament/invit02/SFR404_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR405.jpg');"><IMG SRC="/i/tournament/invit02/SFR405_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
              <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" BGCOLOR="#000000">
	<TR>
		<TD><IMG SRC="/i/tournament/invit02/SFR401.jpg" NAME="bigVersion" WIDTH="432" HEIGHT="288" BORDER="0"/></TD>
	</TR>
</TABLE>
              <BR/></TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center">
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR406.jpg');"><IMG SRC="/i/tournament/invit02/SFR406_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR407.jpg');"><IMG SRC="/i/tournament/invit02/SFR407_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
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
