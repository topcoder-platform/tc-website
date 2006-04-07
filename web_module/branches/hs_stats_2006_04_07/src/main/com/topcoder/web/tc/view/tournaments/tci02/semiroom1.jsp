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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 1 Summary</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<P><IMG SRC="/i/tournament/invit02/tourney_photo_SFR1.jpg" ALT="" WIDTH="200" HEIGHT="435" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>As expected, SnapDragon struts his stuff</B></FONT><BR/>
by MaryBeth Biondi, <I>TopCoder Staff</I><BR/>
Friday, November 22, 2002<BR/>
</P>

<P>
In front of a sparse crowd, the morning competitors dealt with some minor system issues and tough 
problem statements as the first round of competition started at 8:00am.  
</P>

<P>
All four competitors started the round by opening the 300-point problem.  Ten minutes later, 
<B>SnapDragon</B> was the first to weigh in with a submission for 268.59 points.  Within the next 
minute, both <B>malpt</B> and <B>ambrose</B> submitted their solutions for 260.51 points and 257.85 points, 
respectively.  <B>kyky</B> worked on his solution for 7 more minutes before submitting for 219.80 points.
</P>

<P>
Surprisingly, <B>malpt</B> submitted his solution to the 500-point problem after only working on it 
for 7 minutes, receiving just over 370 points.  Upon further inspection of the problem statement, 
however, he quickly realized that he had misread it, and began working on his resubmission.  
<B>ambrose</B> was next to submit a solution 35 minutes into the contest, and received 326.37 points 
for the 500-point problem.  Two minutes later, <B>SnapDragon</B> submitted his 500-point solution for 
300.55 points.  <B>kyky</B>, after reading the 1050-point problem, decided to work on the 500 instead.  
Unfortunately, he would not submit a solution to either problem.
</P>

<P>
For the next 36 minutes, all was quiet on the submission front.  Then, with seven minutes left in 
the coding phase, <B>malpt</B> resubmitted his solution to the 500-point problem for 150.00 points, 
losing over half of his original points and decreasing his point total to 410.51.  <B>SnapDragon</B> 
had the last say, submitting his solution to the 1050-point problem with five minutes left in 
the round for 521.09 points.  At the end of the coding phase, the point totals stood at 
1090.23 (<B>SnapDragon</B>), 584.22 (<B>ambrose</B>), 410.51 (<B>malpt</B>), and 219.80 (<B>kyky</B>).
</P>

<P>
The challenge phase was quiet for nearly 14 minutes.  Then, after lots of thought, testing, 
and agonizing, <B>SnapDragon</B> successfully challenged <B>ambrose</B>'s 500-point solution, further 
increasing his lead by 50 points.  The system test phase was kind to everyone but <B>kyky</B>, 
who lost his 219.80 points, causing him to finish with 0 points.
</P>

<P>
In the end, <B>SnapDragon</B> showed why he is the current Top Coder, being the only competitor 
of the round to finish all three problems and submit a successful challenge.  Perhaps 
<B>malpt</B>'s simple statement summed it up best: "It's tough to beat <B>SnapDragon</B> when he 
correctly solves all three problems."  Luckily for <B>malpt</B>, the casino floor is just 
a short walk away _ he can always place his winnings on double zero, spin the roulette wheel, and hope for the best...
</P>


          </TD>
            </TR>
          </TABLE>
                      
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">            
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><A NAME="photo"></A></TD>
            </TR>          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 1 Photos</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center">
<!-- <A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02//SFR101.jpg');"><IMG SRC="/i/tournament/invit02//SFR101_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A> -->
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02//SFR102.jpg');"><IMG SRC="/i/tournament/invit02//SFR102_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02//SFR103.jpg');"><IMG SRC="/i/tournament/invit02//SFR103_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02//SFR104.jpg');"><IMG SRC="/i/tournament/invit02//SFR104_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02//SFR105.jpg');"><IMG SRC="/i/tournament/invit02//SFR105_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
              <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" BGCOLOR="#000000">
	<TR>
		<TD><IMG SRC="/i/tournament/invit02//SFR102.jpg" NAME="bigVersion" WIDTH="432" HEIGHT="288" BORDER="0"/></TD>
	</TR>
</TABLE>
              <BR/></TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center">
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02//SFR106.jpg');"><IMG SRC="/i/tournament/invit02//SFR106_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02//SFR107.jpg');"><IMG SRC="/i/tournament/invit02//SFR107_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02//SFR108.jpg');"><IMG SRC="/i/tournament/invit02//SFR108_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02//SFR109.jpg');"><IMG SRC="/i/tournament/invit02//SFR109_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02//SFR1010.jpg');"><IMG SRC="/i/tournament/invit02//SFR1010_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>              
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
