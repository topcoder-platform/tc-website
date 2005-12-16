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
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="100%">
    <TR>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
   <TR><TD COLSPAN="2" BGCOLOR="#43515E" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
   <TR>
      <TD VALIGN="top" BGCOLOR="#43515E" CLASS="moduleTitle">&#160; &#160;</TD>
      <TD BGCOLOR="#43515E" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
   </TR>                    
   <TR>
       <TD COLSPAN="2" VALIGN="top" BGCOLOR="#43515E">
      <TABLE BORDER="0" WIDTH="100%" CELLSPACING="1" CELLPADDING="" BGCOLOR="#FFFFFF">
      <TR>
         <!-- <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC" HEIGHT="15"><A HREF="/?t=statistics&amp;c=srm104_prob" CLASS="bodyGeneric">&#160;Problem&#160;Set&#160;</A></TD>
         <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="/?t=statistics&amp;c=srm103_rookie" CLASS="bodyGeneric">&#160;Rookie&#160;Review&#160;</A></TD> -->
         <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" CLASS="bodyGeneric">&#160;Archive&#160;</A></TD>
          <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">&#160;Comments/Ideas?&#160;</A></TD>
      </TR>          
      </TABLE>
      </TD>
   </TR>               
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<B>Single Round Match 114</B><BR/>
Tuesday, September 24, 2002
<P><B>Problem Set Analysis &amp; Opinion</B></P>


<font size="+2">
  <b>Snail</b>
