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
<B>Single Round Match 128</B><BR/>
Monday, January 6, 2003
<P><B>Problem Set Analysis &amp; Opinion</B></P>


<font size="+2">
  <b>CommonDigits</b>
</font>
<BR/>

    Used as: Division-II, Level 1
            :<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">250</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">180 / 219  (82.19%) </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">132 / 180  (73.33%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>konsept</b> for 245.66 points 
                </td>
      </tr>
    </table>
  </blockquote>

  
<P>
Reference implementation: <B>brett1479</B> (practice room)
</P>

<h4>Implementation</h4>
<P>
As the statistics show, most people found this problem pretty doable.  Coders were asked to return the digit value that occurred most frequently, breaking ties by favoring higher order digits.  Java users could use code like this:
</P>

<P>
<PRE>
   String temp = ""+inputInt;    
immediately gaining access to the digits of the input integer.  
C++ users could use sprintf:
   char temp[20];
   sprintf(temp,"%d",inputInt);
or stringstreams:
   stringstream ss;
   ss&lt;&lt;inputInt;
   string temp = ss.str();
</PRE>
to the same effect.  Once all the digits were in a string-like structure, a simple loop construct that tallied digit counts, and broke ties based on left-most position would suffice.
</P>


<p>&#160;</p>

<font size="+2">
  <b>PermutationCycles</b>
</font>
<BR/>

    Used as: Division-II, Level 2:<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">550</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">107 / 219  (48.86%) </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">86 / 107  (80.37%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>gali</b> for 529.64 points
                </td>
      </tr>
    </table>
  </blockquote>

<P>
Reference implementation: <B>brett1479</B> (practice room)
</P>

<BR/>
<h4>Implementation</h4>

<P>
Although slightly harder than the Easy problem, many quickly figured out what was necessary to solve the Medium.  
Coders were given n distinct integers between 1 and n inclusive, jumbled up in an arbitrary order.  
This ordering represented a permutation of the given integers.  For example:
</P>


<PRE>
int inputArray[] = {3,5,4,1,2}; ,
means if you had the integers {1,2,3,4,5} after applying the 
given permutation you would have the 
integers {3,5,4,1,2}.  In other words, 1 maps to 3, 2 maps to 5, 3 maps to 4, 
4 maps to 1, and 5 maps to 2.
</PRE>

<P>The problem asked for how many disjoint cycles were required to represent the given permutation.  
The definition of a disjoint cycle comes out of Abstract Algebra, specifically from the theory of 
Permutation Groups.  Basically, start with a number between 1 and n.  Then figure out what it maps to.  
Then figure out what that number maps to.  Continue this process until you reach the number you began with.  
For example, say we start with 1 in the example above.  Then 1 maps to 3, 3 maps to 4, and 4 maps to 1.  
This means there is a cycle denoted by (1, 3, 4).  Another disjoint cycle (disjoint meaning, it doesn't 
share any numbers with the previous cycle) is (2, 5).   Since we have accounted for all of the 5 numbers 
there is a total of 2 disjoint cycles.  Java code to implement this reasoning works as follows:
</P>
<PRE>
int count = 0;
boolean[] marked = new boolean[inputArray.length]; //for marking used numbers
for (int i = 0; i &lt; marked.length; i++) {   //make sure to account for all numbers
   if (marked[i]) continue;      //we already accounted for this number
   int j = i;    //temp used to store the value we are starting at
   count++;
   while (mark[j]) {
      mark[j] = true;
      j = inputArray[i] -1;    //  '-1' needed since array values are 1-based
            //  and we need 0-based indexing
} 
}
return count;
</PRE>

<P>
In my opinion Abstract Algebra is one of the most entertaining fields in math.  If you want to take 
an interesting course in a university setting, or acquire a challenging hobby Algebra may be just what 
you are looking for (unless you cringe at the sight of anything math related).
</P>

<p>&#160;</p>

<font size="+2">
  <b>Indentation</b>
</font>
<BR/>

    Used as: Division-II, Level 3
            :<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">1100</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">31 / 219  (14.16%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">5 / 31  (16.13%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>coshx</B> for 571.10 points  
                </td>
      </tr>
    </table>
  </blockquote>

 

    Used as: Division-I, Level 2
            :<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">550</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">93 / 119  (78.15%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">35 / 93  (37.63%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>venco</B> for 448.47 points  
                </td>
      </tr>
    </table>
  </blockquote>
<P>
Reference implementation: <B>brett1479</B> (practice room)
</P>

<BR/>
<h4>Implementation</h4>

<P>
This problem, purely in terms of coding time, was arguably the hardest problem of the round.  
Coders were asked to determine how many blocks were present in a given piece of code.  To make 
things harder comments denoted by '#' symbols, and line-joining operations denoted by '##' symbols 
could appear just about anywhere in the input.  The basic plan is to first rid the code of the annoying 
comments and line-joins, and then worry about the block structuring.  The former is performed by 
condensing the input into one huge string (lines delimited by some unused character) and looping 
through it, or looping through the characters each element of the input one at a time.  
</P>

<P>
With the input void of comments and line-joins you can now check the block structure.  The 
important facts to realize are: 1) Blank lines should be ignored, 2) The only thing that matters on 
each line is where the first significant character is located, 3) Further indented lines start new 
blocks, and 4) Less indented lines close all open further indented blocks and must match the 
indentation of a previously open block.  A simple way to implement this "block-counter" is to 
use a stack that holds the indentations of each line, and a counter to hold the number of blocks 
encountered.  Process each line as follows: If the indentation value of the current line is greater 
than the top of the stack, push its value on the stack and increment your totalNumBlock counter.  
If it is less than the top of the stack, keep popping values off the stack until you find a value 
equal to the current indentation.  If you never find such a value return -1.  When you are done 
processing all of the lines return the value of totalNumBlock
</P>


