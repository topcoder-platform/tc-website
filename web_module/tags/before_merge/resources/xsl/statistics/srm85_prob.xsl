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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm85_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" CLASS="bodyText">Editorial Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm85_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm85_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm85_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
         <TD VALIGN="top" CLASS="bodyText">&#160;</TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<P><B>Single Round Match 85</B><BR/>
May 1, 2002</P>
<P><B>Problem Set Analysis &amp; Opinion</B></P>
<P><B>Div. 1 - Easy: LarvaRace</B><BR/>
This problem was slightly more difficult than the typical easy problem, though the solution was still fairly straightforward.
Generally there are two approaches: one can either iterate through the time steps until a worm has reached the destination,
or one can determine how many time steps it will take for each worm to reach the destination.  In my opinion the former approach
was easiest, as there were no special cases to worry about.  The problem specification guaranteed that at least one worm would
eventually reach the destination, so all one had to do was move the worms in the proper manner.  For the second approach,
there was more room for error, as there may have been worms that never moved.  These worms would never reach the destination,
and this would have to be detected.  Many people that used this approach failed to note that worms that never move do reach
the destination if the destination is zero.  It was this test case in particular that broke three solutions in Room 1 during
the Challenge Phase.  Most people submitted this problem very quickly, but many of those people missed it for some reason or
another.  I think this was the trickiest problem in Div. 1 this match.</P>

<P><B>Div. 2 - Easy: Evil</B><BR/>
This problem wasn't evil at all.  It just consisted of computing the parity of each of a set of numbers. The parity of a number 
is simply the sum of its bits modulo 2, although there are many equivalent definitions. The only difficult aspect of the problem 
then is extracting the bits of a number.  While the problem statement went into great detail explaining one way of doing this, 
here are a few alternative methods that are much quicker to implement:<BR/>
<UL>
<LI>In Java: <TT>Integer.toBinaryString(v)</TT> returns a String containing the binary representation of v.  Thus the ith bit of a number v 
(where bit 0 is the least significant bit) can be obtained by<TT>String tmp = Integer.toBinaryString(v); bit = tmp.charAt(tmp.length() - i - 1);</TT></LI>
<LI>In C++ or Java: The expression <TT>(v &amp; (1 &lt;&lt; i))</TT> will be non-zero only if the ith bit of v is 1</LI>
</UL>
</P>

<P><B>Div. 1 - Medium / Div. 2 - Hard: RPSVari</B><BR/>
Like many medium problems, this was a case of reading the specification of a simulation carefully and properly implementing it. There were no 
real tricks to the problem, as long as one managed not to confuse array dimensions, etc., during implementation. Very few people missed this 
problem in Div. 1, and most people that submitted this problem in Div. 2 got it correct as well.</P>

<P><B>Div. 2 - Medium: TripleCode</B><BR/>
As with the RPSVari problem, this problem mostly consisted of following instructions.</P>

<P><B>Div. 1 - Hard: PrizeAward</B><BR/>
For those that were able to quickly formulate a combinatorical solution, this problem was nearly trivial. For others, however, it took 
a lot of time or effort to discover the solution (if at all).  Once the solution is correctly formulated, the implementation is actually quite simple.</P>

<P>The solution can be drived by expressing the problem as a recurrence relation.  Let S(p, c) be the solution to the problem for p prizes and c coders. 
First we will formulate the base cases.  We know that if there are no coders, there is only one way to distribute the prizes (that being no distribution at all), so S(0, c) = 1.
We also know that if there is no prize, then there is only one way to distribute it, so S(p, 0) = 1. With these base cases in place, we can now apply 
some basic combinatorics to solve S(p, c) for any values of p and c.</P>

<P>For i = 1 to c, we count how many ways i out of c coders can tie for a particular place. The solution to this is given by the
<A HREF="http://planetmath.org/encyclopedia/BinomialCoefficient.html" CLASS="bodyGeneric">choose function</A>, C(c, i) = c! / (i! * (c-i)!). For each value of i, we then multiply 
C(c, i) by a reduced version of the problem, where i prizes are split among i coders and the number of ways of distributing the remaining p - i prizes (if any)
among the remaining c - i coders are counted.  This is given by S(max(p - i, 0), c - i).</P>

<P>Thus our solution is S(0, c) = S(p, 0) = 1, S(p, c) = sum {1 &lt;= i &lt;= c} C(c, i) * S(max(p - i, 0), c - i). This is trivial to implement, and one can optimize by applying
<A HREF="http://www.nist.gov/dads/HTML/memoize.html" CLASS="bodyGeneric">memoization</A> techniques to both the C and S functions to avoid unnecessarily recomputing values (as done by <A HREF="/stat?c=round_stats&amp;rd=4145" CLASS="bodyGeneric">derkuci</A>).
To see how to iterate through the values of C(c, i) for some fixed c without computing factorials,
see derkuci's solution.</P>

<P>One can go even further and simply precompute all the possible answers, since the input constraints only permit 256 possible
inputs.  However, the straight-forward solution should be plenty quick enough for this problem (as evidenced by <A HREF="/stat?c=round_stats&amp;rd=4145" CLASS="bodyGeneric">ambrose's</A> solution).
Although there were few submissions for this problem, most of them were correct.</P>
<IMG SRC="/i/m/Logan_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Logan<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112902" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>   
          <P><BR/></P>               </TD>
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