</font>
<BR/>

    Used as: Division-II, Level 1
            :<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">250 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">235 / 256 (91.80%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">195 / 235 (82.98%) 
</td>
      </tr>
     <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">225.28 points
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>slowjoe</b> for 248 points
                </td>
      </tr>
    </table>
  </blockquote>
  
<P>
Most people got this one pretty easily. You just had to set up a simple loop to count the number of days, and update the position of the snail within the well for each day. Once the position on any given day is outside of the well, it 's time for the function to return:
</P>

<P>
<PRE>
int days=0;
while (depth>0) {
   days++;
   depth-=dayUp;
   if (depth&lt;=0) return days;
   depth+=nightDown;   
}
</PRE>
</P>

<P>
The areas where most people made mistakes on this one were starting with the wrong day (i.e. starting at 1 instead of 0) and using the wrong exit condition (i.e. depth==0 instead of depth&lt;=0).
</P>

<P>
Reference Implementation: <B>Penwiper</B>, practice room
</P>

<p>&#160;</p>

<font size="+2">
  <b>DirSort</b>
</font>
<BR/>

    Used as: Division II - Level 2 &amp; Division I - Level 1 
   :<blockquote>
    <table cellspacing="2">
   <tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-II stats</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">600 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">172 / 256 (67.19%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">118 / 172 (68.60%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">372.12 points
                </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>Wombat80</b> for 569.90  points
                </td>
      </tr>
    </table>
   <BR/>
    <table cellspacing="2">
   <tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-I stats</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">350 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">141 / 146 (96.58%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">128 / 141 (90.78%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">273.11 points
                </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>ZorbaTHut</b> for 344.15   points
                </td>
      </tr>
    </table>
  </blockquote>
  <P>
  As is evident from the above statistics, most people were able to submit this problem, and most ended up solving it successfully. The obvious approach for this problem was to implement a simple loop or nested loops to sort the directories in increasing order. The code that you use to compare two directories must first compare the directories on the basis of how many "forward-slashes" they have. The fewer the number of forward-slashes, the earlier the directory should be in the returned string array. If two given directories have the same number of forward slashes it becomes necessary to implement some sort of comparison function to see which one should come first.
  </P>
  <P>
The comparison function used to compare two directories with equal numbers of forward-slashes should lexicographically compare the text between each set of forward slashes, starting with the text between the first set of forward-slashes. The comparison function should return as soon as the text being compared differs, i.e. it could return -1 to indicate that directory1 is less than directory2, or +1 to indicate that directory1 is greater than directory2.
  </P>
  <P>
Virtually everyone had the right idea for this problem. The mistakes that were made were usually indexing problems or string out of bounds errors.
  </P>

  <font size="+2">
  <b>Tile</b>
</font>
<BR/>

    Used as: Division II - Level 3 
   :<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">900 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">49 / 146 (33.56%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">3 / 49 (6.12%) 
</td>
      </tr>
     <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">421.59 points
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>vorthys</b> for 590.86 points
                </td>
      </tr>
    </table>
   </blockquote>
  <P>
  Only three coders (<B>vorthys</B>, <B>puzzlehacker</B>, and <B>vesko8</B>) managed to solve this problem correctly. Given the low submission numbers and success rate for this problem, it probably should have been worth a bit more. All three of them used dynamic programming in their solutions. If you tried to solve this problem by trying all of the tile combinations until you got beyond 100,000, then your solution would time out for situations in which there are a large number of tiles that do not add up to 64 easily. For example, take 50 3x3 tiles. No combination of 3x3 tiles adds up to 64, but there are literally hundreds of millions of combinations (approx. 50C8) that come close and would have to be tried!
  </P>
  <P>
Instead, set up an array of 65 values which represents the number of tile combinations that results in a given total ranging from 0 to 64 inclusive. Initialize the zero element of this array to 1, and the rest to zero. Loop over the number of tiles, and the combination totals as follows:
  </P>
  <PRE>
  for (int i=0;i&lt;numtiles;i++) {
   for (int j=64;j&gt;=tilesize[i];j--) {
      numcombos[j]+=numcombos[j-tilesize[i]];
   }
}
  </PRE>

  <P>
  Your return value is simply numcombos[64], the number of tile combinations that add up to an area of 64. Of course if this number is greater than 100,000 return 0 instead.
  </P>
  <P>
  Reference Implementation: <B>vorthys</B>
  </P>

  <font size="+2">
  <b>Highcard</b>
</font>
<BR/>

    Used as: Division I - Level 2 
   :<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">450 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">134 / 146 (91.78%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">117 / 134 (87.31%) 
</td>
      </tr>
     <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">375.71 points
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>radeye</b> for 443.15 points
                </td>
      </tr>
    </table>
   </blockquote>

  <P>
     Remind me to never play cards with Chris. This problem required way less work than most Div I - Level 2 problems. Chris is cheating by looking at his friend's cards and optimally re-arranging his own cards. The simplest way for Chris to think about optimizing his own cards is to sort both the hand that he is dealt and the hand that his friend is dealt. Chris then applies his best card to the best card his friend has which is also lower than Chris' best card. Chris then applies his second best card, to the highest card left of his friend's which is also lower than Chris' second best card, and so on. Here's a pseudo-code snippet for Chris' strategy, based on my solution:
  </P>
<PRE>  
Sort(chriscards);
Sort(friendcards);
int friend_index = number of friend cards - 1
int numWinners=0;
int chris_index = friend_index
while (friend_index>=0) {
   if (chris[chris_index]&gt;friend[friend_index]) {
      numWinners++;
      chris_index--;
      friend_index--;
   }
   else {
      friend_index--;
   }
}
return nW;
</PRE>

<P>Reference Implementation: <B>Penwiper</B></P>

  <font size="+2">
  <b>Pipes</b>
</font>
<BR/>

    Used as: Division I - Level 3 
   :<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">900 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">53 / 146 (36.30%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">37 / 53 (69.81%) 
</td>
      </tr>
     <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">482.34 points
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>radeye</b> for 733.71 points
                </td>
      </tr>
    </table>
   </blockquote>
   
  <P>
  This problem was reasonably straightforward, so far as Div I - Level 3 problems go. You are given a map describing how pipes are buried in the ground, and need to calculate how much pressure is available in one of the lowest buried pipes. The pressure available in the first pipe on the top level is defined as 100. The pressure in each pipe below the first level is calculated based on the pipes from the previous level. If two pipes are directly on top of one another, then all of the pressure from the top pipe gets transferred to the pipe below it. If there is a horizontal separation between the two pipes however, the amount of pressure transferred to the lower pipe is inversely proportional to the horizontal distance, such that if two pipes p1 and p2 are distances x1 and x2 from the higher pipe, then the amount of pressure transferred to p1 will be (x2/x1) times the amount of pressure transferred to p2. I'm not certain if this is how pressure is really distributed between vertical pipes, but it sounds reasonable. 
  </P>
  <P>
Given n pipes separated by the distances x1, x2, x3, ..., xn (where none of the xi are equal to zero) from a higher pipe with pressure P, you need to do the following to calculate p(i), the pressure in each of the lower n pipes:
  </P>
  
  <OL>
   <LI>Find the smallest distance, and call it xmin.</LI>
   <LI>Calculate a pressure ratio for each pipe: pratio(i) = xmin / x(i)</LI>
   <LI>Sum all of the ratios.</LI>
   <LI>Calculate pressure in each pipe as: p(i) = pratio(i) / (Sum of ratios) * P and round down in all cases.</LI>
  </OL>
  
  <P>
  Every solution that I looked at calculated the ratios using floating-point arithmetic. Finding a sum of these ratios without using floating-point arithmetic would not be possible for some of the cases of large maps with many pipes. Some people added on things like .00000001 to each value of p(i) to avoid floating point errors, but this proved to be unnecessary, at least for all of the system test cases. 
  </P>
  <P>
  Once you have the above algorithm for calculating the pressures of pipes going from one level to the next, the problem becomes quite simple. Set up a loop to start at the first level and go down to the second last level. At each pipe location in a given level, you start with knowledge of what that pipe's pressure is. Use the above algorithm to find out how much pressure that pipe contributes to each of the pipes below it. Once the loop is completed, you then simply have to return the pressure of the pipe on the last level whose zero-based index is given as an input parameter to the problem. 
  </P>
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


