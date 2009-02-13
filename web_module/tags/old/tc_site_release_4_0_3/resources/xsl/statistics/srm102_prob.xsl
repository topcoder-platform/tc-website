<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Statistics</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>

<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
  <TR>
    <!-- Left Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="global_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#FFFFFF" valign="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">statisticsw</xsl:with-param>
  <xsl:with-param name="title">&#160;Match Editorials</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<!--body contextual links-->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="250" ALIGN="right">
    <TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
   <TR><TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
   <TR>
      <TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
      <TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
   </TR>                    
   <TR>
       <TD COLSPAN="4" VALIGN="top" BGCOLOR="#999999">
      <TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#CCCCCC">
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm102_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" CLASS="bodyText">Editorial Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm102_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm102_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
       <!-- <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm101_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
         <TD VALIGN="top" CLASS="bodyText">&#160;</TD>
      </TR> -->
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<P><B>Single Round Match 102</B><BR/>
July 1, 2002</P>
<P><B>Problem Set Analysis &amp; Opinion</B></P>

<P>
<B>Division-I - Level 1   BitFlipper</B><BR/>
The goal of this problem was to find out the minimum number of  "bit flips" necessary to take an arbitrary binary number and convert
it to all zeros, given that only a contiguous range of numbers could be flipped.  By finding the minimum and maximum occurrences of
the '1' bit in the string, and flipping all bits between (and including) these minimum and maximum values it is possible to keep
iterating until no more 1's are left.  By counting the number of flips made, you have the answer.  <B>SnapDragon</B> had a very
understandable, concise solution for this one.
</P>

<P>
<B>Division-I - Level 2   GirlFriend</B><BR/>
This problem was a nice creative example of how TopCoder members can optimize their social lives.  A girlfriend that wants to talk
on the phone every night from 6 to 8 pm is happy (tolerance increases) every night that she does talk on the phone and is unhappy
every night that her boyfriend shuns her (tolerance decreases).  So long as her tolerance of the boyfriend remains above some
minimum level, she will remain with the boyfriend.
</P>

<P>
Given that there can be no more than 20 nights in which TopCoder will be scheduled, there are at most 2^20 or about one million
possibilities of significant decisions that the boyfriend can make as to whether or not he competes in TopCoder or talks to his
girlfriend.  The only situations in which he is forced to decide between the two, are when TopCoder starts at 6 pm or 7 pm.  If it
starts at 8 pm or 9 pm he can do both, and if it isn't scheduled for that particular day he can of course talk to his girlfriend.
The catch when evaluating each sequence of possibilities is to remember to take into account the "quadratic effect" of talking (or
not talking) to his girlfriend for consecutive days.
</P>

<P>
All of the compete / don't compete decision possibilities can be evaluated recursively.  A good example of this can be found in
<B>radeye</B>'s and <B>SnapDragon</B>'s solutions.  Alternatively, the problem could be solved non-recursively using bitmasks.  Both Yarin and
dmwright elected to do it this way.  <B>John Dethridge</B> was even able to solve the problem using dynamic programming, although it is not
as easy to comprehend as the brute force solutions, and may not be significantly faster for many of the examples and system test
cases.
</P>

<P>
<B>Division-I - Level 3  DNA Strand</B><BR/>
This problem required some careful reading (and re-reading for myself and probably others unfamiliar with genetics) in order to
figure out exactly what was going on.  Given a DNA strand that has up to 25 consecutive regions, that can either be normal ('N') or
special "CpG Island" regions ('R'), the task is to find the most likely sequence of N and R.  The inputs to the problem, include a
list of probabilities that a normal region will emit a particular nucleotide (one of adenine ('A'), guanine ('G'), thymine ('T'), or
cytosine ('C')), a list of probabilities that an island region will emit a particular nucleotide, the probability that the sequence
will switch from a normal region to an island region at any given point, the probability that the sequence will switch from an
island region to a normal one at any given point, and the actual nucleotide sequence being investigated.
</P>

<P>
The first element of the sequence is known to be a normal region.  This means that there can be at most 2^24 or roughly 16.8 million
possible sequences of N and R.  Only the most likely sequence of N and R is required however, and since the probability of each
state in the sequence can be expressed as a function of the previous state, it is possible to use dynamic programming to solve this
problem very quickly.
</P>

<P>
The ith state of the DNA sequence is either 'N' or 'R'.  The probability that the ith state will be 'N' is either the probability
that the state (i-1) will be 'N' and stay 'N' for the next state and emit the proper nucleotide at state i, or the probability that
the state (i-1) will be 'R' and then become 'N' for the next state and emit the proper nucleotide at state i.  Whichever is greater.
Likewise, the probability that the ith state will be 'R' is either the probability that the state (i-1) will be 'R' and stay 'R' for
the next state and emit the proper nucleotide at state i, or the probability that the state (i-1) will be 'N' and then become 'R'
for the next state and emit the proper nucleotide at state i.
</P>

<P>
The probability that the initial state will be 'N' is 1, and the probability that the initial state will be 'R' is 0.  i.e. PN[0]=1,
PR[0]=0.  If we call PNR the probability of switching from N to R, PRN the probability of switching from R to N,  NEMIT[i] the
probability of emitting the proper nucleotide in a 'N' region i, and REMIT[i] the probability of emitting the proper nucleotide in
an 'R' region i, we get the following general equations for the ith state for i&gt;0:
</P>

<PRE>
PN[i] = Maximum(PN[i-1]*(1-PNR)*NEMIT[i], PR[i-1]*PRN*NEMIT[i])
</PRE>

<PRE>
PR[i] = Maximum(PR[i-1]*(1-PRN)*REMIT[i], PN[i-1]*PNR*REMIT[i])
</PRE>

<P>
By finding PN and PR for all elements of the sequence, and keeping track of where the changeovers occur (from R to N and N to R) you
ultimately figure out which state it is best to end with, and then use your saved changeover results to produce the final output.
<B>radeye</B> and <B>ZorbaTHut</B> produced clear, concise examples of how to do this in Java and C++ respectively.
</P>


<P><BR/></P>
<IMG SRC="/i/m/Penwiper_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Penwiper<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=150527" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>
               </TD>
               <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            </TR>
            <TR>
               <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
            </TR>      
            <TR>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>   
            <TR>
               <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>
         </TABLE>
      </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

   <!-- Gutter -->
      <TD WIDTH="4" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
   <!-- Right Column Begins -->
      <TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->        
        </TD>
   <!-- Right Column Ends -->
   <!-- Gutter -->
      <TD WIDTH="10" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
   </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>


