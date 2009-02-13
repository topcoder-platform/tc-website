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
         <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC" HEIGHT="15"><A HREF="/?t=statistics&amp;c=srm103_prob" CLASS="bodyGeneric">&#160;Problem&#160;Set&#160;</A></TD>
         <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="/?t=statistics&amp;c=srm103_rookie" CLASS="bodyGeneric">&#160;Rookie&#160;Review&#160;</A></TD>
         <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" CLASS="bodyGeneric">&#160;Archive&#160;</A></TD>
          <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">&#160;Comments/Ideas/Want&#160;to&#160;Write?&#160;</A></TD>
      </TR>          
      </TABLE>
      </TD>
   </TR>               
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<B>Single Round Match 103</B><BR/>
Wednesday July 10, 2002
<P><B>Problem Set Analysis &amp; Opinion</B></P>

<P>
<B>Division-II - Level 1 - SpellBee</B>
</P>

<P>
The problem was straightforward and was testing how well you can type in the 4 different cases into your solution. One could easily determine if the last word is the same as a word to spell. The only thing left to determine if the list is consistent. All you have to do to check if list is consistent is to go through the list and check all adjacent words. If any second word doesn't starts with first one, the list doesn't agree. One thing to keep in mind is the length of both words and not run out of the word boundary.
</P>

<P>
<PRE>
After that is just 3 "if" statements:
If (spelled_correctly &amp;&amp; agree) return 4;
If (!spelled_correctly &amp;&amp; !agree) return 0;
If (spelled_correctly) return 1;
If (agree) return 3;
return 0;
</PRE>
</P>

<P>
<B>Common bugs:</B>
<OL>
   <LI> The size of every next word in the list should be more or equal then the size of the previous word</LI>
   <LI> The next word should start with previous word and NOT contain previous word.</LI>
</OL>
</P>

<P>
<B>Division - II Level 2 - HareNap</B> (reference Slavik solution)
</P>
 
<P>
The entire problem could be solved in 5 lines:
<OL>
   <LI> Calculate time for Hare to finish the route: Float H_time= (float) distance /hare_speed.</LI>
   <LI> Calculate time for Tortoise to finish the route: Float T_time = (float) distance /tortoise_speed.</LI> 
   <LI> Calculate time left for Hare to sleep: Float sleep_time = T_time-H_time-winTime+ 0.5+1e-6</LI>
   <LI> Take care of the special case: if sleep_time&lt;=0.0 return 0</LI>
   <LI> Return sleep_tim;</LI>
</OL>
</P>


<P>
I have added 0.5 to the sleep time to round the result to the nearest integer and added 1e-6 to fix the rounding error.
</P>