<p>&#160;</p>

<font size="+2">
  <b>Scytale</b>
</font>
<BR/>
    Used as: Division-I, Level 1
            :<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">250</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">117 / 119  (98.32%) </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">114 / 117  (97.44%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>antimatter</B> for 248.92 points  
                </td>
      </tr>
    </table>
  </blockquote>

<P>
Reference implementation: <B>brett1479</B> (practice room)
</P>
 

<BR/>
<h4>Implementation</h4>
<P>
Most division 1 coders raced through this problem, a number of whom submitted solutions before 3 minutes had elapsed.  The gist of the problem is, n strings have been concatenated together one character at a time.  To get the ith string out of the scrambled mess you simply extract all characters whose position mod n is 0.  The problem gave you the scrambled string and the number of original strings (circumference in the problem) and asked for all the original strings.  Java code that implements this logic is:
</P>

<PRE>
String[] ret = new String[n];  //Decoded strings to be returned
   java.util.Arrays.fill(ret,"");   //Initialize array to contain empty strings
for (int i = 0; i &lt; codedMessage.length(); i++)  //Loop over encoded string
ret[i%n]+=codedMessage.charAt(i); //Place char on the appropriate string
   return ret;  //Return the decoded strings
</PRE>


<p>&#160;</p>

<font size="+2">
  <b>SkewDecimal</b>
</font>
<BR/>
    Used as: Division-I, Level 3
            :<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">950</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">27 / 119  (22.69%) </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">17 / 27  (62.96%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>WishingBone</B> for 694.52 points  
                </td>
      </tr>
    </table>
  </blockquote>

<P>
Reference implementation: <B>brett1479</B> (practice room)
</P>
<BR/>
<h4>Implementation</h4>

<P>
This problem didn't require a lot of code, but its underlying concept was less than obvious.  
Participants were asked to implement skew-decimal multiplication.  A positive number written 
in skew-decimal format is composed of the digits '0'-'9' and 'X' such that: 1) There are no 
leading zeros, and 2) Once an 'X' occurs in the number all following digits (if any) must be 
zeros.  The problem also stated the recurrence relation that correlates the positive integers 
with the skew-decimal numbers:
</P>

<PRE>
Integer 1 corresponds to Skew 1
Integer N corresponds to (Skew N-1) + 1
</PRE>

<P>
Incrementing a skew-decimal number is slightly weird.  If the number contains an 'X', 
incrementing the number means changing the 'X' to a '0' and incrementing the number to 
its left (noting the special case that '9'+1 = 'X').  If the number doesn't contain an 'X' 
increment its rightmost digit.  For example, (Skew 1X0)+1=Skew 200  and (Skew 99)+1=9X .  
The trick to this problem is realizing how much each digit in the skew-decimal number is worth.  
Notice that you must increment a particular digit 10 times to get it to change from 0 to 'X'.  
Then you must increment the entire number once to change the newly created 'X' to '0' thus 
incrementing the next higher digit.  Consider the following examples:
</P>
<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText"><b>Skew Number</b></td>
        <td style="background: #eee;" class="bodyText"><b>Integer Value</b></td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">X</td>
        <td style="background: #eee;" class="bodyText">10</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">10</td>
        <td style="background: #eee;" class="bodyText">11</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">1X</td>
        <td style="background: #eee;" class="bodyText">21</td>
      </tr>      
      <tr>
        <td style="background: #eee;" class="bodyText">20</td>
        <td style="background: #eee;" class="bodyText">22</td>
      </tr>       
      <tr>
        <td style="background: #eee;" class="bodyText">X0</td>
        <td style="background: #eee;" class="bodyText">110</td>
      </tr>      
      <tr>
        <td style="background: #eee;" class="bodyText">100</td>
        <td style="background: #eee;" class="bodyText">111</td>
      </tr> 
      <tr>
        <td style="background: #eee;" class="bodyText">200</td>
        <td style="background: #eee;" class="bodyText">222</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">X00</td>
        <td style="background: #eee;" class="bodyText">1110</td>
      </tr>      
      <tr>
        <td style="background: #eee;" class="bodyText">1000</td>
        <td style="background: #eee;" class="bodyText">1111</td>
      </tr>      
    </table>
  </blockquote>

<P>
Noticing a pattern in the above table we can see that the digit values from right to left 
(least order to highest order) are thus: 1,11,111,1111,11111,...   Using this fact it is then easy to 
convert each skew-decimal number to a long, multiply the longs together, and convert 
the long back to a skew-decimal value.
</P>

<IMG SRC="/i/m/brett1479_mug.jpg" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;brett1479<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=251317" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
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


