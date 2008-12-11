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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 3 Summary</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<P><IMG SRC="/i/tournament/invit02/tourney_photo_SFR3.jpg" ALT="" WIDTH="200" HEIGHT="435" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>And the woman has her way!</B></FONT><BR/>
by MaryBeth Biondi, <I>TopCoder Staff</I><BR/>
Friday, November 22, 2002<BR/>
</P>

<P>
The answer to my last question has been answered in a resounding way - the surprises are 
anything but over.  In the biggest upset of the day, the lowest ranked coder onsite, 
<B>moira</B>, has overcome the odds and will be advancing to the finals for the chance to win $50,000.
</P>

<P>
This round seemed to possess particularly troublesome problem statements, and we 
unexpectedly saw <B>NDBronson</B> pass on the 300-point problem early on in the contest.  
<B>obfuscator</B> was the first to submit code 26 minutes into the coding phase, and earned 
himself 184.78 points.  He then employed dmwright's strategy by opening the 1000-point 
problem next.  <B>moira</B> followed close behind <B>obfuscator</B> by submitting her 300-point answer
 three minutes later for 171.79 points.  She, however, moved on to the 500-point problem. 
  34 minutes into the contest, <B>radeye</B> submitted his 300-point problem for 157.46 points, 
  and then also moved on to the 500-pointer.  Meanwhile, <B>NDBronson</B> continued diligently 
  coding the 500-point problem, which he finally submitted at 41 minutes for 291.29 points.
</P>

<P>
<B>moira</B> was the next to submit code 13 minutes later - her 500-point problem for 315.21 
points.  Having passed on the 1000-point problem, <B>obfuscator</B> submitted his 500-pointer
 for 270.31 points with only one minute to go in the contest.  At the end of the coding 
 phase, the first female ever to make it to the onsite finals had finished in first 
 place with 487 points.  Her boyfriend and referrer, <B>obfuscator</B>, was in second with 
 455.09.  <B>NDBronson</B> and <B>radeye</B> rounded out the field with 291.29 and 157.46, respectively.
</P>

<P>
Again the challenge phase produced no changes since no action was taken.  Tension 
mounted as the system tests were run.  Everyone wondered if either of the 500-point 
submissions would fail, allowing the once #1 ranked <B>NDBronson</B> to advance to the finals.
  But when the results were broadcast, we saw that all competitors had submitted flawless 
  code, and <B>moira</B> had stunned the crowd with an impressive victory!
</P>

<P>
One room remains.  Can <B>ZorbaTHut</B> make his third trip onsite a charm and advance to 
the finals?  Will <B>John Dethridge</B> get the chance to compete on Saturday against his
 rival, <B>SnapDragon</B>?  Or can <B>DjinnKahn</B> or <B>jms137</B> make it three upsets in a row?  
 If you haven't logged in to watch the action unfold live, now is the time!
</P>
 


          </TD>
            </TR>
          </TABLE>
                      
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">            
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><A NAME="photo"></A></TD>
            </TR>          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 3 Photos</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center">
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR301.jpg');"><IMG SRC="/i/tournament/invit02/SFR301_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR302.jpg');"><IMG SRC="/i/tournament/invit02/SFR302_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR303.jpg');"><IMG SRC="/i/tournament/invit02/SFR303_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR304.jpg');"><IMG SRC="/i/tournament/invit02/SFR304_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR305.jpg');"><IMG SRC="/i/tournament/invit02/SFR305_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
              <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" BGCOLOR="#000000">
	<TR>
		<TD><IMG SRC="/i/tournament/invit02/SFR301.jpg" NAME="bigVersion" WIDTH="432" HEIGHT="288" BORDER="0"/></TD>
	</TR>
</TABLE>
              <BR/></TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center">
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR306.jpg');"><IMG SRC="/i/tournament/invit02/SFR306_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR307.jpg');"><IMG SRC="/i/tournament/invit02/SFR307_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR308.jpg');"><IMG SRC="/i/tournament/invit02/SFR308_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR309.jpg');"><IMG SRC="/i/tournament/invit02/SFR309_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
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