<P>
<B>Common bugs:</B>
<OL>
   <LI> Use of ceiling or flow functions without adding or subtracting 0.5 </LI>
   <LI> Round off error.  Example: 97,61,904,0 = 5.500084502,  84,35,750,8 = 4.5 
   (it would return 4 instead of 5 if you don't add extremely small number).</LI>
</OL>
</P>


<P>
<B>Division-II Level 3, Division-I Level 1</B> - RatRoute (reference Slavik solution)
</P>

<P>
Simple Brute Force recursive function would work fine for this problem:
<PRE>
1   int do_it(int x,int y,vector&lt;string&gt; &amp;enc,int dx,int dy) {
2      if (x==dx &amp;&amp; y==dy) return 1;
3      if (enc[y][x]=='X') return 0;
4      int total=0;
5      if (dx&gt;x) total+=do_it(x+1,y,enc,dx,dy);
6      if (dx&lt;x) total+=do_it(x-1,y,enc,dx,dy);
7      if (dy&gt;y) total+=do_it(x,y+1,enc,dx,dy);
8      if (dy&lt;y) total+=do_it(x,y-1,enc,dx,dy);
9      return total;
10   }
</PRE>
</P>

<P>
Where "x" and "y" are current coordinates and "dx" and "dy" are destination coordinates.
</P>

<P>
The worst case is when field is 10x10 and rat and cheese are located in different corners and no walls inside. It would take this function a little less then 185,000 iterations to find the solution.  Dynamic programming can also be used for this problem but is not needed due to the small size of the field. This approach was taken by almost all the coders who has submitted this problem.
</P>

<P>
<B>Common bugs:</B><BR/>
Some people confused Y and X coordinates and caused segmentation faults.
</P>



<P>
<B>Division-I Level 2 - ManyPics</B> (reference Slamin solution)
</P>


<P>
To solve this problem consider representing a board as a 32-bin unsigned integer. (The area of the canvas (width*height) will be between 2 and 32, inclusive so 32 bits should be enough). 
To actually solve the problem one can do the following:
</P>


<OL>
<LI>For each line create a set of all the solutions for entire canvas. Each solution can be represented as a 32-bit integer.
So if canvas is "...","..." - a set of all the solutions for the line of a size 2 will be 3,6,24,48,9,18,36</LI>
<LI>Find all the combinations of solutions for all lines where no two lines overlap each other. To check that 
two lines do not overlap each other one should use logical AND operator: 
<PRE>
if ((line1 &amp; line2) == 0) /* lines do not overlap */
</PRE>
<P>
I think Slamin has very good and clear solution on how to combine all lines together:
</P>
<PRE>
void doit(int n, int idx) {       
// n is current canvas and idx is current line
if (idx &gt;= v.size()) {   
// base case - all lines are added
res.insert(n);      
// insert solution into the set
return;
}
// find all not overlapping solutions for "n" field and line "idx"
for (set&lt;unsigned int&gt;::iterator it = v[idx].begin(); 
it != v[idx].end(); ++it) { 
// iterate through the set
if ((n &amp; *it) == 0) doit(n | *it, idx + 1); 
// pick next line
}
}
</PRE>
</LI>
<LI>
<P>
The only thing left to do is to return a size of the result set.
</P>

<P>
This problem would be much more difficult to solve if bitmaps were not chosen to represent canvas. The 
alternative to bitmap would be string and some coders such as ZorbaTHut chose a string to represent a 
canvas. Almost half of all successful solutions were using bitmap to represent canvas.
</P>
</LI>
</OL>

<B>Common bugs:</B><BR/>
<P>
Many solutions timed out - the wrong data structure was selected to represent a canvas and inefficient code to put lines together.
</P>

<P>
I think this problem was the hardest one in SRM 103 and has biggest rate of failed solutions. There were 65 submissions overall for this problem and only 27 of them have passed the system test.
</P>

<!--    pass   Failed    Challenged   
1   5   7   1   
2   7   2   3   
3   5   5   2   
4   6   7   0   
5   2   6   3   
6   2   2   0   
total:   27   29   9   -->  

<TABLE BORDER="1" CELLSPACING="0" CELLPADDING="0" WIDTH="80%" ALIGN="center">
   <TR>
      <TD CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><B>Room</B></TD>
      <TD CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><B>Pass</B></TD>
      <TD CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><B>Failed</B></TD>
      <TD CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><B>Challenged</B></TD>
   </TR>
   <TR>
      <TD CLASS="bodyText" ALIGN="center">1</TD>
      <TD CLASS="bodyText" ALIGN="center">5</TD>
      <TD CLASS="bodyText" ALIGN="center">7</TD>
      <TD CLASS="bodyText" ALIGN="center">1</TD>
   </TR>
   <TR>
      <TD CLASS="bodyText" ALIGN="center">2</TD>
      <TD CLASS="bodyText" ALIGN="center">7</TD>
      <TD CLASS="bodyText" ALIGN="center">2</TD>
      <TD CLASS="bodyText" ALIGN="center">3</TD>
   </TR>   
   <TR>
      <TD CLASS="bodyText" ALIGN="center">3</TD>
      <TD CLASS="bodyText" ALIGN="center">5</TD>
      <TD CLASS="bodyText" ALIGN="center">5</TD>
      <TD CLASS="bodyText" ALIGN="center">2</TD>
   </TR>   
   <TR>
      <TD CLASS="bodyText" ALIGN="center">4</TD>
      <TD CLASS="bodyText" ALIGN="center">6</TD>
      <TD CLASS="bodyText" ALIGN="center">7</TD>
      <TD CLASS="bodyText" ALIGN="center">0</TD>
   </TR>   
   <TR>
      <TD CLASS="bodyText" ALIGN="center">5</TD>
      <TD CLASS="bodyText" ALIGN="center">2</TD>
      <TD CLASS="bodyText" ALIGN="center">6</TD>
      <TD CLASS="bodyText" ALIGN="center">3</TD>
   </TR>   
   <TR>
      <TD CLASS="bodyText" ALIGN="center">5</TD>
      <TD CLASS="bodyText" ALIGN="center">2</TD>
      <TD CLASS="bodyText" ALIGN="center">2</TD>
      <TD CLASS="bodyText" ALIGN="center">0</TD>
   </TR>   
   <TR>
      <TD CLASS="bodyText" ALIGN="center"><B>Total</B></TD>
      <TD CLASS="bodyText" ALIGN="center"><B>27</B></TD>
      <TD CLASS="bodyText" ALIGN="center"><B>29</B></TD>
      <TD CLASS="bodyText" ALIGN="center"><B>9</B></TD>
   </TR>      
</TABLE>

<P>
<B>Division-I - Level 3 - CostlyOnes</B> (reference SnapDragon solution)
</P>

<P>
To solve this problems two approaches should be considered: divide and conquer and dynamic programming. Another key in solving this problem is to count numbers which CAN be represented with given number of 1s and then just deduce the required count (count of numbers which can NOT be represented).
</P>

<P>
To count all the numbers, which can be represented with given number of 1s, we should reduce a problem by dividing an UL (upper limit) into two parts:  
</P>

<PRE>
int part1 = 2^floor(log2(n))-1;   
int part2 = UL-part1+1;
So, if upper limit is 155     (10011011), 
2^floor(log2(n))=128     (10000000)  or it can be calculated as    
for( int x = 1; x*2 &lt;= UL; x *= 2 ); (SnapDragon)
and second number is 27     (00011011)
</PRE>

<P>
So, total count of numbers, which can be represented by given number of 1s, is
Do_it(127,C) + Do_it(27,C-1)  - recursive calls to itself.
</P>

<P>
So, the only thing left to do is to memorize the result and return it right away if this function was already called before (Dynamic Programming)
</P>

So, entire function would look like that (SnapDragon):

<PRE>
map&lt;pair&lt;int, int&gt;, int> mem; 
int do_it(int u, int c) { 
   if( c == 0 || u == 0 ) return 1;          
   // base case 
   int &amp;ret = mem[pair&lt;int,int&gt;(u,c)];       
   // DP map
   if (ret) return ret;             
   // if called before return the result
   for( int x = 1; x*2 &lt;= u; x *= 2 );          
   // find pivot point:  2^floor(log2(n))
   return (ret = do_it(x-1, c) + do_it(u-x, c-1));    
   // reduce the input and calculate separately
} 
</PRE>

<P>
The only thing left to do is to return count of numbers which cannot be represented: return UL+1-doit(UL,c); 
</P>

<P>
There were only 23 submissions for this problem and only 7 of them have failed challenges or system tests.
</P>

<IMG SRC="/i/m/slavik_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;slavik<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=160082" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
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


