<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505520" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 103</span><br>Wednesday, July 10, 2002
<br><br>

<H1> 
The Problems 
</H1> 

<P>
<B>Division-II - Level 1 - SpellBee</B>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505520" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
<B>Division - II Level 2 - HareNap</B> &#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505520" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
(reference Slavik solution)
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
<B>Division-II Level 3, Division-I Level 1 - RatRoute</B>  &#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505520" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
(reference Slavik solution)
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
<B>Division-I Level 2 - ManyPics</B> &#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505520" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
(reference Slamin solution)
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
<B>Division-I - Level 3 - CostlyOnes</B> &#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505520" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
 (reference SnapDragon solution)
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

<p>
<img src="/i/m/slavik_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="160082" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>

